using System;
using System.Text;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Attributes.Jobs;
using BenchmarkDotNet.Running;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Http;

namespace CorrelationIdGeneratorBenchmarks.Benchmarks
{
    [MemoryDiagnoser]
    [CoreJob, ClrJob]
    public class BeginChunkBytesBenchmarks : IBenchmark
    {
        public void Run(string[] args)
        {
            Console.WriteLine(GetString(this.Default()));
            Console.WriteLine(GetString(this.Unsafe()));
            Console.WriteLine(GetString(this.BytesSafeHexUnsafe()));
            Console.WriteLine(GetString(this.NoLookup()));
            Console.WriteLine(GetString(this.NoLookupBranchless()));
            //-----------------------------------------------------------------
            string GetString(ArraySegment<byte> arraySegment)
            {
                var span = arraySegment.AsSpan();
                var sb = new StringBuilder(span.Length);
                for (int i = 0; i < span.Length; ++i)
                    sb.AppendFormat("{0} ", span[i]);

                return sb.ToString();
            }
        }
        //---------------------------------------------------------------------
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
