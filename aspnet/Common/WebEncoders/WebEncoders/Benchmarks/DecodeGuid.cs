using System;
using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Internal;

namespace WebEncodersBench.Benchmarks
{
    public class DecodeGuid : BaseBenchmark
    {
        private readonly string _base64UrlEncoded;
        //---------------------------------------------------------------------
        public Guid Guid { get; }
        //---------------------------------------------------------------------
        public DecodeGuid()
        {
            this.Guid = Guid.NewGuid();
            byte[] tmp = this.Guid.ToByteArray();
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
        //[Benchmark]
        public byte[] Base_PR() => WebEncoders1.Base64UrlDecode(_base64UrlEncoded);
        //---------------------------------------------------------------------
        [Benchmark]
        public byte[] New() => WebEncoders.Base64UrlDecode(_base64UrlEncoded);
    }
}
