﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using System.Threading;
using static gfoidl.Tools.Intrinsics.Printer;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator8
    {
        // Base32 encoding - in ascii sort order for easy text based sorting
        private static readonly char[] s_encode32Chars = "0123456789ABCDEFGHIJKLMNOPQRSTUV".ToCharArray();

        // Seed the _lastConnectionId for this application instance with
        // the number of 100-nanosecond intervals that have elapsed since 12:00:00 midnight, January 1, 0001
        // for a roughly increasing _lastId over restarts
        private static long _lastId = DateTime.UtcNow.Ticks;

        public static long LastId
        {
            get => _lastId;
            set => _lastId = value;
        }

        public static string GetNextId() => GenerateId(Interlocked.Increment(ref _lastId));

        private static string GenerateId(long id)
        {
            return string.Create(13, id, (buffer, value) => Encode(buffer, value));
        }

        private static void Encode(Span<char> buffer, long value)
        {
            if (Ssse3.IsSupported)
            {
                EncodeSsse3(buffer, value);
            }
            else
            {
                char[] encode32Chars = s_encode32Chars;

                buffer[12] = encode32Chars[value & 31];
                buffer[11] = encode32Chars[(value >> 5) & 31];
                buffer[10] = encode32Chars[(value >> 10) & 31];
                buffer[9] = encode32Chars[(value >> 15) & 31];
                buffer[8] = encode32Chars[(value >> 20) & 31];
                buffer[7] = encode32Chars[(value >> 25) & 31];
                buffer[6] = encode32Chars[(value >> 30) & 31];
                buffer[5] = encode32Chars[(value >> 35) & 31];
                buffer[4] = encode32Chars[(value >> 40) & 31];
                buffer[3] = encode32Chars[(value >> 45) & 31];
                buffer[2] = encode32Chars[(value >> 50) & 31];
                buffer[1] = encode32Chars[(value >> 55) & 31];
                buffer[0] = encode32Chars[(value >> 60) & 31];
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void EncodeSsse3(Span<char> buffer, long value)
        {
            PrintHeader();
            Print(value, nameof(value));

            Vector128<sbyte> indices = GetIndices(value);
            Vector128<sbyte> res = Lookup(indices);
            Store(buffer, res);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static Vector128<sbyte> GetIndices(long value)
        {
            // input = [xxxxxxxE|EEEEDDDD|DCCCCCBB|BBBAAAAA]
            Vector128<sbyte> input = Vector128.Create(value, value >> 5 * 8).AsSByte();

            // an input sequence (5 bytes) has this layout (on little endian)
            // [????????|????????|????????|ggghhhhh|efffffgg|ddddeeee|bbcccccd|aaaaabbb]
            //   byte 7   byte 6   byte 5   byte 4   byte 3   byte 2   byte 1   byte 0
            //
            // bytes 7, 6, 5 are next sequence / can be ignored
            //
            // output for Base32hex should be
            // [000hhhhh|000ggggg|000fffff|000eeeee|000ddddd|000ccccc|000bbbbb|000aaaaa]
            //
            // shuffling changes the order of bytes, so unpacking is easier: 1, 0, 2, 1, 3, 2, 4, 3
            // ^ marks the bits of interest
            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            //        ^^ ^^^^^^^^^    ^^^^ ^^^^^^     ^^^^^^ ^^^^^    ^^^^^^^^ ^^
            //
            // For ASP.NET Core Kestrel the order is reversed, to make it sortable lexicographically.
            // So the output should be
            // [000aaaaa|000bbbbb|000ccccc|000ddddd|000eeeee|000fffff|000ggggg|000hhhhh]
            //
            // shuffling to: 4, 3, 3, 2, 2, 1, 1, 0
            // [aaaaabbb|bbcccccd|bbcccccd|ddddeeee|ddddeeee|efffffgg|efffffgg|ggghhhhh]
            //  ^^^^^^^^ ^^         ^^^^^^ ^^^^         ^^^^ ^         ^^^^^^^ ^^^^^^^^

            Vector128<sbyte> shuffleVec = ReadVector<sbyte, sbyte>(s_shuffleData);
            Vector128<sbyte> vec = Ssse3.Shuffle(input, shuffleVec);

            Print(input, nameof(input));
            Print(vec, nameof(vec), insertEmpyLineAfter: true);

            // Index A+C
            // input:  [aaaaabbb|bbcccccd|bbcccccd|ddddeeee|ddddeeee|efffffgg|efffffgg|ggghhhhh]
            // mask:   [aaaaa000|00000000|00ccccc0|00000000|00000000|00000000|00000000|00000000]
            // output: [000aaaaa|00000000|000ccccc|00000000|00000000|00000000|00000000|00000000]
            Vector128<sbyte> mask = ReadVector<byte, sbyte>(s_maskData);
            Vector128<ushort> facAC = ReadVector<byte, ushort>(s_facACData);
            Vector128<sbyte> indexAC = Sse2.MultiplyHigh(vec.AsUInt16(), facAC).AsSByte();
            indexAC = Sse2.And(indexAC, mask);
            Print(indexAC, nameof(indexAC));

            // Index B+D
            // input:  [aaaaabbb|bbcccccd|bbcccccd|ddddeeee|ddddeeee|efffffgg|efffffgg|ggghhhhh]
            // mask:   [00000bbb|bb000000|0000000d|dddd0000|00000000|00000000|00000000|00000000]
            // output: [00000000|000bbbbb|00000000|000ddddd|00000000|00000000|00000000|00000000]
            mask = Sse2.ShiftRightLogical(mask.AsInt64(), 8).AsSByte();
            Vector128<ushort> facBD = ReadVector<byte, ushort>(s_facBDData);
            Vector128<sbyte> indexBD = Sse2.MultiplyHigh(vec.AsUInt16(), facBD).AsSByte();
            indexBD = Sse2.And(indexBD, mask);
            Print(indexBD, nameof(indexBD));

            // Index E+G
            // input:  [aaaaabbb|bbcccccd|bbcccccd|ddddeeee|ddddeeee|efffffgg|efffffgg|ggghhhhh]
            // mask:   [00000000|00000000|00000000|00000000|0000eeee|e0000000|000000gg|ggg00000]
            // output: [00000000|00000000|00000000|00000000|000eeeee|00000000|000ggggg|00000000]
            mask = Sse2.ShiftRightLogical(mask.AsInt64(), 24).AsSByte();
            Vector128<short> facEG = ReadVector<byte, short>(s_facEGData);
            Vector128<sbyte> indexEG = Sse2.MultiplyLow(vec.AsInt16(), facEG).AsSByte();
            indexEG = Sse2.And(indexEG, mask);
            Print(indexEG, nameof(indexEG));

            // Index F+H
            // input:  [aaaaabbb|bbcccccd|bbcccccd|ddddeeee|ddddeeee|efffffgg|efffffgg|ggghhhhh]
            // mask:   [00000000|00000000|00000000|00000000|00000000|0fffff00|00000000|000hhhhh]
            // output: [00000000|00000000|00000000|00000000|00000000|000fffff|00000000|000hhhhh]
            Vector128<sbyte> maskH = ReadVector<byte, sbyte>(s_maskHData);
            Vector128<sbyte> maskF = ReadVector<byte, sbyte>(s_maskFData);
            Vector128<sbyte> maskedH = Sse2.And(vec, maskH);
            Vector128<sbyte> maskedF = Sse2.And(vec, maskF);
            Vector128<sbyte> indexF = Sse2.ShiftRightLogical(maskedF.AsUInt64(), 2).AsSByte();
            Vector128<sbyte> indexFH = Sse2.Or(indexF, maskedH);
            Print(indexFH, nameof(indexFH));

            // Merge indices
            indexAC = Sse2.Or(indexAC, indexBD);
            indexEG = Sse2.Or(indexEG, indexFH);

            Vector128<sbyte> indices = Sse2.Or(indexAC, indexEG);

            Print(indices, nameof(indices));

            Vector128<sbyte> reverseMask = ReadVector<sbyte, sbyte>(s_reverseMaskData);
            indices = Ssse3.Shuffle(indices, reverseMask);
            Print(indices, $"{nameof(indices)}-1");

            return indices;
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static Vector128<sbyte> Lookup(Vector128<sbyte> indices)
        {
            Vector128<sbyte> shift = ReadVector<byte, sbyte>(s_shiftData);
            Vector128<sbyte> gt9 = Sse2.CompareGreaterThan(indices, ReadVector<byte, sbyte>(s_gt9Data));
            Vector128<sbyte> shiftAdjustment = Sse2.And(gt9, ReadVector<byte, sbyte>(s_shiftAdjustmentData));
            shift = Sse2.Add(shift, shiftAdjustment);

            Vector128<sbyte> res = Sse2.Add(indices, shift);

            return res;
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void Store(Span<char> buffer, Vector128<sbyte> res)
        {
            Print(res, nameof(res), insertEmptyLineBefore: true);
            Print(res, nameof(res), printAsScii: true);

            Vector128<sbyte> zero = Vector128<sbyte>.Zero;
            Vector128<sbyte> c0 = Sse2.UnpackLow(res, zero);
            Vector128<sbyte> c1 = Sse2.UnpackHigh(res, zero);

            // sizeof(buffer) = 26 = 2*13
            ref byte b = ref Unsafe.As<char, byte>(ref MemoryMarshal.GetReference(buffer));

            // sizeof(c0) = 16
            Unsafe.WriteUnaligned(ref b, c0);
            b = ref Unsafe.Add(ref b, Vector128<sbyte>.Count);

            // 26 - 16 = 10 bytes remain

            // double has better code-gen than long -- https://github.com/dotnet/coreclr/issues/24710
            // sizeof(d) = 8
            double d = c1.AsDouble().ToScalar();
            Unsafe.WriteUnaligned(ref b, d);
            b = ref Unsafe.Add(ref b, sizeof(double));

            // 10 - 8 = 2 bytes remain

            short s = c1.AsInt16().GetElement(4);   // 4 = (Vector128<sbyte>.Count - sizeof(long)) / sizeof(short)
            Unsafe.WriteUnaligned(ref b, s);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static Vector128<TVector> ReadVector<T, TVector>(ReadOnlySpan<T> span)
            where T : unmanaged
            where TVector : unmanaged
        {
            ref T r = ref MemoryMarshal.GetReference(span);
            return Unsafe.As<T, Vector128<TVector>>(ref r);
        }
        //---------------------------------------------------------------------
        private static ReadOnlySpan<sbyte> s_shuffleData => new sbyte[16]
        {
            // 1, 0,     2, 1,  3,  2,  4,  3,
            // 9, 8, 10, 9, 11, 10, 12, 11

            // Reversed order as in ASP.NET Core Kestrel
            // 12, 11, 11, 10, 10, 9, 9, 8,
            //  4,  3,  3,  2,  2, 1, 1, 0

            0, 1, 1,  2,  2,  3,  3,  4,
            8, 9, 9, 10, 10, 11, 11, 12,
        };

        private static ReadOnlySpan<byte> s_maskData => new byte[16]
        {
            // 0x_1F_00_1F_00_00_00_00_00
            0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x1F,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x1F,
        };

        private static ReadOnlySpan<byte> s_facACData => new byte[16]
        {
            // c = 1 << (16 - 1);
            // a = 1 << (16 - 3);
            // facAC = (a << 16) | c;
            0x00, 0x80, 0x00, 0x20,
            0x00, 0x80, 0x00, 0x20,
            0x00, 0x80, 0x00, 0x20,
            0x00, 0x80, 0x00, 0x20
        };

        private static ReadOnlySpan<byte> s_facBDData => new byte[16]
        {
            // d = 1 << (16 - 4);
            // b = 1 << (16 - 6);
            // facBD = (b << 16) | d;
            0x00, 0x10, 0x00, 0x04,
            0x00, 0x10, 0x00, 0x04,
            0x00, 0x10, 0x00, 0x04,
            0x00, 0x10, 0x00, 0x04
        };

        private static ReadOnlySpan<byte> s_facEGData => new byte[16]
        {
            // g = 1 << 3;
            // e = 1 << 1;
            // facEG = (e << 16) | g;
            0x08, 0x00, 0x02, 0x00,
            0x08, 0x00, 0x02, 0x00,
            0x08, 0x00, 0x02, 0x00,
            0x08, 0x00, 0x02, 0x00
        };

        private static ReadOnlySpan<byte> s_maskHData => new byte[16]
        {
            // 0x_00_00_00_00_00_00_00_1FL
            0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
        };

        private static ReadOnlySpan<byte> s_maskFData => new byte[16]
        {
            // 0x_00_00_00_00_00_7C_00_00
            0x00,0x00,0x7C,0x00,0x00,0x00,0x00,0x00,
            0x00,0x00,0x7C,0x00,0x00,0x00,0x00,0x00
        };

        private static ReadOnlySpan<sbyte> s_reverseMaskData => new sbyte[16] { 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 0, 0 };

        private const byte c0 = (byte)'0';
        private const byte c1 = (byte)('A' - '0' - 10);
        private static ReadOnlySpan<byte> s_shiftData => new byte[16] { c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 };
        private static ReadOnlySpan<byte> s_gt9Data => new byte[16] { 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 };
        private static ReadOnlySpan<byte> s_shiftAdjustmentData => new byte[16] { c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1 };
    }
}
