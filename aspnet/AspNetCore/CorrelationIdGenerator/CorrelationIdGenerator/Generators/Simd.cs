// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator5
    {
        public static bool EnablePrint { get; set; } = true;

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

        private static void EcondeSeq(Span<char> buffer, long value)
        {
            Span<byte> tmp = stackalloc byte[]
            {
                (byte)((value >> 60) & 0x1F),
                (byte)((value >> 55) & 0x1F),
                (byte)((value >> 50) & 0x1F),
                (byte)((value >> 45) & 0x1F),
                (byte)((value >> 40) & 0x1F),
                (byte)((value >> 35) & 0x1F),
                (byte)((value >> 30) & 0x1F),
                (byte)((value >> 25) & 0x1F),
                (byte)((value >> 20) & 0x1F),
                (byte)((value >> 15) & 0x1F),
                (byte)((value >> 10) & 0x1F),
                (byte)((value >> 5) & 0x1F),
                (byte)(value & 0x1F),
            };

            for (int i = 0; i < tmp.Length; ++i)
            {
                byte val = tmp[i];
                char shift = val < 10 ? '0' : (char)('A' - 10);
                char r = (char)(val + shift);
                buffer[i] = r;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void EncodeSsse3(Span<char> buffer, long value)
        {
            PrintHeader();
            Print(value, nameof(value));
#if MASK_VAR_A
            Vector128<sbyte> indices = default;
            indices = indices.WithElement(0, (sbyte)((value >> 60) & 0x1F));
            indices = indices.WithElement(1, (sbyte)((value >> 55) & 0x1F));
            indices = indices.WithElement(2, (sbyte)((value >> 50) & 0x1F));
            indices = indices.WithElement(3, (sbyte)((value >> 45) & 0x1F));
            indices = indices.WithElement(4, (sbyte)((value >> 40) & 0x1F));
            indices = indices.WithElement(5, (sbyte)((value >> 35) & 0x1F));
            indices = indices.WithElement(6, (sbyte)((value >> 30) & 0x1F));
            indices = indices.WithElement(7, (sbyte)((value >> 25) & 0x1F));
            indices = indices.WithElement(8, (sbyte)((value >> 20) & 0x1F));
            indices = indices.WithElement(9, (sbyte)((value >> 15) & 0x1F));
            indices = indices.WithElement(10, (sbyte)((value >> 10) & 0x1F));
            indices = indices.WithElement(11, (sbyte)((value >> 5) & 0x1F));
            indices = indices.WithElement(12, (sbyte)(value & 0x1F));

            Print(indices, nameof(indices));
#elif MASK_VAR_B
            // input = [xxxxxxxE|EEEEDDDD|DCCCCCBB|BBBAAAAA]
            Vector128<sbyte> input = Vector128.Create(value, value >> 5 * 8).AsSByte();

            // an input sequence (5 bytes) has this layout (on little endian)
            // [????????|????????|????????|ggghhhhh|efffffgg|ddddeeee|bbcccccd|aaaaabbb]
            //   byte 7   byte 6   byte 5   byte 4   byte 3   byte 2   byte 1   byte 0
            //
            // bytes 7, 6, 5 are next sequence / can be ignored
            //
            // output should be
            // [000hhhhh|000ggggg|000fffff|000eeeee|000ddddd|000ccccc|000bbbbb|000aaaaa]
            //
            // shuffling changes the order of bytes, so unpacking is easier: 1, 0, 2, 1, 3, 2, 4, 3
            // ^ marks the bits of interest
            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            //        ^^ ^^^^^^^^^    ^^^^ ^^^^^^     ^^^^^^ ^^^^^    ^^^^^^^^ ^^

            ReadOnlySpan<sbyte> shuffleMask = new sbyte[]
            {
                //1, 0,  2, 1,  3,  2,  4,  3,
                //9, 8, 10, 9, 11, 10, 12, 11

                // Reversed order as in ASP.NET Core Kestrel
                11, 12, 10, 11, 9, 10, 8, 9,
                 3,  4,  2,  3, 1,  2, 0, 1
            };

            Vector128<sbyte> shuffleVec = Unsafe.As<sbyte, Vector128<sbyte>>(ref MemoryMarshal.GetReference(shuffleMask));
            Vector128<sbyte> vec = Ssse3.Shuffle(input, shuffleVec);

            Print(input, nameof(input));
            Print(vec, nameof(vec), insertEmpyLineAfter: true);

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [00000000|000effff|fggggghh|hhhdddde|eeeeffff|fggbbccc|ccddddde|eeeaaaaa]
            Vector128<long> shiftTmp = Sse2.ShiftRightLogical(vec.AsInt64(), 11);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|00000000|00000000|00000000|00000000|00000000|00000000|000aaaaa]
            Vector128<long> maskVector = Vector128.Create(0x00_00_00_00_00_00_00_1FL);
            Vector128<sbyte> indexA = Sse2.And(shiftTmp, maskVector).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [ffffgggg|ghhhhhdd|ddeeeeef|ffffggbb|cccccddd|ddeeeeaa|aaabbbbb|cccccd00]
            shiftTmp = Sse2.ShiftLeftLogical(vec.AsInt64(), 2);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|00000000|00000000|00000000|00000000|00000000|000bbbbb|00000000]
            Vector128<sbyte> indexB = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 8)).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [00000000|0efffffg|gggghhhh|hddddeee|eefffffg|gbbccccc|dddddeee|eaaaaabb]
            shiftTmp = Sse2.ShiftRightLogical(vec.AsInt64(), 9);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|00000000|00000000|00000000|00000000|000ccccc|00000000|00000000]
            Vector128<sbyte> indexC = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 16)).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [ffgggggh|hhhhdddd|eeeeefff|ffggbbcc|cccddddd|eeeeaaaa|abbbbbcc|cccd0000]
            shiftTmp = Sse2.ShiftLeftLogical(vec.AsInt64(), 4);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|00000000|00000000|00000000|000ddddd|00000000|00000000|00000000]
            Vector128<sbyte> indexD = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 24)).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [0000000e|fffffggg|gghhhhhd|dddeeeee|fffffggb|bcccccdd|dddeeeea|aaaabbbb]
            shiftTmp = Sse2.ShiftRightLogical(vec.AsInt64(), 7);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|00000000|00000000|000eeeee|00000000|00000000|00000000|00000000]
            Vector128<sbyte> indexE = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 32)).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [ggggghhh|hhddddee|eeefffff|ggbbcccc|cdddddee|eeaaaaab|bbbbcccc|cd000000]
            shiftTmp = Sse2.ShiftLeftLogical(vec.AsInt64(), 6);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|00000000|000fffff|00000000|00000000|00000000|00000000|00000000]
            Vector128<sbyte> indexF = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 40)).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [00000eff|fffggggg|hhhhhddd|deeeeeff|fffggbbc|ccccdddd|deeeeaaa|aabbbbbc]
            shiftTmp = Sse2.ShiftRightLogical(vec.AsInt64(), 5);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [00000000|000ggggg|00000000|00000000|00000000|00000000|00000000|00000000]
            Vector128<sbyte> indexG = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 48)).AsSByte();

            // [efffffgg|ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd]
            // [ggghhhhh|ddddeeee|efffffgg|bbcccccd|ddddeeee|aaaaabbb|bbcccccd|00000000]
            shiftTmp = Sse2.ShiftLeftLogical(vec.AsInt64(), 8);
            Print(shiftTmp.AsSByte(), nameof(shiftTmp));
            // [000hhhhh|00000000|00000000|00000000|00000000|00000000|00000000|00000000]
            Vector128<sbyte> indexH = Sse2.And(shiftTmp, Sse2.ShiftLeftLogical(maskVector, 56)).AsSByte();

            Print(indexA, nameof(indexA), insertEmptyLineBefore: true);
            Print(indexB, nameof(indexB));
            Print(indexC, nameof(indexC));
            Print(indexD, nameof(indexD));
            Print(indexE, nameof(indexE));
            Print(indexF, nameof(indexF));
            Print(indexG, nameof(indexG));
            Print(indexH, nameof(indexH), insertEmpyLineAfter: true);

            // Merge indices

            // Has a long dependency chain (RAW). Later code avoids this.
            //Vector128<sbyte> indices = Sse2.Or(
            //  indexA, Sse2.Or(
            //      indexB, Sse2.Or(
            //          indexC, Sse2.Or(
            //              indexD, Sse2.Or(
            //                  indexE, Sse2.Or(
            //                      indexF, Sse2.Or(indexG, indexH)
            //                  )
            //              )
            //          )
            //      )
            //  )
            //);
            indexA = Sse2.Or(indexA, indexB);
            indexC = Sse2.Or(indexC, indexD);
            indexE = Sse2.Or(indexE, indexF);
            indexG = Sse2.Or(indexG, indexH);

            indexA = Sse2.Or(indexA, indexC);
            indexE = Sse2.Or(indexE, indexG);

            Vector128<sbyte> indices = Sse2.Or(indexA, indexE);
            Print(indices, nameof(indices));

            ReadOnlySpan<sbyte> shiftBy3MaskData = new sbyte[] { 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2 };
            Vector128<sbyte> shiftBy3Mask = Unsafe.As<sbyte, Vector128<sbyte>>(ref MemoryMarshal.GetReference(shiftBy3MaskData));
            indices = Ssse3.Shuffle(indices, shiftBy3Mask);
            Print(indices, $"{nameof(indices)}-1");
