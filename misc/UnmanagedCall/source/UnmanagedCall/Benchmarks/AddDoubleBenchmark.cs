using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.FunctionPointers;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    [DisassemblyDiagnoser]
    public class AddDoubleBenchmark
    {
        private double _a = 3;
        private double _b = 4;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public double DllImport() => NativeDllImport.add_d(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.add_d(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double LoadLibrary() => NativeMethods.add_d(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.add_d(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double CallI() => Calli.Add(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double CallITail() => CalliTail.Add(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public double FunctionPointerDefault() => FunctionPointersDefault.Add(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public double FunctionPointerCdecl() => FunctionPointersCdecl.Add(_a, _b);
    }
}
