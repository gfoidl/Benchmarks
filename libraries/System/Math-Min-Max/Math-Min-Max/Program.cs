//#define BENCH
//#define RAYTRACER

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
#elif RAYTRACER
        static void Main()
        {
            var raytracer = new Benchmarks.Raytracer();
            raytracer.Run();
#else
        static int Main(string[] args)
        {
            double a = -1;
            double b = 1;
            var min = Do(a, b);

            System.Console.WriteLine(min);
            return min == a ? 0 : 1;
#endif
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        private static double Do(double a, double b)
        {
            return DefaultReordered.Min(a, b);
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        private static float Do(float a, float b)
        {
            return DefaultReordered.Min(a, b);
        }
    }
}