#endif
#if ENC_VAR_A
            Vector128<sbyte> less10 = Sse2.CompareLessThan(indices, Vector128.Create((sbyte)10));
            Vector128<sbyte> range09 = Sse2.And(less10, Vector128.Create((sbyte)'0'));
            Vector128<sbyte> rangeAZ = Sse2.AndNot(less10, Vector128.Create((sbyte)('A' - 10)));
            Vector128<sbyte> shift = Sse2.Or(range09, rangeAZ);
#elif ENC_VAR_B
            Vector128<sbyte> shift = Vector128.Create((sbyte)'0');
            Vector128<sbyte> gt9 = Sse2.CompareGreaterThan(indices, Vector128.Create((sbyte)9));
            Vector128<sbyte> shiftAdjustment = Sse2.And(gt9, Vector128.Create((sbyte)('A' - '0' - 10)));
            shift = Sse2.Add(shift, shiftAdjustment);
#endif
            Vector128<sbyte> res = Sse2.Add(indices, shift);
#if STORE_VAR_A
            buffer[12] = (char)res.GetElement(12);
            buffer[11] = (char)res.GetElement(11);
            buffer[10] = (char)res.GetElement(10);
            buffer[9] = (char)res.GetElement(9);
            buffer[8] = (char)res.GetElement(8);
            buffer[7] = (char)res.GetElement(7);
            buffer[6] = (char)res.GetElement(6);
            buffer[5] = (char)res.GetElement(5);
            buffer[4] = (char)res.GetElement(4);
            buffer[3] = (char)res.GetElement(3);
            buffer[2] = (char)res.GetElement(2);
            buffer[1] = (char)res.GetElement(1);
            buffer[0] = (char)res.GetElement(0);
