// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using System.Buffers;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;

namespace Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure
{
    internal static partial class HttpUtilities
    {
        public const string Http10Version = "HTTP/1.0";
        public const string Http11Version = "HTTP/1.1";
        public const string Http2Version = "HTTP/2";
        public const string Http3Version = "HTTP/3";

        public const string HttpUriScheme = "http://";
        public const string HttpsUriScheme = "https://";

        // readonly primitive statics can be Jit'd to consts https://github.com/dotnet/coreclr/issues/1079
        private static readonly ulong _httpSchemeLong = GetAsciiStringAsLong(HttpUriScheme + "\0");
        private static readonly ulong _httpsSchemeLong = GetAsciiStringAsLong(HttpsUriScheme);

        private const uint _httpGetMethodInt = 542393671; // GetAsciiStringAsInt("GET "); const results in better codegen

        private const ulong _http10VersionLong = 3471766442030158920; // GetAsciiStringAsLong("HTTP/1.0"); const results in better codegen
        private const ulong _http11VersionLong = 3543824036068086856; // GetAsciiStringAsLong("HTTP/1.1"); const results in better codegen

        private static readonly UTF8EncodingSealed HeaderValueEncoding = new UTF8EncodingSealed();



        private static unsafe ulong GetAsciiStringAsLong(string str)
        {
            Debug.Assert(str.Length == 8, "String must be exactly 8 (ASCII) characters long.");

            var bytes = Encoding.ASCII.GetBytes(str);

            fixed (byte* ptr = &bytes[0])
            {
                return *(ulong*)ptr;
            }
        }

        private static unsafe uint GetAsciiStringAsInt(string str)
        {
            Debug.Assert(str.Length == 4, "String must be exactly 4 (ASCII) characters long.");

            var bytes = Encoding.ASCII.GetBytes(str);

            fixed (byte* ptr = &bytes[0])
            {
                return *(uint*)ptr;
            }
        }

        private static unsafe ulong GetMaskAsLong(byte[] bytes)
        {
            Debug.Assert(bytes.Length == 8, "Mask must be exactly 8 bytes long.");

            fixed (byte* ptr = bytes)
            {
                return *(ulong*)ptr;
            }
        }

        // The same as GetAsciiStringNonNullCharacters but throws BadRequest
        public static unsafe string GetHeaderNameDefault(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            var asciiString = new string('\0', span.Length);

            fixed (char* output = asciiString)
            fixed (byte* buffer = span)
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringDefault(buffer, output, span.Length))
                {
                    //BadHttpRequestException.Throw(RequestRejectionReason.InvalidCharactersInHeaderName);
                    Throw();

                    static void Throw() => throw new Exception();
                }
            }

