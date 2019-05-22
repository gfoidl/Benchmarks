// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator3
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
            Span<char> buffer = stackalloc char[13];

            char[] encode32Chars = s_encode32Chars;

            buffer[12] = encode32Chars[id & 31];
            buffer[11] = encode32Chars[(id >> 5) & 31];
            buffer[10] = encode32Chars[(id >> 10) & 31];
            buffer[9] = encode32Chars[(id >> 15) & 31];
            buffer[8] = encode32Chars[(id >> 20) & 31];
            buffer[7] = encode32Chars[(id >> 25) & 31];
            buffer[6] = encode32Chars[(id >> 30) & 31];
            buffer[5] = encode32Chars[(id >> 35) & 31];
            buffer[4] = encode32Chars[(id >> 40) & 31];
            buffer[3] = encode32Chars[(id >> 45) & 31];
            buffer[2] = encode32Chars[(id >> 50) & 31];
            buffer[1] = encode32Chars[(id >> 55) & 31];
            buffer[0] = encode32Chars[(id >> 60) & 31];

            return new string(buffer);
        }
    }
}
