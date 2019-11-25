using System;
using HandshakeHelpers.Benchmarks;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace HandshakeHelpers
{
    class Program
    {
        static void Main(string[] args)
        {
#if DEBUG
            Console.WriteLine("valid key:");
            var validBench = new ValidKey();
            Console.WriteLine(validBench.Baseline());
            Console.WriteLine(validBench.PR12386());
            Console.WriteLine(validBench.Vectorized());

            Console.WriteLine("\ninvalid key:");
            var invalidBench = new InvalidKey();
            foreach (string key in InvalidKey.KeyValues())
            {
                Console.WriteLine($"\tkey: {key}");
                invalidBench.Key = key;
                Console.WriteLine(invalidBench.Baseline());
                Console.WriteLine(invalidBench.PR12386());
                Console.WriteLine(invalidBench.Vectorized());
            }
#else
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
