using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;

namespace Base64TransformsBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    public class FromBase64TransformFinalBlockBenchmark
    {
        private readonly FromBase64Transform_orig _orig = new FromBase64Transform_orig();
        private readonly FromBase64Transform      _new  = new FromBase64Transform();

        private byte[] _inputBuffer = { (byte)'a', (byte)'b', (byte)'c', (byte)'d', 42 };
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public byte[] Original() => _orig.TransformFinalBlock(_inputBuffer, 0, 4);
        //---------------------------------------------------------------------
        [Benchmark]
        public byte[] PR() => _new.TransformFinalBlock(_inputBuffer, 0, 4);
    }
}
