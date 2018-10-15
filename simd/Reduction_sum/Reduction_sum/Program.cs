using System;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace Reduction_sum
{
    class Program
    {
        static void Main(string[] args)
        {
            var benchs = new Benchmarks();
            Console.WriteLine(benchs.Loop_local());
            Console.WriteLine(benchs.Loop_field());
            Console.WriteLine(benchs.Dot());
            Console.WriteLine(benchs.Intrinsics());
#if !DEBUG
            BenchmarkRunner.Run<Benchmarks>();
#endif
        }
    }
    //-------------------------------------------------------------------------
    //[DisassemblyDiagnoser(printSource: true)]
    public class Benchmarks
    {
        private Vector<double> _vec;
        //---------------------------------------------------------------------
        public Benchmarks()
        {
            var vec = new double[Vector<double>.Count];
            var rnd = new Random(0);

            for (int i = 0; i < vec.Length; ++i)
                vec[i] = rnd.NextDouble();

            _vec = new Vector<double>(vec);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public double Loop_local()
        {
            Vector<double> vec = _vec;
            double sum = 0;

            for (int i = 0; i < Vector<double>.Count; ++i)
                sum += vec[i];

            return sum;
        }
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public double Loop_field()
        {
            double sum = 0;

            for (int i = 0; i < Vector<double>.Count; ++i)
                sum += _vec[i];

            return sum;
        }
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public double Dot()
        {
            return Vector.Dot(_vec, Vector<double>.One);
        }
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public double Intrinsics()
        {
            Vector256<double> a = Unsafe.As<Vector<double>, Vector256<double>>(ref _vec);
            Vector256<double> tmp = Avx.HorizontalAdd(a, a);
            Vector128<double> hi128 = Avx.ExtractVector128(tmp, 1);

            // TODO: check bad codegen (stack shuffle)
            // https://github.com/dotnet/coreclr/issues/17207
            //Vector128<double> lo128 = Unsafe.As<Vector256<double>, Vector128<double>>(ref tmp);
            Vector128<double> lo128 = Avx.GetLowerHalf<double>(tmp);

            Vector128<double> s = Sse2.Add(lo128, hi128);

            return Sse2.ConvertToDouble(s);
        }
    }
}
