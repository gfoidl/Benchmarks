using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    public class EmptyBenchmark
    {
        public EmptyBenchmark()
        {
            // JIT static types
            NativeDllImport.empty();
            NativeDllImportWOSecurityCheck.empty();
            NativeMethods.empty();
            NativeMethodsWOSecurityCheck.empty();
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void DllImport() => NativeDllImport.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        public void DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        public void LoadLibrary() => NativeMethods.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        public void LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        public void CallI() => Calli.Empty();
    }
}
