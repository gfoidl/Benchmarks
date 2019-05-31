using System;
using System.Buffers;
using System.Buffers.Text;
using BenchmarkDotNet.Attributes;

namespace Base64Benchmarks
{
    [Config(typeof(HardwareIntrinsicsCustomConfig))]
    public class DecodeUtf8Benchmark
    {
        private byte[] _base64;
        private byte[] _decoded;
        //---------------------------------------------------------------------
        [Params(5, 16, 1_000)]
        public int DataLen { get; set; } = 16;
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            var data = new byte[this.DataLen];
            _base64  = new byte[(this.DataLen + 2) / 3 * 4];

            var rnd = new Random(42);
            rnd.NextBytes(data);

            Base64_Baseline.EncodeToUtf8(data, _base64, out int _, out int _);

            _decoded = new byte[this.DataLen];
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public OperationStatus Base()
        {
            return Base64_Baseline.DecodeFromUtf8(_base64, _decoded, out int _, out int _);
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public OperationStatus PR_34529()
        {
            return Base64_PR_34529.DecodeFromUtf8(_base64, _decoded, out int _, out int _);
        }
    }
}
