using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
    public class LastIndexOf
    {
        private readonly StringSegment  _default = new StringSegment("aHello world!Hello world!Hello world!");
        private readonly StringSegment1 _new     = new StringSegment1("aHello world!Hello world!Hello world!");
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Default() => _default.LastIndexOf('a');
        //---------------------------------------------------------------------
        [Benchmark]
        public int New() => _new.LastIndexOf('a');
    }
}
