using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;

namespace Base64TransformsBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    public class ToBase64TransformBlockBenchmark
    {
        private readonly ToBase64Transform_orig _orig = new ToBase64Transform_orig();
        private readonly ToBase64Transform      _new  = new ToBase64Transform();

        private byte[] _inputBuffer  = { 0x12, 0x23, 0x34, 0x45, 0x56 };
        private byte[] _outputBuffer = new byte[100];
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Original() => _orig.TransformBlock(_inputBuffer, 0, 3, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR() => _new.TransformBlock(_inputBuffer, 0, 3, _outputBuffer, 0);
    }
}
