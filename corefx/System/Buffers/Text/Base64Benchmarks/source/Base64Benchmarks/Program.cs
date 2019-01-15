using BenchmarkDotNet.Running;
using System;

namespace Base64Benchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            var bench1 = new EncodeUtf8Benchmark();
            var status1 = bench1.PR34529_Base();
            var status2 = bench1.PR34529_Pointers();

            Console.WriteLine(status1);
            Console.WriteLine(status2);

            var bench2 = new DecodeUtf8Benchmark();
            status1 = bench2.PR34529_Base();
            status2 = bench2.PR34529_Pointers();

            Console.WriteLine(status1);
            Console.WriteLine(status2);
#if !DEBUG
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
