using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Attributes.Jobs;
using BenchmarkDotNet.Running;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace CorrelationIdGeneratorBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    [CoreJob, ClrJob]
    public class GetNextIdBenchmark : IBenchmark
    {
        public void Run(string[] args)
        {
#if DEBUG
            long lastId = DateTime.UtcNow.Ticks;
            CorrelationIdGenerator.LastId = lastId;
            CorrelationIdGenerator1.LastId = lastId;
            CorrelationIdGenerator2.LastId = lastId;
            CorrelationIdGenerator3.LastId = lastId;
            CorrelationIdGenerator4.LastId = lastId;
#endif
            Console.WriteLine(this.Default());
            Console.WriteLine(this.StringCreate());
            Console.WriteLine(this.StringCreateSpanUnsafe());
            Console.WriteLine(this.NoLookup());
            Console.WriteLine(this.NoLookupBranchless());
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string Default() => CorrelationIdGenerator.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string StringCreate() => CorrelationIdGenerator1.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string StringCreateSpanUnsafe() => CorrelationIdGenerator2.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string NoLookup() => CorrelationIdGenerator3.GetNextId();
        //---------------------------------------------------------------------
        [Benchmark]
        public string NoLookupBranchless() => CorrelationIdGenerator4.GetNextId();
    }
}
