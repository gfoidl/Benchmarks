using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
    [MemoryDiagnoser]
    public class GetHashCode
    {
        private readonly StringSegment  _default = new StringSegment("Hello world!");
        private readonly StringSegment1 _new     = new StringSegment1("Hello world!");
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Default() => _default.GetHashCode();
        //---------------------------------------------------------------------
        [Benchmark]
        public int New() => _new.GetHashCode();
    }
}
