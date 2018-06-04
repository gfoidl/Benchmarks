using System;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    public unsafe class VecSumBenchmark
    {
        private readonly double _res;
        private double*         _vec;
        private int             _n = 1_000;
        //---------------------------------------------------------------------
        public VecSumBenchmark()
        {
            double* vec = stackalloc double[] { 1, 2, 3 };

            // JIT static types
            _res  = NativeDllImport.vec_sum(vec, 3);
            _res += NativeDllImportWOSecurityCheck.vec_sum(vec, 3);
            _res += NativeMethods.vec_sum(vec, 3);
            _res += NativeMethodsWOSecurityCheck.vec_sum(vec, 3);
        }
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _vec = (double*)Marshal.AllocHGlobal(_n * sizeof(double));

            var rnd = new Random(0);

            for (int i = 0; i < _n; ++i)
                _vec[i] = rnd.NextDouble();
        }
        //---------------------------------------------------------------------
        [GlobalCleanup]
        public void GlobalCleanup()
        {
            Marshal.FreeHGlobal((IntPtr)_vec);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public double DllImport() => NativeDllImport.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        [Benchmark]
        public double DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        [Benchmark]
        public double LoadLibrary() => NativeMethods.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        [Benchmark]
        public double LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.vec_sum(_vec, _n);
    }
}
