using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    public class AddIntegerBenchmark
    {
        private readonly int _res;
        private int          _a = 3;
        private int          _b = 4;
        //---------------------------------------------------------------------
        public AddIntegerBenchmark()
        {
            // JIT static types
            _res  = NativeDllImport.add_i(3, 4);
            _res += NativeDllImportWOSecurityCheck.add_i(3, 4);
            _res += NativeMethods.add_i(3, 4);
            _res += NativeMethodsWOSecurityCheck.add_i(3, 4);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int DllImport() => NativeDllImport.add_i(_a, _b);
        //---------------------------------------------------------------------
        [Benchmark]
        public int DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.add_i(3, 4);
        //---------------------------------------------------------------------
        [Benchmark]
        public int LoadLibrary() => NativeMethods.add_i(3, 4);
        //---------------------------------------------------------------------
        [Benchmark]
        public int LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.add_i(3, 4);
    }
}
