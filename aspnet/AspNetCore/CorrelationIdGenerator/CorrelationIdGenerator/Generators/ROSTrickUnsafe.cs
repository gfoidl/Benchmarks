// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator2
    {
        // Base32 encoding - in ascii sort order for easy text based sorting
        private static ReadOnlySpan<byte> s_encode32Chars => new byte[] { 0x00, (byte)'0', (byte)'1', (byte)'2', (byte)'3', (byte)'4', (byte)'5', (byte)'6', (byte)'7', (byte)'8', (byte)'9', (byte)'A', (byte)'B', (byte)'C', (byte)'D', (byte)'E', (byte)'F', (byte)'G', (byte)'H', (byte)'I', (byte)'J', (byte)'K', (byte)'L', (byte)'M', (byte)'N', (byte)'O', (byte)'P', (byte)'Q', (byte)'R', (byte)'S', (byte)'T', (byte)'U', (byte)'V' };

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
            ref byte encode32Chars = ref MemoryMarshal.GetReference(s_encode32Chars.Slice(1));

            //buffer[12] = (char)Unsafe.AddByteOffset(ref encode32Chars, (IntPtr)(value & 31));
            //buffer[11] = (char)Unsafe.AddByteOffset(ref encode32Chars, (IntPtr)((value >>  5)  & 31));
            //buffer[10] = (char)Unsafe.AddByteOffset(ref encode32Chars, (IntPtr)((value >> 10) & 31));
            //buffer[9] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 15) & 31));
            //buffer[8] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 20) & 31));
            //buffer[7] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 25) & 31));
            //buffer[6] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 30) & 31));
            //buffer[5] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 35) & 31));
            //buffer[4] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 40) & 31));
            //buffer[3] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 45) & 31));
            //buffer[2] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 50) & 31));
            //buffer[1] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 55) & 31));
            //buffer[0] = (char)Unsafe.AddByteOffset(ref encode32Chars,  (IntPtr)((value >> 60) & 31));

            buffer[12] = Get(ref encode32Chars, value, 0);
            buffer[11] = Get(ref encode32Chars, value, 5);
            buffer[10] = Get(ref encode32Chars, value, 10);
            buffer[9] = Get(ref encode32Chars, value, 15);
            buffer[8] = Get(ref encode32Chars, value, 20);
            buffer[7] = Get(ref encode32Chars, value, 25);
            buffer[6] = Get(ref encode32Chars, value, 30);
            buffer[5] = Get(ref encode32Chars, value, 35);
            buffer[4] = Get(ref encode32Chars, value, 40);
            buffer[3] = Get(ref encode32Chars, value, 45);
            buffer[2] = Get(ref encode32Chars, value, 50);
            buffer[1] = Get(ref encode32Chars, value, 55);
            buffer[0] = Get(ref encode32Chars, value, 60);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        static char Get(ref byte encode32Chars, long value, int shift)
        {
            value >>= shift;
            value &= 31;

            if (value >= 32) ThrowHelper();

            return (char)Unsafe.AddByteOffset(ref encode32Chars, (IntPtr)value);
        }

        private static void ThrowHelper() => throw new IndexOutOfRangeException();
    }
}
