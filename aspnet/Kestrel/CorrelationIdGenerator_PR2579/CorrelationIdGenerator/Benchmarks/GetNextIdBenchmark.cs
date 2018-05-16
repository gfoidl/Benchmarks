using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Attributes.Jobs;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace CorrelationIdGeneratorBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    [CoreJob, ClrJob]
    public class GetNextIdBenchmark
    {
        [Benchmark(Baseline = true)]
        public string Default() => CorrelationIdGenerator.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string StringCreate() => CorrelationIdGenerator1.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string StringCreateSpanUnsafe() => CorrelationIdGenerator2.GetNextId();
    }
}
