﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Buffers;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator2
    {
#if NETCOREAPP2_1
        private static readonly SpanAction<char, long> _spanAction = FillBufferAction;
#endif

        // Base32 encoding - in ascii sort order for easy text based sorting
        private static readonly char[] _encode32Chars = "0123456789ABCDEFGHIJKLMNOPQRSTUV".ToCharArray();

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

        private static unsafe string GenerateId(long id)
        {
            // The following routine is ~310% faster than calling long.ToString() on x64
            // and ~600% faster than calling long.ToString() on x86 in tight loops of 1 million+ iterations
            // See: https://github.com/aspnet/Hosting/pull/385

#if NETCOREAPP2_1
            return string.Create(13, id, _spanAction);
#else
            // stackalloc to allocate array on stack rather than heap
            char* charBuffer = stackalloc char[13];
            FillBuffer(ref Unsafe.AsRef<char>(charBuffer), id, ref _encode32Chars[0]);

            // string ctor overload that takes char*
            return new string(charBuffer, 0, 13);
#endif
        }

#if NETCOREAPP2_1
        private static void FillBufferAction(Span<char> charBuffer, long id)
        {
            ref char buffer = ref MemoryMarshal.GetReference(charBuffer);
            ref char encodeChars = ref _encode32Chars[0];

            FillBuffer(ref buffer, id, ref encodeChars);
        }
#endif

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void FillBuffer(ref char buffer, long id, ref char encodeChars)
        {
            Unsafe.Add(ref buffer, 0) = Unsafe.Add(ref encodeChars, (int)(id >> 60) & 31);
            Unsafe.Add(ref buffer, 1) = Unsafe.Add(ref encodeChars, (int)(id >> 55) & 31);
            Unsafe.Add(ref buffer, 2) = Unsafe.Add(ref encodeChars, (int)(id >> 50) & 31);
            Unsafe.Add(ref buffer, 3) = Unsafe.Add(ref encodeChars, (int)(id >> 45) & 31);
            Unsafe.Add(ref buffer, 4) = Unsafe.Add(ref encodeChars, (int)(id >> 40) & 31);
            Unsafe.Add(ref buffer, 5) = Unsafe.Add(ref encodeChars, (int)(id >> 35) & 31);
            Unsafe.Add(ref buffer, 6) = Unsafe.Add(ref encodeChars, (int)(id >> 30) & 31);
            Unsafe.Add(ref buffer, 7) = Unsafe.Add(ref encodeChars, (int)(id >> 25) & 31);
            Unsafe.Add(ref buffer, 8) = Unsafe.Add(ref encodeChars, (int)(id >> 20) & 31);
            Unsafe.Add(ref buffer, 9) = Unsafe.Add(ref encodeChars, (int)(id >> 15) & 31);
            Unsafe.Add(ref buffer, 10) = Unsafe.Add(ref encodeChars, (int)(id >> 10) & 31);
            Unsafe.Add(ref buffer, 11) = Unsafe.Add(ref encodeChars, (int)(id >> 5) & 31);
            Unsafe.Add(ref buffer, 12) = Unsafe.Add(ref encodeChars, (int)(id >> 0) & 31);
        }
    }
}
