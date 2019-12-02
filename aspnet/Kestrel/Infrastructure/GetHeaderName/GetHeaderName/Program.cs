//#define STRING_UTILITIES
//#define GET_HEADERNAME
//#define GET_ASCIISTRING
#define GET_ASCII_OR_UTF8_STRING

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

#if STRING_UTILITIES
            var bench = new Benchmarks.TryGetAsciiStringBenchmarks();
            bench.BytesLen = 32;
            bench.GlobalSetup();
            Console.WriteLine(bench.Expected);

            bool b0 = bench.Default();
            Console.WriteLine(bench.Output);

            bool b1 = bench.ThisPR();
            Console.WriteLine(bench.Output);

            bool b2 = bench.ThisPR_ExitEarly();
            Console.WriteLine(bench.Output);
#elif GET_HEADERNAME
            var bench = new Benchmarks.GetHeaderNameBenchmark();

            Console.WriteLine(bench.Default());
            Console.WriteLine(bench.Default_withImprovedStringUtitlites());
            Console.WriteLine(bench.StringCreate());
            Console.WriteLine(bench.NewString());
#elif GET_ASCIISTRING
            var bench = new Benchmarks.GetAsciiStringNonNullCharactersBenchmark();
            bench.BytesLen = 32;
            bench.GlobalSetup();
            Console.WriteLine(bench.Expected);
            Console.WriteLine(bench.Default());
            Console.WriteLine(bench.Default_withImprovedStringUtitlites());
            Console.WriteLine(bench.StringCreate());
#elif GET_ASCII_OR_UTF8_STRING
            var bench = new Benchmarks.GetAsciiOrUTF8StringNonNullCharactersBenchmark();
            foreach (var (length, data) in Benchmarks.GetAsciiOrUTF8StringNonNullCharactersBenchmark.TestDataSource())
            {
                bench.TestData = (length, data);
                bench.GlobalSetup();
                Console.WriteLine(bench.Expected);
                Console.WriteLine(bench.Default());
                Console.WriteLine(bench.StringCreate());
                Console.WriteLine();
            }
#endif

#if BENCH
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
