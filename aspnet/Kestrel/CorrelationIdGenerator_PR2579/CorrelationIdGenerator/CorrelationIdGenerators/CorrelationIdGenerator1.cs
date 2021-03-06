﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator1
    {
        // Base32 encoding - in ascii sort order for easy text based sorting
        private static readonly string _encode32Chars = "0123456789ABCDEFGHIJKLMNOPQRSTUV";

        // Seed the _lastConnectionId for this application instance with
        // the number of 100-nanosecond intervals that have elapsed since 12:00:00 midnight, January 1, 0001
        // for a roughly increasing _lastId over restarts
        private static long _lastId = DateTime.UtcNow.Ticks;
#if DEBUG
        public static long LastId
        {
            set => _lastId = value;
        }
#endif

        public static string GetNextId() => GenerateId(Interlocked.Increment(ref _lastId));

        private static unsafe string GenerateId(long nextId)
        {
            // The following routine is ~310% faster than calling long.ToString() on x64
            // and ~600% faster than calling long.ToString() on x86 in tight loops of 1 million+ iterations
            // See: https://github.com/aspnet/Hosting/pull/385

#if NETCOREAPP2_1
            return string.Create(13, nextId, (charBuffer, id) =>
            {
#else
            long id = nextId;
            // stackalloc to allocate array on stack rather than heap
            char* charBuffer = stackalloc char[13];
#endif

                charBuffer[0] = _encode32Chars[(int)(id >> 60) & 31];
                charBuffer[1] = _encode32Chars[(int)(id >> 55) & 31];
                charBuffer[2] = _encode32Chars[(int)(id >> 50) & 31];
                charBuffer[3] = _encode32Chars[(int)(id >> 45) & 31];
                charBuffer[4] = _encode32Chars[(int)(id >> 40) & 31];
                charBuffer[5] = _encode32Chars[(int)(id >> 35) & 31];
                charBuffer[6] = _encode32Chars[(int)(id >> 30) & 31];
                charBuffer[7] = _encode32Chars[(int)(id >> 25) & 31];
                charBuffer[8] = _encode32Chars[(int)(id >> 20) & 31];
                charBuffer[9] = _encode32Chars[(int)(id >> 15) & 31];
                charBuffer[10] = _encode32Chars[(int)(id >> 10) & 31];
                charBuffer[11] = _encode32Chars[(int)(id >> 5) & 31];
                charBuffer[12] = _encode32Chars[(int)id & 31];

#if NETCOREAPP2_1
            });
#else
            // string ctor overload that takes char*
            return new string(charBuffer, 0, 13);
#endif
        }
    }
}
