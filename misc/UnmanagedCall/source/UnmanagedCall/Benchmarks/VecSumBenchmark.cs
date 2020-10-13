using System;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;
using UnmanagedCall.DllImport;
using UnmanagedCall.FunctionPointers;
using UnmanagedCall.Load;

namespace UnmanagedCall.Benchmarks
{
    [DisassemblyDiagnoser]
    public unsafe class VecSumBenchmark
    {
        private double* _vec;
        private int     _n = 1_000;
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
        public void GlobalCleanup() => Marshal.FreeHGlobal((IntPtr)_vec);
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public double DllImport() => NativeDllImport.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double DllImportWOSecurityCheck() => NativeDllImportWOSecurityCheck.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double LoadLibrary() => NativeMethods.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double LoadLibraryWOSecurityCheck() => NativeMethodsWOSecurityCheck.vec_sum(_vec, _n);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double CallI() => Calli.VecSum(_vec, _n);
        //---------------------------------------------------------------------
        //[Benchmark]
        public double CallITail() => CalliTail.VecSum(_vec, _n);
        //---------------------------------------------------------------------
        [Benchmark]
        public double FunctionPointerDefault() => FunctionPointersDefault.VecSum(_vec, _n);
        //---------------------------------------------------------------------
        [Benchmark]
        public double FunctionPointerCdecl() => FunctionPointersCdecl.VecSum(_vec, _n);
    }
}
