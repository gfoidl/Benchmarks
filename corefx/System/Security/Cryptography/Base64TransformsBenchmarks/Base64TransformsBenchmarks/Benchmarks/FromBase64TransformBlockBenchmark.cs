using System.Security.Cryptography;
using System.Text;
using BenchmarkDotNet.Attributes;

namespace Base64TransformsBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    public class FromBase64TransformBlockBenchmark
    {
        private readonly FromBase64Transform_orig  _orig      = new FromBase64Transform_orig();
        private readonly FromBase64Transform       _new       = new FromBase64Transform();
        private readonly FromBase64Transform_4     _new_4     = new FromBase64Transform_4();
        private readonly FromBase64Transform_32    _new_32    = new FromBase64Transform_32();
        private readonly FromBase64Transform_64    _new_64    = new FromBase64Transform_64();
        private readonly FromBase64Transform_128   _new_128   = new FromBase64Transform_128();
        private readonly FromBase64Transform_4_128 _new_4_128 = new FromBase64Transform_4_128();

        private byte[] _inputBuffer  = Encoding.ASCII.GetBytes("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
        private byte[] _outputBuffer = new byte[100];
        //---------------------------------------------------------------------
        [Params(1, 4, 10)]
        public int InputCount { get; set; } = 10;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Original() => _orig.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR() => _new.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR_4() => _new_4.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR_32() => _new_32.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR_64() => _new_64.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR_128() => _new_128.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
        //---------------------------------------------------------------------
        [Benchmark]
        public int PR_4_128() => _new_4_128.TransformBlock(_inputBuffer, 0, this.InputCount, _outputBuffer, 0);
    }
}
