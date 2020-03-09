using System.MathBenchmarks;
using BenchmarkDotNet.Attributes;

namespace Math_Min_Max.Benchmarks
{
    public class MinZero
    {
        [Benchmark(Baseline = true, OperationsPerInvoke = MathTests.Iterations)]
        public double Default()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.Default.Min(val1, val2);
                result += Variants.Default.Min(val2, val1);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = MathTests.Iterations)]
        public double InlinedOptimized()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.InlinedOptimized.Min(val1, val2);
                result += Variants.InlinedOptimized.Min(val2, val1);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = MathTests.Iterations)]
        public double Vectorized()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.Vectorized.Min(val1, val2);
                result += Variants.Vectorized.Min(val2, val1);
            }

            return result;
        }
    }
}
