using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;

namespace WebEncodersBench.Benchmarks
{
    public class ValueTupleVsOut
    {
        private int _a = 42;
        private int _b = 8;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public bool ValueTuple()
        {
            var (div, mod) = this.A(_a, _b);

            return _a == _b * div + mod;
        }
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public bool Out()
        {
            this.B(_a, _b, out int div, out int mod);

            return _a == _b * div + mod;
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (int div, int mod) A(int a, int b)
        {
            int div = a / b;
            int mod = a - div * b;

            return (div, mod);
        }
        //---------------------------------------------------------------------
        private void B(int a, int b, out int div, out int mod)
        {
            div = a / b;
            mod = a - div * b;
        }
    }
}
