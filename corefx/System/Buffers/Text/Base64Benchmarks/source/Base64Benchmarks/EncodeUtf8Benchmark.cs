using System;
using System.Buffers;
using System.Buffers.Text;
using BenchmarkDotNet.Attributes;

namespace Base64Benchmarks
{
    [Config(typeof(HardwareIntrinsicsCustomConfig))]
    public class EncodeUtf8Benchmark
    {
        private byte[] _data;
        private byte[] _base64;
        //---------------------------------------------------------------------
        [Params(5, 16, 1_000)]
        public int DataLen { get; set; } = 16;
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _data   = new byte[this.DataLen];
            _base64 = new byte[(this.DataLen + 2) / 3 * 4];

            var rnd = new Random(42);
            rnd.NextBytes(_data);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public OperationStatus Base()
        {
            return Base64_Baseline.EncodeToUtf8(_data, _base64, out int _, out int _);
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public OperationStatus PR_34529()
        {
            return Base64_PR_34529.EncodeToUtf8(_data, _base64, out int _, out int _);
        }
    }
}
