using BenchmarkDotNet.Attributes;
using WebEncodersBench.Spans;

namespace WebEncodersBench.Benchmarks
{
    public class IntSpan
    {
        private int[] _array;
        //---------------------------------------------------------------------
        [Params(1, 10, 64, 100, 128, 512, 1000)]
        public int Size { get; set; }
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _array = new int[this.Size];
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void Base() => SpanBase.Fill(_array, 42);
        //---------------------------------------------------------------------
        [Benchmark]
        public void Base1() => SpanBase1.Fill(_array, 42);
        //---------------------------------------------------------------------
        [Benchmark]
        public void A() => SpanA.Fill(_array, 42);
        //---------------------------------------------------------------------
        [Benchmark]
        public void B() => SpanB.Fill(_array, 42);
        //---------------------------------------------------------------------
        [Benchmark]
        public void C() => SpanC.Fill(_array, 42);
        //---------------------------------------------------------------------
        [Benchmark]
        public void D() => SpanD.Fill(_array, 42);
    }
}
