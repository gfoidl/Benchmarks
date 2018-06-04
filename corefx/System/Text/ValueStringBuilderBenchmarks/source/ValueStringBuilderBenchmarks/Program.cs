using BenchmarkDotNet.Running;
using ValueStringBuilderBenchmarks.Benchmarks;

namespace ValueStringBuilderBenchmarks
{
    static class Program
    {
        static void Main(string[] args)
        {
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);

            //var bench = new StringBuilderBench();
            //bench.ValueStringBuilder0_AppendChar();
            //bench.ValueStringBuilder1_AppendChar();
        }
    }
}
