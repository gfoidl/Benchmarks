#if NETCOREAPP2_1

using System;
using System.Buffers.Text;
using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Internal;

namespace WebEncodersBench.Benchmarks
{
    public class Base64Encoder : BaseBenchmark
    {
        private readonly byte[] _guid = Guid.NewGuid().ToByteArray();
        //---------------------------------------------------------------------
#if DEBUG
        public byte[] Data => _guid;
#endif
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public char[] Convert_TryToBase64Chars()
        {
            int bufferSize = WebEncoders.GetArraySizeRequiredToEncode(_guid.Length);
            var buffer = new char[bufferSize];

            Convert.TryToBase64Chars(_guid, buffer, out int written);
            return buffer;
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public byte[] Base64_EncodeToUtf8()
        {
            int bufferSize = WebEncoders.GetArraySizeRequiredToEncode(_guid.Length);
            var buffer = new byte[bufferSize];

            Base64.EncodeToUtf8(_guid, buffer, out int consumed, out int written);

            return buffer;
        }
    }
}

#endif
