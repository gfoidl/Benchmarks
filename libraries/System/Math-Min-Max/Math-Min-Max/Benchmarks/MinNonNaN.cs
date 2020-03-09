using System.MathBenchmarks;
using BenchmarkDotNet.Attributes;

namespace Math_Min_Max.Benchmarks
{
    public class MinNonNaN
    {
        private const double minDelta = 0.0004;

        [Benchmark(Baseline = true, OperationsPerInvoke = MathTests.Iterations)]
        public double Default()
        {
            double result = 0.0, val1 = 1.0, val2 = 1.0 + minDelta;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                val2   -= minDelta;
                result += Variants.Default.Min(val1, val2);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = MathTests.Iterations)]
        public double InlinedOptimized()
        {
            double result = 0.0, val1 = 1.0, val2 = 1.0 + minDelta;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                val2   -= minDelta;
                result += Variants.InlinedOptimized.Min(val1, val2);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = MathTests.Iterations)]
        public double Vectorized()
        {
            double result = 0.0, val1 = 1.0, val2 = 1.0 + minDelta;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                val2   -= minDelta;
                result += Variants.Vectorized.Min(val1, val2);
            }

            return result;
        }
    }
}
