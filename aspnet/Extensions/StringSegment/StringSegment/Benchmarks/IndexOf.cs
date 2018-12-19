using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
    public class IndexOf
    {
        private readonly StringSegment  _default = new StringSegment("Hello world!Hello world!Hello world!a");
        private readonly StringSegment1 _new     = new StringSegment1("Hello world!Hello world!Hello world!a");
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Default() => _default.IndexOf('a');
        //---------------------------------------------------------------------
        [Benchmark]
        public int New() => _new.IndexOf('a');
    }
}
