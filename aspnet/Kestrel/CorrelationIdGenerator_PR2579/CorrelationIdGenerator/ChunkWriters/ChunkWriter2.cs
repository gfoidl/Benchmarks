﻿// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Buffers;
using System.Runtime.CompilerServices;
using System.Text;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Http
{
    internal static class ChunkWriter2
    {
        private static readonly ArraySegment<byte> _endChunkBytes = CreateAsciiByteArraySegment("\r\n");
        private static readonly byte[]             _hex = Encoding.ASCII.GetBytes("0123456789abcdef");
        //---------------------------------------------------------------------
        private static ArraySegment<byte> CreateAsciiByteArraySegment(string text)
        {
            var bytes = Encoding.ASCII.GetBytes(text);
            return new ArraySegment<byte>(bytes);
        }
        //---------------------------------------------------------------------
        public static ArraySegment<byte> BeginChunkBytes(int dataCount)
        {
            ref var hex = ref _hex[0];

            var bytes = new byte[10]
            {
                Unsafe.Add(ref hex, (dataCount >> 0x1c) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x18) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x14) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x10) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x0c) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x08) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x04) & 0x0f),
                Unsafe.Add(ref hex, (dataCount >> 0x00) & 0x0f),
                (byte)'\r',
                (byte)'\n'
            };

            // Determine the most-significant non-zero nibble
            int total, shift;
            total = (dataCount > 0xffff) ? 0x10 : 0x00;
            dataCount >>= total;
            shift = (dataCount > 0x00ff) ? 0x08 : 0x00;
            dataCount >>= shift;
            total |= shift;
            total |= (dataCount > 0x000f) ? 0x04 : 0x00;

            var offset = 7 - (total >> 2);
            return new ArraySegment<byte>(bytes, offset, 10 - offset);
        }
    }
}
