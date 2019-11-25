using System.Collections.Generic;
using BenchmarkDotNet.Attributes;

namespace HandshakeHelpers.Benchmarks
{
    [MemoryDiagnoser]
    public class InvalidKey
    {
        [ParamsSource(nameof(KeyValues))]
        public string Key { get; set; }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public bool Baseline() => Helpers.Baseline.IsRequestKeyValid(this.Key);
        //---------------------------------------------------------------------
        [Benchmark]
        public bool PR12386() => Helpers.PR12386.IsRequestKeyValid(this.Key);
        //---------------------------------------------------------------------
        [Benchmark]
        public bool Vectorized() => Helpers.Vectorized.IsRequestKeyValid(this.Key);
        //---------------------------------------------------------------------
        public static IEnumerable<string> KeyValues()
        {
            // too long for decoded 16 bytes
            yield return "2006a9da56994ea98a1f87a1db9c8e29";

            // - replace the valid +, so it's invalid base64
            yield return "fP5XtHaONkuR-K3f2MEPCg==";
        }
    }
}
