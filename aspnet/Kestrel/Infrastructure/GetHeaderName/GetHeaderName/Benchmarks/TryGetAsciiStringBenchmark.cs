using System;
using System.Diagnostics;
using System.Text;
using BenchmarkDotNet.Attributes;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace GetHeaderName.Benchmarks
{
    public class TryGetAsciiStringBenchmark
    {
        private char[] _expected;
        private byte[] _bytes;
        private char[] _output;

        public string Expected => new string(_expected);
        public string Output => new string(_output);

        [Params(4, 8, 16, 32, 100)]
        public int BytesLen { get; set; } = 100;

        [GlobalSetup]
        public void GlobalSetup()
        {
            _expected = new char[this.BytesLen];
            var rnd = new Random(42);
            char[] domain = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRQRSTUVXYZ".ToCharArray();

            for (int i = 0; i < this.BytesLen; ++i)
            {
                int idx = rnd.Next(domain.Length);
                _expected[i] = domain[idx];
            }

            _bytes = Encoding.ASCII.GetBytes(_expected);
            _output = new char[_bytes.Length];
        }

        [Benchmark(Baseline = true)]
        public unsafe bool Current_master()
        {
            fixed (byte* input = _bytes)
            fixed (char* output = _output)
            {
                bool res = StringUtilities.TryGetAsciiString(input, output, this.BytesLen);
                Debug.Assert(_expected.AsSpan().SequenceEqual(_output));
                return res;
            }
        }

        [Benchmark]
        public unsafe bool This_PR()
        {
            fixed (byte* input = _bytes)
            fixed (char* output = _output)
            {
                bool res = StringUtilitiesNoBMI2.TryGetAsciiString(input, output, this.BytesLen);
                Debug.Assert(_expected.AsSpan().SequenceEqual(_output));
                return res;
            }
        }
    }
}
