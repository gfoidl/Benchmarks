using System.MathBenchmarks;
using BenchmarkDotNet.Attributes;

namespace Math_Min_Max.Benchmarks
{
    public class MaxZero
    {
        //[Benchmark(Baseline = true, OperationsPerInvoke = 2 * MathTests.Iterations)]
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

        //[Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]
        [Benchmark(Baseline = true, OperationsPerInvoke = 2 * MathTests.Iterations)]
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

        //[Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]
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

        [Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]

        public double DefaultReorderedVectorized()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.DefaultReorderedVectorized.Max(val1, val2);
                result += Variants.DefaultReorderedVectorized.Max(val2, val1);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]

        public double DefaultReorderedVectorizedHotCold()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.DefaultReorderedVectorizedHotCold.Max(val1, val2);
                result += Variants.DefaultReorderedVectorizedHotCold.Max(val2, val1);
            }

            return result;
        }
    }
}
