using System.Runtime.CompilerServices;
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
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void DllImport() => NativeDllImport.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void LoadLibrary() => NativeMethods.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.empty();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void CallI() => Calli.Empty();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void CallITail() => CalliTail.Empty();
    }
}
