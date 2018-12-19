using System;
using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
    public class EndsWith
    {
        private readonly StringSegment  _default = new StringSegment("Hello world!");
        private readonly StringSegment1 _new     = new StringSegment1("Hello world!");
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public bool Default() => _default.EndsWith("Hel", StringComparison.Ordinal);
        //---------------------------------------------------------------------
        [Benchmark]
        public bool New() => _new.EndsWith("Hel", StringComparison.Ordinal);
    }
}
