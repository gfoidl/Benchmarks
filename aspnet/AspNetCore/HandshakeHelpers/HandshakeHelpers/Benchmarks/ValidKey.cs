using System;
using BenchmarkDotNet.Attributes;

namespace HandshakeHelpers.Benchmarks
{
    [MemoryDiagnoser]
    public class ValidKey
    {
        private string _key = Convert.ToBase64String(Guid.NewGuid().ToByteArray());
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public bool Baseline() => Helpers.Baseline.IsRequestKeyValid(_key);
        //---------------------------------------------------------------------
        [Benchmark]
        public bool PR12386() => Helpers.PR12386.IsRequestKeyValid(_key);
        //---------------------------------------------------------------------
        [Benchmark]
        public bool Vectorized() => Helpers.Vectorized.IsRequestKeyValid(_key);
    }
}
