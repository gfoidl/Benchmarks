// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Buffers;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static class CorrelationIdGenerator4
    {
#if NETCOREAPP2_1
        private static readonly SpanAction<char, long> _spanAction = FillBufferAction;
#endif

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
            FillBuffer(ref Unsafe.AsRef<char>(charBuffer), id);

            // string ctor overload that takes char*
            return new string(charBuffer, 0, 13);
#endif
        }

#if NETCOREAPP2_1
        private static void FillBufferAction(Span<char> charBuffer, long id)
        {
            ref char buffer = ref MemoryMarshal.GetReference(charBuffer);

            FillBuffer(ref buffer, id);
        }
#endif

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void FillBuffer(ref char buffer, long id)
        {
            Unsafe.Add(ref buffer, 0) = EncodeBase32(id, 60);
            Unsafe.Add(ref buffer, 1) = EncodeBase32(id, 55);
            Unsafe.Add(ref buffer, 2) = EncodeBase32(id, 50);
            Unsafe.Add(ref buffer, 3) = EncodeBase32(id, 45);
            Unsafe.Add(ref buffer, 4) = EncodeBase32(id, 40);
            Unsafe.Add(ref buffer, 5) = EncodeBase32(id, 35);
            Unsafe.Add(ref buffer, 6) = EncodeBase32(id, 30);
            Unsafe.Add(ref buffer, 7) = EncodeBase32(id, 25);
            Unsafe.Add(ref buffer, 8) = EncodeBase32(id, 20);
            Unsafe.Add(ref buffer, 9) = EncodeBase32(id, 15);
            Unsafe.Add(ref buffer, 10) = EncodeBase32(id, 10);
            Unsafe.Add(ref buffer, 11) = EncodeBase32(id, 5);
            Unsafe.Add(ref buffer, 12) = EncodeBase32(id, 0);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static char EncodeBase32(long id, byte shift)
        {
            // Base32 encoding - in ascii sort order for easy text based sorting
            // 0123456789ABCDEFGHIJKLMNOPQRSTUV

            var digit = (id >> shift) & 0x1f;
            var add = BranchlessSelect((int)digit);
            return (char)(digit + add);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static int BranchlessSelect(int digit)
        {
            const int trueValue = '0';
            const int falseValue = 'A' - 10;
            const int comparison = 10;
            int wordbits = IntPtr.Size == 8 ? 64 : 32;

            return (((digit - comparison) >> (wordbits - 1)) & (trueValue ^ falseValue)) ^ falseValue;
        }
    }
}
