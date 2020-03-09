using System.MathBenchmarks;
using BenchmarkDotNet.Attributes;

namespace Math_Min_Max.Benchmarks
{
    public class MaxZero
    {
        [Benchmark(Baseline = true, OperationsPerInvoke = MathTests.Iterations)]
        public double Default()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.Default.Max(val1, val2);
                result += Variants.Default.Max(val2, val1);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = MathTests.Iterations)]
        public double InlinedOptimized()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.InlinedOptimized.Max(val1, val2);
                result += Variants.InlinedOptimized.Max(val2, val1);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = MathTests.Iterations)]
        public double Vectorized()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.Vectorized.Max(val1, val2);
                result += Variants.Vectorized.Max(val2, val1);
            }

            return result;
        }
    }
}
