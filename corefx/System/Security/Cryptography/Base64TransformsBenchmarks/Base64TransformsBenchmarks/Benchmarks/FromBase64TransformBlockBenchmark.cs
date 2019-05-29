using System.Security.Cryptography;
using BenchmarkDotNet.Attributes;

namespace Base64TransformsBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    public class FromBase64TransformBlockBenchmark
    {
        private readonly FromBase64Transform_orig _orig = new FromBase64Transform_orig();
        private readonly FromBase64Transform      _new  = new FromBase64Transform();

        private byte[] _inputBuffer  = { (byte)'a', (byte)'b', (byte)'c', (byte)'d', 42 };
        private byte[] _outputBuffer = new byte[100];
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Original() => _orig.TransformBlock(_inputBuffer, 0, 4, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR() => _new.TransformBlock(_inputBuffer, 0, 4, _outputBuffer, 0);
    }
}
