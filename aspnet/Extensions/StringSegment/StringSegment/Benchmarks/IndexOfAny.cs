using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
    public class IndexOfAny
    {
        private readonly StringSegment  _default = new StringSegment("Hello world!\r\n");
        private readonly StringSegment1 _new     = new StringSegment1("Hello world!\r\n");
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Default() => _default.IndexOfAny(new[] { '\n', '\r' });
        //---------------------------------------------------------------------
        [Benchmark]
        public int New() => _new.IndexOfAny(new[] { '\n', '\r' });
    }
}
