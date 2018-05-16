using System;
using CorrelationIdGeneratorBenchmarks.Benchmarks;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace CorrelationIdGeneratorBenchmarks
{
    static class Program
    {
        static void Main(string[] args)
        {
            var bench = new ConcatAsHexSuffixBenchmark();
            Console.WriteLine(bench.Default());
            Console.WriteLine(bench.StringCreateSpanUnsafe());
#if !DEBUG
            BenchmarkRunner.Run<ConcatAsHexSuffixBenchmark>();
#endif
        }
    }
}
