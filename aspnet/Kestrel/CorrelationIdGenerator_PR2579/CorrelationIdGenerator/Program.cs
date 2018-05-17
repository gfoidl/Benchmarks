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
            var bench = new BeginChunkBytesBenchmarks();
            Console.WriteLine(GetString(bench.Default()));
            Console.WriteLine(GetString(bench.Unsafe()));
            Console.WriteLine(GetString(bench.BytesSafeHexUnsafe()));
            Console.WriteLine(GetString(bench.NoLookup()));
            Console.WriteLine(GetString(bench.NoLookupBranchless()));
#if !DEBUG
            BenchmarkRunner.Run<BeginChunkBytesBenchmarks>();
#endif
        }
        //---------------------------------------------------------------------
        private static string GetString(ArraySegment<byte> arraySegment)
        {
            var span = arraySegment.AsSpan();
            var sb = new StringBuilder(span.Length);
            for (int i = 0; i < span.Length; ++i)
                sb.AppendFormat("{0} ", span[i]);

            return sb.ToString();
        }
    }
}
