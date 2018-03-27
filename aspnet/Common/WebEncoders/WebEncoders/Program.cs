using System;
using BenchmarkDotNet.Running;
using WebEncodersBench.Benchmarks;

namespace WebEncodersBench
{
    static class Program
    {
        static void Main(string[] args)
        {
#if DEBUG
            var bench = new EncodeGuid();
            string res = bench.New();

            Console.WriteLine($"'{Convert.ToBase64String(bench.Data)}'");
            Console.WriteLine($"'{res}'");
#elif DEBUG1
            var bench = new DecodeGuid();
            byte[] data = bench.New();
            var res = new Guid(data);
            Console.WriteLine(bench.Guid);
            Console.WriteLine(res);
            Console.WriteLine(res == bench.Guid);
#else
            var switcher = BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly);
            switcher.Run(args);
#endif
        }
    }
}
