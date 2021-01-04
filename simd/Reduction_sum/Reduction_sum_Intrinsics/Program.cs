using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Diagnosers;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

Bench bench = new();
Console.WriteLine(bench.A());
Console.WriteLine(bench.B());
Console.WriteLine(bench.C());

#if !DEBUG
BenchmarkRunner.Run<Bench>();
#endif

[DisassemblyDiagnoser]
//[ShortRunJob]
public class Bench
{
    private Vector256<double> _vec = Vector256.Create(1d, 2, 3, 4);
    //---------------------------------------------------------------------
    [Benchmark(Baseline = true)]
    public double A() => ReduceSumA(_vec);

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static double ReduceSumA(Vector256<double> vector)
    {
        Debug.Assert(Avx2.IsSupported);

        Vector256<double> tmp   = Avx.HorizontalAdd(vector, vector);
        Vector128<double> lo128 = tmp.GetLower();
        Vector128<double> hi128 = tmp.GetUpper();
        Vector128<double> s     = Sse2.AddScalar(lo128, hi128);

        return s.ToScalar();
    }
    //---------------------------------------------------------------------
    [Benchmark]
    public double B() => ReduceSumB(_vec);

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static double ReduceSumB(Vector256<double> vector)
    {
        Debug.Assert(Avx2.IsSupported);

        Vector256<double> tmp  = Avx.HorizontalAdd(vector, vector);
        Vector256<double> tmp1 = Avx2.Permute4x64(tmp, 0b_00_00_10_00);
        Vector128<double> s    = Sse3.HorizontalAdd(tmp1.GetLower(), tmp1.GetLower());

        return s.ToScalar();
    }
    //---------------------------------------------------------------------
    [Benchmark]
    public double C() => ReduceSumC(_vec);

    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    public static double ReduceSumC(Vector256<double> vector)
    {
        Debug.Assert(Avx2.IsSupported);

        Vector256<double> tmp     = Avx.HorizontalAdd(vector, vector);
        Vector256<double> tmp1    = Avx2.Permute4x64(tmp, 0b_00_00_10_00);
        Vector128<double> tmp2    = tmp1.GetLower();
        Vector128<double> swapped = Avx.Permute(tmp2, 0b_01);
        Vector128<double> s       = Sse2.AddScalar(tmp2, swapped);

        return s.ToScalar();
    }
}
