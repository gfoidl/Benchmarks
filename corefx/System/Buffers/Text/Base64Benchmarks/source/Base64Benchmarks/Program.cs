using BenchmarkDotNet.Running;
using System;

namespace Base64Benchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            var bench1 = new EncodeUtf8Benchmark();
            bench1.GlobalSetup();
            var status1 = bench1.PR34529_Base();
            var status2 = bench1.PR34529_Pointers_GetPinnableReference();
            var status3 = bench1.PR34529_Pointers_Reference();

            Console.WriteLine(status1);
            Console.WriteLine(status2);
            Console.WriteLine(status3);

            var bench2 = new DecodeUtf8Benchmark();
            bench2.GlobalSetup();
            status1 = bench2.PR34529_Base();
            status2 = bench2.PR34529_Pointers_GetPinnableReference();
            status3 = bench2.PR34529_Pointers_Reference();

            Console.WriteLine(status1);
            Console.WriteLine(status2);
            Console.WriteLine(status3);
#if !DEBUG
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
