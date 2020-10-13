using System;
using UnmanagedCall.Benchmarks;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace UnmanagedCall
{
    static class Program
    {
        static void Main(string[] args)
        {
#if DEBUG
            var emptyBench = new EmptyBenchmark();
            emptyBench.DllImport();
            //emptyBench.DllImportWOSecurityCheck();
            //emptyBench.LoadLibrary();
            //emptyBench.LoadLibraryWOSecurityCheck();
            //emptyBench.CallI();
            //emptyBench.CallITail();
            emptyBench.FunctionPointerDefault();
            emptyBench.FunctionPointerCdecl();

            var intBench = new AddIntegerBenchmark();
            Console.WriteLine(intBench.DllImport());
            //Console.WriteLine(intBench.DllImportWOSecurityCheck());
            //Console.WriteLine(intBench.LoadLibrary());
            //Console.WriteLine(intBench.LoadLibraryWOSecurityCheck());
            //Console.WriteLine(intBench.CallI());
            //Console.WriteLine(intBench.CallITail());
            Console.WriteLine(intBench.FunctionPointerDefault());
            Console.WriteLine(intBench.FunctinoPointerCdecl());

            Console.WriteLine();

            var doubleBench = new AddDoubleBenchmark();
            Console.WriteLine(doubleBench.DllImport());
            //Console.WriteLine(doubleBench.DllImportWOSecurityCheck());
            //Console.WriteLine(doubleBench.LoadLibrary());
            //Console.WriteLine(doubleBench.LoadLibraryWOSecurityCheck());
            //Console.WriteLine(doubleBench.CallI());
            //Console.WriteLine(doubleBench.CallITail());
            Console.WriteLine(doubleBench.FunctionPointerDefault());
            Console.WriteLine(doubleBench.FunctionPointerCdecl());

            Console.WriteLine();

            var vecSumBench = new VecSumBenchmark();
            vecSumBench.GlobalSetup();
            try
            {
                Console.WriteLine(vecSumBench.DllImport());
                //Console.WriteLine(vecSumBench.DllImportWOSecurityCheck());
                //Console.WriteLine(vecSumBench.LoadLibrary());
                //Console.WriteLine(vecSumBench.LoadLibraryWOSecurityCheck());
                //Console.WriteLine(vecSumBench.CallI());
                //Console.WriteLine(vecSumBench.CallITail());
                Console.WriteLine(vecSumBench.FunctionPointerDefault());
                Console.WriteLine(vecSumBench.FunctionPointerCdecl());
            }
            finally
            {
                vecSumBench.GlobalCleanup();
            }
#else
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