            return asciiString;
        }

        public static unsafe string GetHeaderNameDefaultWithImproveStringUtilities(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            var asciiString = new string('\0', span.Length);

            fixed (char* output = asciiString)
            fixed (byte* buffer = span)
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringExitEarly(buffer, output, span.Length))
                {
                    //BadHttpRequestException.Throw(RequestRejectionReason.InvalidCharactersInHeaderName);
                    Throw();

                    static void Throw() => throw new Exception();
                }
            }

            return asciiString;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe string GetHeaderName_StringCreate(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            fixed (byte* source = &MemoryMarshal.GetReference(span))
            {
                return string.Create(span.Length, new IntPtr(source), s_getHeaderName);
            }
        }

        private static readonly SpanAction<char, IntPtr> s_getHeaderName = GetHeaderName;

        private static unsafe void GetHeaderName(Span<char> buffer, IntPtr state)
        {
            fixed (char* output = &MemoryMarshal.GetReference(buffer))
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringExitEarly((byte*)state.ToPointer(), output, buffer.Length))
                {
                    //BadHttpRequestException.Throw(RequestRejectionReason.InvalidCharactersInHeaderName);
                    Throw();

                    static void Throw() => throw new Exception();
                }
            }
        }

        public static unsafe string GetHeaderName_Copy(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            const int stackAllocSize = 256 / sizeof(char);

            Debug.Assert(span.Length <= stackAllocSize);

            fixed (byte* source = &MemoryMarshal.GetReference(span))
            {
                char* target = stackalloc char[stackAllocSize];

                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringExitEarly(source, target, span.Length))
                {
                    //BadHttpRequestException.Throw(RequestRejectionReason.InvalidCharactersInHeaderName);
                    Throw();

                    static void Throw() => throw new Exception();
                }

                return new string(target, 0, span.Length);
            }
        }

        public static string GetAsciiStringNonNullCharacters(this Span<byte> span)
            => GetAsciiStringNonNullCharacters((ReadOnlySpan<byte>)span);

        public static unsafe string GetAsciiStringNonNullCharactersDefault(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            var asciiString = new string('\0', span.Length);

            fixed (char* output = asciiString)
            fixed (byte* buffer = span)
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringDefault(buffer, output, span.Length))
                {
                    throw new InvalidOperationException();
                }
            }
            return asciiString;
        }

        public static unsafe string GetAsciiStringNonNullCharactersDefaultWithImproveStringUtilities(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            var asciiString = new string('\0', span.Length);

            fixed (char* output = asciiString)
            fixed (byte* buffer = span)
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringExitEarly(buffer, output, span.Length))
                {
                    throw new InvalidOperationException();
                }
            }
            return asciiString;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe string GetAsciiStringNonNullCharacters(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            fixed (byte* source = &MemoryMarshal.GetReference(span))
            {
                return string.Create(span.Length, new IntPtr(source), s_getAsciiStringNonNullCharacters);
            }
        }

        private static readonly SpanAction<char, IntPtr> s_getAsciiStringNonNullCharacters = GetAsciiStringNonNullCharacters;

        private static unsafe void GetAsciiStringNonNullCharacters(Span<char> buffer, IntPtr state)
        {
            fixed (char* output = &MemoryMarshal.GetReference(buffer))
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringExitEarly((byte*)state.ToPointer(), output, buffer.Length))
                {
                    throw new InvalidOperationException();
                }
            }
        }

        public static unsafe string GetAsciiOrUTF8StringNonNullCharacters(this Span<byte> span)
            => GetAsciiOrUTF8StringNonNullCharacters((ReadOnlySpan<byte>)span);

        public static unsafe string GetAsciiOrUTF8StringNonNullCharactersDefault(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            var resultString = new string('\0', span.Length);

            fixed (char* output = resultString)
            fixed (byte* buffer = span)
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringDefault(buffer, output, span.Length))
                {
                    // null characters are considered invalid
                    if (span.IndexOf((byte)0) != -1)
                    {
                        throw new InvalidOperationException();
                    }

                    try
                    {
                        resultString = HeaderValueEncoding.GetString(buffer, span.Length);
                    }
                    catch (DecoderFallbackException)
                    {
                        throw new InvalidOperationException();
                    }
                }
            }
            return resultString;
        }

        public static unsafe string GetAsciiOrUTF8StringNonNullCharacters(this ReadOnlySpan<byte> span)
        {
            if (span.IsEmpty)
            {
                return string.Empty;
            }

            fixed (byte* source = &MemoryMarshal.GetReference(span))
            {
                var resultString = string.Create(span.Length, new IntPtr(source), s_getAsciiOrUtf8StringNonNullCharacters);

                // If rersultString is marked, perform UTF-8 encoding
                if (resultString[0] == '\0')
                {
                    if (span.IndexOf((byte)0) != -1)
                    {
                        throw new InvalidOperationException();
                    }

                    try
                    {
                        resultString = HeaderValueEncoding.GetString(span);
                    }
                    catch (DecoderFallbackException)
                    {
                        throw new InvalidOperationException();
                    }
                }

                return resultString;
            }
        }

        private static readonly SpanAction<char, IntPtr> s_getAsciiOrUtf8StringNonNullCharacters = GetAsciiOrUTF8StringNonNullCharacters;

        private static unsafe void GetAsciiOrUTF8StringNonNullCharacters(Span<char> buffer, IntPtr state)
        {
            fixed (char* output = &MemoryMarshal.GetReference(buffer))
            {
                // This version if AsciiUtilities returns null if there are any null (0 byte) characters
                // in the string
                if (!StringUtilities.TryGetAsciiStringExitEarly((byte*)state.ToPointer(), output, buffer.Length))
                {
                    // Mark resultString for UTF-8 encoding
                    output[0] = '\0';
                }
            }
        }

        public static string GetAsciiStringEscaped(this Span<byte> span, int maxChars)
        {
            var sb = new StringBuilder();

            for (var i = 0; i < Math.Min(span.Length, maxChars); i++)
            {
                var ch = span[i];
                sb.Append(ch < 0x20 || ch >= 0x7F ? $"\\x{ch:X2}" : ((char)ch).ToString());
            }

            if (span.Length > maxChars)
            {
                sb.Append("...");
            }

            return sb.ToString();
        }



        // Allow for de-virtualization (see https://github.com/dotnet/coreclr/pull/9230)
        private sealed class UTF8EncodingSealed : UTF8Encoding
        {
            public UTF8EncodingSealed() : base(encoderShouldEmitUTF8Identifier: false, throwOnInvalidBytes: true) { }

            public override byte[] GetPreamble() => Array.Empty<byte>();
        }
    }
}
