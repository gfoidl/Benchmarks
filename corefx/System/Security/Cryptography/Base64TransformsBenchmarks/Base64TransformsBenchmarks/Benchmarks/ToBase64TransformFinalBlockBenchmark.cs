using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;

namespace Base64TransformsBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    public class ToBase64TransformFinalBlockBenchmark
    {
        private readonly ToBase64Transform_orig _orig = new ToBase64Transform_orig();
        private readonly ToBase64Transform      _new  = new ToBase64Transform();

        private byte[] _inputBuffer = { 0x12, 0x23, 0x34, 0x45, 0x56 };
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public byte[] Original() => _orig.TransformFinalBlock(_inputBuffer, 0, 3);
        //---------------------------------------------------------------------
        [Benchmark]
        public byte[] PR() => _new.TransformFinalBlock(_inputBuffer, 0, 3);
    }
}
