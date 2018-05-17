using System;
using System.Text;
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
            //Run<GetNextIdBenchmark>(args);
            //Run<BeginChunkBytesBenchmarks>(args);
            Run<ConcatAsHexSuffixBenchmark>(args);
        }
        //---------------------------------------------------------------------
        private static void Run<T>(string[] args) where T : IBenchmark, new()
        {
            var bench = new T();
            bench.Run(args);
#if !DEBUG
            BenchmarkRunner.Run<T>();
#endif
        }
    }
}
