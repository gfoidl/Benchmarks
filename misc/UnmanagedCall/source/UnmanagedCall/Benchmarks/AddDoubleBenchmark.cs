using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    public class AddDoubleBenchmark
    {
        private readonly double _res;
        private double          _a = 3;
        private double          _b = 4;
        //---------------------------------------------------------------------
        public AddDoubleBenchmark()
        {
            // JIT static types
            _res  = NativeDllImport.add_d(3, 4);
            _res += NativeDllImportWOSecurityCheck.add_d(3, 4);
            _res += NativeMethods.add_d(3, 4);
            _res += NativeMethodsWOSecurityCheck.add_d(3, 4);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public double DllImport() => NativeDllImport.add_d(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public double DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.add_d(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public double LoadLibrary() => NativeMethods.add_d(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public double LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.add_d(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public double CallI() => Calli.Add(_a, _b);
    }
}
