using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Attributes.Jobs;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Http;

namespace CorrelationIdGeneratorBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    //[CoreJob, ClrJob]
    public class BeginChunkBytesBenchmarks
    {
        private int _dataCount = 123456;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public ArraySegment<byte> Default() => ChunkWriter.BeginChunkBytes(_dataCount);
        //---------------------------------------------------------------------
        [Benchmark]
        public ArraySegment<byte> Unsafe() => ChunkWriter1.BeginChunkBytes(_dataCount);
        //---------------------------------------------------------------------
        [Benchmark]
        public ArraySegment<byte> BytesSafeHexUnsafe() => ChunkWriter2.BeginChunkBytes(_dataCount);
        //---------------------------------------------------------------------
        [Benchmark]
        public ArraySegment<byte> NoLookup() => ChunkWriter3.BeginChunkBytes(_dataCount);
        //---------------------------------------------------------------------
        [Benchmark]
        public ArraySegment<byte> NoLookupBranchless() => ChunkWriter4.BeginChunkBytes(_dataCount);
    }
}
