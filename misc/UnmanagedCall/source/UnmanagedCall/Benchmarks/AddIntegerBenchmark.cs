using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.FunctionPointers;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    [DisassemblyDiagnoser]
    public class AddIntegerBenchmark
    {
        private int _a = 3;
        private int _b = 4;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int DllImport() => NativeDllImport.add_i(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public int DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.add_i(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public int LoadLibrary() => NativeMethods.add_i(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public int LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.add_i(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public int CallI() => Calli.Add(_a, _b);
        //---------------------------------------------------------------------
        //[Benchmark]
        public int CallITail() => CalliTail.Add(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public int FunctionPointerDefault() => FunctionPointersDefault.Add(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public int FunctinoPointerCdecl() => FunctionPointersCdecl.Add(_a, _b);
    }
}
