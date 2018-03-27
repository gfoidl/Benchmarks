using System;
using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Internal;

namespace WebEncodersBench.Benchmarks
{
    public class EncodeData : BaseBenchmark
    {
        private byte[] _data;
        //---------------------------------------------------------------------
        [Params(10, 50, 100)]
        public int DataSize { get; set; } = 20;
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _data = new byte[this.DataSize];
            var rnd = new Random(0);
            rnd.NextBytes(_data);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string Default() => WebEncoders0.Base64UrlEncode(_data);
        //---------------------------------------------------------------------
        //[Benchmark]
        public string Base_PR() => WebEncoders1.Base64UrlEncode(_data);
        //---------------------------------------------------------------------
        [Benchmark]
        public string New() => WebEncoders.Base64UrlEncode(_data);
    }
}
