using System.MathBenchmarks;
using BenchmarkDotNet.Attributes;

namespace Math_Min_Max.Benchmarks
{
    public class MinZero
    {
        //[Benchmark(Baseline = true, OperationsPerInvoke = 2 * MathTests.Iterations)]
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

        //[Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]
        [Benchmark(Baseline = true, OperationsPerInvoke = 2 * MathTests.Iterations)]
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

        //[Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]
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

        [Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]
        public double DefaultReorderedVectorized()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.DefaultReorderedVectorized.Min(val1, val2);
                result += Variants.DefaultReorderedVectorized.Min(val2, val1);
            }

            return result;
        }

        [Benchmark(OperationsPerInvoke = 2 * MathTests.Iterations)]
        public double DefaultReorderedVectorizedHotCold()
        {
            double result = 0.0, val1 = -0.0, val2 = 0.0;

            for (int iteration = 0; iteration < MathTests.Iterations; ++iteration)
            {
                result += Variants.DefaultReorderedVectorizedHotCold.Min(val1, val2);
                result += Variants.DefaultReorderedVectorizedHotCold.Min(val2, val1);
            }

            return result;
        }
    }
}
