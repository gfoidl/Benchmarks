﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Buffers;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal class StringUtilities2
    {
#if NETCOREAPP2_1
        private static readonly SpanAction<char, (string, char, uint)> _spanAction = ConcatAsHexSuffixCore;
#endif

        public static unsafe bool TryGetAsciiString(byte* input, char* output, int count)
        {
            // Calculate end position
            var end = input + count;
            // Start as valid
            var isValid = true;

            do
            {
                // If Vector not-accelerated or remaining less than vector size
                if (!Vector.IsHardwareAccelerated || input > end - Vector<sbyte>.Count)
                {
                    if (IntPtr.Size == 8) // Use Intrinsic switch for branch elimination
                    {
                        // 64-bit: Loop longs by default
                        while (input <= end - sizeof(long))
                        {
                            isValid &= CheckBytesInAsciiRange(((long*)input)[0]);

                            output[0] = (char)input[0];
                            output[1] = (char)input[1];
                            output[2] = (char)input[2];
                            output[3] = (char)input[3];
                            output[4] = (char)input[4];
                            output[5] = (char)input[5];
                            output[6] = (char)input[6];
                            output[7] = (char)input[7];

                            input += sizeof(long);
                            output += sizeof(long);
                        }
                        if (input <= end - sizeof(int))
                        {
                            isValid &= CheckBytesInAsciiRange(((int*)input)[0]);

                            output[0] = (char)input[0];
                            output[1] = (char)input[1];
                            output[2] = (char)input[2];
                            output[3] = (char)input[3];

                            input += sizeof(int);
                            output += sizeof(int);
                        }
                    }
                    else
                    {
                        // 32-bit: Loop ints by default
                        while (input <= end - sizeof(int))
                        {
                            isValid &= CheckBytesInAsciiRange(((int*)input)[0]);

                            output[0] = (char)input[0];
                            output[1] = (char)input[1];
                            output[2] = (char)input[2];
                            output[3] = (char)input[3];

                            input += sizeof(int);
                            output += sizeof(int);
                        }
                    }
                    if (input <= end - sizeof(short))
                    {
                        isValid &= CheckBytesInAsciiRange(((short*)input)[0]);

                        output[0] = (char)input[0];
                        output[1] = (char)input[1];

                        input += sizeof(short);
                        output += sizeof(short);
                    }
                    if (input < end)
                    {
                        isValid &= CheckBytesInAsciiRange(((sbyte*)input)[0]);
                        output[0] = (char)input[0];
                    }

                    return isValid;
                }

                // do/while as entry condition already checked
                do
                {
                    var vector = Unsafe.AsRef<Vector<sbyte>>(input);
                    isValid &= CheckBytesInAsciiRange(vector);
                    Vector.Widen(
                        vector,
                        out Unsafe.AsRef<Vector<short>>(output),
                        out Unsafe.AsRef<Vector<short>>(output + Vector<short>.Count));

                    input += Vector<sbyte>.Count;
                    output += Vector<sbyte>.Count;
                } while (input <= end - Vector<sbyte>.Count);

                // Vector path done, loop back to do non-Vector
                // If is a exact multiple of vector size, bail now
            } while (input < end);

            return isValid;
        }

        /// <summary>
        /// A faster version of String.Concat(<paramref name="str"/>, <paramref name="separator"/>, <paramref name="number"/>.ToString("X8"))
        /// </summary>
        /// <param name="str"></param>
        /// <param name="separator"></param>
        /// <param name="number"></param>
        /// <returns></returns>
        public static unsafe string ConcatAsHexSuffix(string str, char separator, uint number)
        {
            var length = 1 + 8;
            if (str != null)
            {
                length += str.Length;
            }

#if NETCOREAPP2_1
            return string.Create(length, (str, separator, number), _spanAction);
#else
            char* charBuffer = stackalloc char[length];
            ConcatAsHexSuffixCore(ref Unsafe.AsRef<char>(charBuffer), str, separator, number);
            return new string(charBuffer, 0, length);
#endif
        }

        private static void ConcatAsHexSuffixCore(Span<char> charBuffer, (string str, char separator, uint number) state)
        {
            ConcatAsHexSuffixCore(ref MemoryMarshal.GetReference(charBuffer), state.str, state.separator, state.number);
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        private static void ConcatAsHexSuffixCore(ref char charBuffer, string str, char separator, uint number)
        {
            var i = 0;

            if (str != null)
            {
                for (; i < str.Length; ++i)
                {
                    Unsafe.Add(ref charBuffer, i) = str[i];
                }

                charBuffer = ref Unsafe.Add(ref charBuffer, i);
            }

            charBuffer = separator;
            Unsafe.Add(ref charBuffer, 1) = EncodeBase16(number, 28);
            Unsafe.Add(ref charBuffer, 2) = EncodeBase16(number, 24);
            Unsafe.Add(ref charBuffer, 3) = EncodeBase16(number, 20);
            Unsafe.Add(ref charBuffer, 4) = EncodeBase16(number, 16);
            Unsafe.Add(ref charBuffer, 5) = EncodeBase16(number, 12);
            Unsafe.Add(ref charBuffer, 6) = EncodeBase16(number, 8);
            Unsafe.Add(ref charBuffer, 7) = EncodeBase16(number, 4);
            Unsafe.Add(ref charBuffer, 8) = EncodeBase16(number, 0);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static char EncodeBase16(uint id, byte shift)
        {
            // Base16 encoding - in ascii sort order for easy text based sorting
            // 0123456789ABCDEF

            var digit = (id >> shift) & 0x0f;
            var add = digit < 10 ? '0' : 'A' - 10;      // 'A' - 10 because of offset
            return (char)(digit + add);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)] // Needs a push
        private static bool CheckBytesInAsciiRange(Vector<sbyte> check)
        {
            // Vectorized byte range check, signed byte > 0 for 1-127
            return Vector.GreaterThanAll(check, Vector<sbyte>.Zero);
        }

        // Validate: bytes != 0 && bytes <= 127
        //  Subtract 1 from all bytes to move 0 to high bits
        //  bitwise or with self to catch all > 127 bytes
        //  mask off high bits and check if 0

        [MethodImpl(MethodImplOptions.AggressiveInlining)] // Needs a push
        private static bool CheckBytesInAsciiRange(long check)
        {
            const long HighBits = unchecked((long)0x8080808080808080L);
            return (((check - 0x0101010101010101L) | check) & HighBits) == 0;
        }

        private static bool CheckBytesInAsciiRange(int check)
        {
            const int HighBits = unchecked((int)0x80808080);
            return (((check - 0x01010101) | check) & HighBits) == 0;
        }

        private static bool CheckBytesInAsciiRange(short check)
        {
            const short HighBits = unchecked((short)0x8080);
            return (((short)(check - 0x0101) | check) & HighBits) == 0;
        }

        private static bool CheckBytesInAsciiRange(sbyte check)
            => check > 0;
    }
}
