using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
    public class Substring
    {
        private readonly StringSegment  _default = new StringSegment("Hello world!");
        private readonly StringSegment1 _new     = new StringSegment1("Hello world!");
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string Default() => _default.Substring(3, 2);
        //---------------------------------------------------------------------
        [Benchmark]
        public string New() => _new.Substring(3, 2);
    }
}