#elif STORE_VAR_B
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

            // sizeof(l) = 8
            long l = c1.AsInt64().ToScalar();
            Unsafe.WriteUnaligned(ref b, l);
            b = ref Unsafe.Add(ref b, sizeof(long));

            // 10 - 8 = 2 bytes remain

            short s = c1.AsInt16().GetElement(4);   // 4 = (Vector128<sbyte>.Count - sizeof(long)) / sizeof(short)
            Unsafe.WriteUnaligned(ref b, s);
#endif
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough, Conditional("DEBUG")]
        private static void PrintHeader()
        {
            if (!EnablePrint) return;

            Console.Write("{0,-10}: ", "byte-idx");

            Console.ForegroundColor = ConsoleColor.Yellow;
            for (int i = Vector128<sbyte>.Count - 1; i >= 0; --i)
                Console.Write("  {0,2} ", i);
            Console.WriteLine();
            Console.ResetColor();
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough, Conditional("DEBUG")]
        private static void Print(long value, string caption = null)
        {
            if (!EnablePrint) return;

            if (!string.IsNullOrWhiteSpace(caption))
                Console.Write("{0,-10}: ", caption);

            ref sbyte val = ref Unsafe.As<long, sbyte>(ref value);

            for (int i = 0; i < sizeof(long); ++i)
                Console.Write("{0}", new string(' ', 2 + 2 + 1));

            for (int i = sizeof(long) - 1; i >= 0; --i)
            {
                sbyte tmp = Unsafe.Add(ref val, i);

                Console.ForegroundColor = tmp != 0
                    ? ConsoleColor.Green
                    : ConsoleColor.DarkGray;

                Console.Write("0x{0:x2} ", tmp);
            }

            Console.ResetColor();
            Console.WriteLine();
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough, Conditional("DEBUG")]
        private static void Print(Vector128<sbyte> vec, string caption = null, bool printAsScii = false, bool insertEmptyLineBefore = false, bool insertEmpyLineAfter = false)
        {
            if (!EnablePrint) return;

            if (insertEmptyLineBefore)
                Console.WriteLine();

            if (!string.IsNullOrWhiteSpace(caption))
                Console.Write("{0,-10}: ", caption);

            if (printAsScii)
                PrintAsAscii();
            else
                PrintAsHex();

            Console.ResetColor();
            Console.WriteLine();

            if (insertEmpyLineAfter)
                Console.WriteLine();
            //-----------------------------------------------------------------
            void PrintAsHex()
            {
                for (int i = Vector128<sbyte>.Count - 1; i >= 0; --i)
                {
                    sbyte value = vec.GetElement(i);

                    Console.ForegroundColor = value != 0
                        ? ConsoleColor.Green
                        : ConsoleColor.DarkGray;

                    Console.Write("0x{0:x2} ", value);
                }
            }
            //-----------------------------------------------------------------
            void PrintAsAscii()
            {
                Console.ForegroundColor = ConsoleColor.Cyan;

                for (int i = Vector128<sbyte>.Count - 1; i >= 0; --i)
                    Console.Write("{0,4} ", (char)vec.GetElement(i));
            }
        }
    }
}
