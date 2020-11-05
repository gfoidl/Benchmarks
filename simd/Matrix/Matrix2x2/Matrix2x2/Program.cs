using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

Demo.Run();

#if !DEBUG
BenchmarkRunner.Run<Bench>();
#endif

[DisassemblyDiagnoser]
public unsafe class Bench
{
    private readonly Matrix2x2ColumnMajor _matrix2X2ColumnMajor = new();
    private readonly Matrix2x2RowMajor    _matrix2X2RowMajor    = new();
    private readonly double[]             _buffer               = GC.AllocateArray<double>(4, pinned: true);
    private readonly double*              _vec;
    private readonly double*              _res;

    public Bench()
    {
        _matrix2X2ColumnMajor[0, 0] = 1;
        _matrix2X2ColumnMajor[1, 0] = 2;
        _matrix2X2ColumnMajor[0, 1] = 3;
        _matrix2X2ColumnMajor[1, 1] = 4;

        _vec = (double*)Marshal.UnsafeAddrOfPinnedArrayElement(_buffer, 0);
        _res = _vec + 2;

        _vec[0] = 10;
        _vec[1] = 11;
    }

    [Benchmark(Baseline = true)]
    public void RowMajor() => _matrix2X2RowMajor.MultiplyWithVector(_vec, _res);

    [Benchmark]
    public void RowMajorSimd() => _matrix2X2RowMajor.MultipylWithVectorSimd(_vec, _res);

    [Benchmark]
    public void ColumnMajor() => _matrix2X2ColumnMajor.MultiplyWithVector(_vec, _res);

    [Benchmark]
    public void ColumnMajorSimd() => _matrix2X2ColumnMajor.MultipylWithVectorSimd(_vec, _res);
}

public unsafe struct Matrix2x2ColumnMajor
{
    private fixed double _data[4];

    public ref double this[nint i, nint j]
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        get
        {
            nint index = j * 2 + i;
            return ref _data[index];
        }
    }

    public void MultiplyWithVector(double* vec, double* res)
    {
        res[0] = this[0, 0] * vec[0] + this[0, 1] * vec[1];
        res[1] = this[1, 0] * vec[0] + this[1, 1] * vec[1];
    }

    public void MultipylWithVectorSimd(double* vec, double* res)
    {
        double* mat = (double*)Unsafe.AsPointer(ref _data[0]);

        Vector128<double> firstCol  = Sse2.LoadVector128(mat);
        Vector128<double> secondCol = Sse2.LoadVector128(mat + 2);

        Vector128<double> x0 = Sse3.LoadAndDuplicateToVector128(vec);
        Vector128<double> x1 = Sse3.LoadAndDuplicateToVector128(vec + 1);

        Vector128<double> resVec0 = Sse2.Multiply(firstCol, x0);
        Vector128<double> resVec1 = Sse2.Multiply(secondCol, x1);
        resVec0                   = Sse2.Add(resVec0, resVec1);

        Sse2.Store(res, resVec0);
    }
}

public unsafe struct Matrix2x2RowMajor
{
    private fixed double _data[4];

    public ref double this[nint i, nint j]
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        get
        {
            nint index = i * 2 + j;
            return ref _data[index];
        }
    }

    public void MultiplyWithVector(double* vec, double* res)
    {
        res[0] = this[0, 0] * vec[0] + this[0, 1] * vec[1];
        res[1] = this[1, 0] * vec[0] + this[1, 1] * vec[1];
    }

    public void MultipylWithVectorSimd(double* vec, double* res)
    {
        double* mat = (double*)Unsafe.AsPointer(ref _data[0]);

        Vector128<double> row0 = Sse2.LoadVector128(mat);
        Vector128<double> row1 = Sse2.LoadVector128(mat + 2);

        Vector128<double> x = Sse2.LoadVector128(vec);

        Vector128<double> resVec0 = Sse2.Multiply(row0, x);
        Vector128<double> resVec1 = Sse2.Multiply(row1, x);

        resVec0 = Sse3.HorizontalAdd(resVec0, resVec1);

        Sse2.Store(res, resVec0);
    }
}

public static class Demo
{
    public static void Run()
    {
        Matrix2x2ColumnMajor matrix2X2ColumnMajor = new();
        matrix2X2ColumnMajor[0, 0] = 1;
        matrix2X2ColumnMajor[1, 0] = 2;
        matrix2X2ColumnMajor[0, 1] = 3;
        matrix2X2ColumnMajor[1, 1] = 4;

        unsafe
        {
            double* vec = stackalloc double[] { 10, 11 };
            double* res = stackalloc double[2];

            matrix2X2ColumnMajor.MultiplyWithVector(vec, res);
            double[] res0 = new Span<double>(res, 2).ToArray();

            matrix2X2ColumnMajor.MultipylWithVectorSimd(vec, res);
            double[] res1 = new Span<double>(res, 2).ToArray();
        }

        Matrix2x2RowMajor matrix2X2RowMajor = new();
        matrix2X2RowMajor[0, 0] = 1;
        matrix2X2RowMajor[1, 0] = 2;
        matrix2X2RowMajor[0, 1] = 3;
        matrix2X2RowMajor[1, 1] = 4;

        unsafe
        {
            double* vec = stackalloc double[] { 10, 11 };
            double* res = stackalloc double[2];

            matrix2X2RowMajor.MultiplyWithVector(vec, res);
            double[] res0 = new Span<double>(res, 2).ToArray();

            matrix2X2RowMajor.MultipylWithVectorSimd(vec, res);
            double[] res1 = new Span<double>(res, 2).ToArray();
        }
    }
}
