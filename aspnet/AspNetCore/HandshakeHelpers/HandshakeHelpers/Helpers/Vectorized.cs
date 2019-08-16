﻿using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;

namespace HandshakeHelpers.Helpers
{
    public static class Vectorized
    {
        public static bool IsRequestKeyValid(string value)
        {
            var chars = value.AsSpan();

            // The base64 decoded key should be 16 bytes long. Thus the base64
            // encoded key must be 24 chars long. So we can short-circuit the
            // validation if the length don't match.
            if (chars.Length != 24)
            {
                return false;
            }

            if (Ssse3.IsSupported)
            {
                return IsRequestKeyValidSse(chars);
            }

            Span<byte> temp = stackalloc byte[16];
            var success = Convert.TryFromBase64Chars(chars, temp, out int written);
            return written == 16 && success;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool IsRequestKeyValidSse(ReadOnlySpan<char> chars)
        {
            Debug.Assert(chars.Length == 24);

            // Outline of the algorithm:
            // 0. Elements 0..21 consists of the base64-alphabet, elements 22..23 are the padding
            //    chars (=)
            // 1. We read two char-vectors, and pack them to a single byte-vector with saturation.
            //    This vector contains of elements 0..15
            // 2. As the validation is idempotent, we read in the same way a second byte-vector,
            //    containing of elements 6..21
            // 3. Perform the validation of the base64-alphabet. A description how the validation works is given in 
            //    https://github.com/dotnet/corefx/blob/bfe2c58a4536db9a257940277c5d94bf9e26929a/src/System.Memory/src/System/Buffers/Text/Base64Decoder.cs#L455-L503
            // 4. Elements 22..23 are compared to ==

            ref var src = ref MemoryMarshal.GetReference(chars);

            var vec0 = src.ReadVector128();
            var vec1 = Unsafe.Add(ref src, 6).ReadVector128();

            var lutLo = Unsafe.As<sbyte, Vector128<sbyte>>(ref MemoryMarshal.GetReference(s_sseDecodeLutLo));
            var lutHi = Unsafe.As<sbyte, Vector128<sbyte>>(ref MemoryMarshal.GetReference(s_sseDecodeLutHi));
            var mask0F = Vector128.Create((sbyte)0x0F);

            var loNibbles0 = Sse2.And(vec0, mask0F);
            var loNibbles1 = Sse2.And(vec1, mask0F);
            var hiNibbles0 = Sse2.And(Sse2.ShiftRightLogical(vec0.AsInt32(), 4).AsSByte(), mask0F);
            var hiNibbles1 = Sse2.And(Sse2.ShiftRightLogical(vec1.AsInt32(), 4).AsSByte(), mask0F);

            var lo0 = Ssse3.Shuffle(lutLo, loNibbles0);
            var lo1 = Ssse3.Shuffle(lutLo, loNibbles1);
            var hi0 = Ssse3.Shuffle(lutHi, hiNibbles0);
            var hi1 = Ssse3.Shuffle(lutHi, hiNibbles1);

            var and0 = Sse2.And(lo0, hi0);
            var and1 = Sse2.And(lo1, hi1);
            var or = Sse2.Or(and0, and1);

            var gt = Sse2.CompareGreaterThan(or, Vector128<sbyte>.Zero);
            var mask = Sse2.MoveMask(gt);

            var lastTwoCharsAsInt = Unsafe.As<char, int>(ref Unsafe.Add(ref src, 22));
            const int twoPaddingCharsAsInt = '=' << 16 | '=';

            // PERF: JIT produces branchless code for the subtraction and comparison to 0
            // return mask == 0 && lastTwoChars == twoPaddingCharsAsInt;
            return ((lastTwoCharsAsInt - twoPaddingCharsAsInt) | mask) == 0;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static Vector128<sbyte> ReadVector128(this ref char src)
        {
            var c0 = Unsafe.As<char, Vector128<short>>(ref src);
            var c1 = Unsafe.As<char, Vector128<short>>(ref Unsafe.Add(ref src, 8));
            var tmp = Sse2.PackUnsignedSaturate(c0, c1);

            return tmp.AsSByte();
        }

        private static ReadOnlySpan<sbyte> s_sseDecodeLutLo => new sbyte[]
        {
            0x15, 0x11, 0x11, 0x11,
            0x11, 0x11, 0x11, 0x11,
            0x11, 0x11, 0x13, 0x1A,
            0x1B, 0x1B, 0x1B, 0x1A
        };

        private static ReadOnlySpan<sbyte> s_sseDecodeLutHi => new sbyte[]
        {
            0x10, 0x10, 0x01, 0x02,
            0x04, 0x08, 0x04, 0x08,
            0x10, 0x10, 0x10, 0x10,
            0x10, 0x10, 0x10, 0x10
        };
    }
}
