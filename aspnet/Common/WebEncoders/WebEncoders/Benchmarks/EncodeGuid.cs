using System;
using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Internal;

namespace WebEncodersBench.Benchmarks
{
    public class EncodeGuid : BaseBenchmark
    {
        private readonly byte[] _guid = Guid.NewGuid().ToByteArray();
        //---------------------------------------------------------------------
#if DEBUG
        public byte[] Data => _guid;
#endif
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string Default() => WebEncoders0.Base64UrlEncode(_guid);
        //---------------------------------------------------------------------
        [Benchmark]
        public string PR_334() => WebEncoders1.Base64UrlEncode(_guid);
        //---------------------------------------------------------------------
        [Benchmark]
        public string New() => WebEncoders.Base64UrlEncode(_guid);
    }
}
