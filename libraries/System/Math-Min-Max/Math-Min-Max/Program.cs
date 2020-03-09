#define BENCH

using System.Runtime.CompilerServices;
using Math_Min_Max.Variants;

#if BENCH
using BenchmarkDotNet.Running;
#endif

namespace Math_Min_Max
{
    class Program
    {
#if BENCH
        static void Main(string[] args)
        {
#if DEBUG
            var bench = new Benchmarks.MinNaN();
            double res = bench.InlinedOptimized();
#endif

            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#else
        static int Main(string[] args)
        {
            double a = double.NaN;
            double b = 1;
            var min = Do(a, b);

            System.Console.WriteLine(min);
            return min == a ? 0 : 1;
#endif
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        private static double Do(double a, double b)
        {
            return Default.Min(a, b);
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        private static float Do(float a, float b)
        {
            return Default.Min(a, b);
        }
    }
}
