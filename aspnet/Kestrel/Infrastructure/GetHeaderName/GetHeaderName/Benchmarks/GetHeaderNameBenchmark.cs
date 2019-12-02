using System;
using System.Text;
using BenchmarkDotNet.Attributes;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace GetHeaderName.Benchmarks
{
    public class GetHeaderNameBenchmark
    {
        private byte[] _headerNameBytes = Encoding.UTF8.GetBytes("Content-Length");

        [Benchmark(Baseline = true)]
        public string Default()
        {
            ReadOnlySpan<byte> buffer = _headerNameBytes;
            return buffer.GetHeaderNameDefault();
        }

        [Benchmark]
        public string Default_withImprovedStringUtitlites()
        {
            ReadOnlySpan<byte> buffer = _headerNameBytes;
            return buffer.GetHeaderNameDefaultWithImproveStringUtilities();
        }

        [Benchmark]
        public string StringCreate()
        {
            ReadOnlySpan<byte> buffer = _headerNameBytes;
            return buffer.GetHeaderName_StringCreate();
        }

        [Benchmark]
        public string NewString()
        {
            ReadOnlySpan<byte> buffer = _headerNameBytes;
            return buffer.GetHeaderName_Copy();
        }
    }
}
