using WebEncodersBench.Benchmarks;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace Span_Fill
{
    static class Program
    {
        static void Main(string[] args)
        {
#if DEBUG
            var bench = new IntSpan();
            bench.Size = 10;
            bench.GlobalSetup();
            bench.Base();
            bench.Base1();
            bench.A();
            bench.B();
            bench.C();
            bench.D();
#else
            var switcher = BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly);
            switcher.Run(args);
#endif
        }
    }
}
