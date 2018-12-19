using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Attributes.Jobs;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace CorrelationIdGeneratorBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    [CoreJob, ClrJob]
    public class ConcatAsHexSuffixBenchmark : IBenchmark
    {
        public void Run(string[] args)
        {
            Console.WriteLine(this.Default());
            Console.WriteLine(this.StringCreateSpanUnsafe());
            Console.WriteLine(this.NoLookup());
            Console.WriteLine(this.NoLookupBranchless());
        }
        //---------------------------------------------------------------------
        private string _connectionId = CorrelationIdGenerator2.GetNextId();
        private int    _streamId = 42;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string Default() => StringUtilities.ConcatAsHexSuffix(_connectionId, ':', (uint)_streamId);
        //---------------------------------------------------------------------
        [Benchmark]
        public string StringCreateSpanUnsafe() => StringUtilities1.ConcatAsHexSuffix(_connectionId, ':', (uint)_streamId);
        //---------------------------------------------------------------------
        [Benchmark]
        public string NoLookup() => StringUtilities2.ConcatAsHexSuffix(_connectionId, ':', (uint)_streamId);
        //---------------------------------------------------------------------
        [Benchmark]
        public string NoLookupBranchless() => StringUtilities3.ConcatAsHexSuffix(_connectionId, ':', (uint)_streamId);
    }
}
