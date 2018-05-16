using System;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace CorrelationIdGeneratorBenchmarks
{
    static class Program
    {
        static void Main(string[] args)
        {
            var getNextIdBenchmark = new GetNextIdBenchmark();
            Console.WriteLine(getNextIdBenchmark.Default());
            Console.WriteLine(getNextIdBenchmark.StringCreate());
            Console.WriteLine(getNextIdBenchmark.StringCreateSpanUnsafe());
#if !DEBUG
            BenchmarkRunner.Run<GetNextIdBenchmark>();
#endif
        }
    }
}
