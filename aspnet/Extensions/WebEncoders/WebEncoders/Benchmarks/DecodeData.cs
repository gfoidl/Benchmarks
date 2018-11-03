using System;
using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Internal;

namespace WebEncodersBench.Benchmarks
{
    public class DecodeData : BaseBenchmark
    {
        private string _base64UrlEncoded;
        //---------------------------------------------------------------------
        [Params(10, 50, 100)]
        public int DataSize { get; set; }
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            var tmp = new byte[this.DataSize];
            var rnd = new Random(0);
            rnd.NextBytes(tmp);

            string base64 = Convert.ToBase64String(tmp);
            _base64UrlEncoded = base64
                .Replace('+', '-')
                .Replace('/', '_')
                .Replace("=", string.Empty);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public byte[] Default() => WebEncoders0.Base64UrlDecode(_base64UrlEncoded);
        //---------------------------------------------------------------------
        [Benchmark]
        public byte[] PR_334() => WebEncoders1.Base64UrlDecode(_base64UrlEncoded);
        //---------------------------------------------------------------------
        [Benchmark]
        public byte[] New() => WebEncoders.Base64UrlDecode(_base64UrlEncoded);
    }
}
