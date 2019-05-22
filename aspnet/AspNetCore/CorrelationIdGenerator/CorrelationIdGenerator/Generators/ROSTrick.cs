// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator1
    {
        // Base32 encoding - in ascii sort order for easy text based sorting
        private static ReadOnlySpan<byte> s_encode32Chars => new byte[] { (byte)'0', (byte)'1', (byte)'2', (byte)'3', (byte)'4', (byte)'5', (byte)'6', (byte)'7', (byte)'8', (byte)'9', (byte)'A', (byte)'B', (byte)'C', (byte)'D', (byte)'E', (byte)'F', (byte)'G', (byte)'H', (byte)'I', (byte)'J', (byte)'K', (byte)'L', (byte)'M', (byte)'N', (byte)'O', (byte)'P', (byte)'Q', (byte)'R', (byte)'S', (byte)'T', (byte)'U', (byte)'V' };

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
            ReadOnlySpan<byte> encode32Chars = s_encode32Chars;

            buffer[12] = (char)encode32Chars[(int)(value & 31)];
            buffer[11] = (char)encode32Chars[(int)((value >> 5) & 31)];
            buffer[10] = (char)encode32Chars[(int)((value >> 10) & 31)];
            buffer[9] = (char)encode32Chars[(int)((value >> 15) & 31)];
            buffer[8] = (char)encode32Chars[(int)((value >> 20) & 31)];
            buffer[7] = (char)encode32Chars[(int)((value >> 25) & 31)];
            buffer[6] = (char)encode32Chars[(int)((value >> 30) & 31)];
            buffer[5] = (char)encode32Chars[(int)((value >> 35) & 31)];
            buffer[4] = (char)encode32Chars[(int)((value >> 40) & 31)];
            buffer[3] = (char)encode32Chars[(int)((value >> 45) & 31)];
            buffer[2] = (char)encode32Chars[(int)((value >> 50) & 31)];
            buffer[1] = (char)encode32Chars[(int)((value >> 55) & 31)];
            buffer[0] = (char)encode32Chars[(int)((value >> 60) & 31)];
        }
    }
}
