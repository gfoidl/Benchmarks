using BenchmarkDotNet.Attributes;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace CorrelationIdGenerator_Benchmarks
{
    [MemoryDiagnoser]
    public class GetNextIdBenchmark
    {
        [Benchmark(Baseline = true)]
        public string Default() => CorrelationIdGenerator.GetNextId();
        //---------------------------------------------------------------------
        //[Benchmark]
        public string ROSTrick() => CorrelationIdGenerator1.GetNextId();
        //---------------------------------------------------------------------
        //[Benchmark]
        public string ROSTrickUnsafe() => CorrelationIdGenerator2.GetNextId();
        //---------------------------------------------------------------------
        //[Benchmark]
        public string SpanCopy() => CorrelationIdGenerator3.GetNextId();
        //---------------------------------------------------------------------
        //[Benchmark]
        public string SpanCopy1() => CorrelationIdGenerator4.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string Simd() => CorrelationIdGenerator5.GetNextId();
    }
}
