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
            var status1 = bench1.Base();
            var status2 = bench1.PR_34529();

            Console.WriteLine(status1);
            Console.WriteLine(status2);

            var bench2 = new DecodeUtf8Benchmark();
            bench2.GlobalSetup();
            status1 = bench2.Base();
            status2 = bench2.PR_34529();

            Console.WriteLine(status1);
            Console.WriteLine(status2);
#if !DEBUG
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
