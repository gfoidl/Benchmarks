using System;
using System.Text;
using BenchmarkDotNet.Attributes;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace GetHeaderName.Benchmarks
{
    [MemoryDiagnoser]
    public class GetAsciiStringNonNullCharactersBenchmark
    {
        private char[] _expected;
        private byte[] _bytes;

        public string Expected => new string(_expected);

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
        }

        [Benchmark(Baseline = true)]
        public string Default()
        {
            ReadOnlySpan<byte> buffer = _bytes;
            return buffer.GetAsciiStringNonNullCharactersDefault();
        }

        [Benchmark]
        public string Default_withImprovedStringUtitlites()
        {
            ReadOnlySpan<byte> buffer = _bytes;
            return buffer.GetAsciiStringNonNullCharactersDefaultWithImproveStringUtilities();
        }

        [Benchmark]
        public string StringCreate()
        {
            ReadOnlySpan<byte> buffer = _bytes;
            return buffer.GetAsciiStringNonNullCharacters();
        }
    }
}
