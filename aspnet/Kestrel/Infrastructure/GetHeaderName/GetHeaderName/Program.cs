using System;
using System.Runtime.Intrinsics.X86;

#if BENCH
using BenchmarkDotNet.Running;
#endif

namespace GetHeaderName
{
    unsafe class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine($"avx2: {Avx2.IsSupported}");
            Console.WriteLine($"sse2: {Sse2.IsSupported}");
            Console.WriteLine($"bmi2: {Bmi2.X64.IsSupported} (x64), {Bmi2.IsSupported}");
            Console.WriteLine();

            var bench = new Benchmarks.TryGetAsciiStringBenchmark();
            bench.BytesLen = 32;
            bench.GlobalSetup();
            Console.WriteLine(bench.Expected);

            bool b0 = bench.Current_master();
            Console.WriteLine(bench.Output);

            bool b1 = bench.This_PR();
            Console.WriteLine(bench.Output);

            
#if BENCH
            //BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
            BenchmarkRunner.Run<Benchmarks.TryGetAsciiStringBenchmark>();
#endif
        }
    }
}
