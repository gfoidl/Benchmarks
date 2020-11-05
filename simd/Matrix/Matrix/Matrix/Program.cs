//#define VTUNE
//#define VTUNE_INIT
//-----------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Diagnosers;
using gfoidl.Numerics;
using System.Diagnostics;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

#if !VTUNE
Bench bench = new();
foreach ((int Rows, int Cols) size in Bench.GetMatrixSizes())
{
    bench.Size = size;
    bench.GlobalSetup();

    bench.ColumnMajor();
    double[] resColumnMajor = bench.Result.ToArray();

    bench.ColumnMajorSimd();
    double[] resColumnMajorSimd = bench.Result.ToArray();

    bench.RowMajor();
    double[] resRowMajor = bench.Result.ToArray();

    for (int i = 0; i < resColumnMajor.Length; ++i)
    {
        if (Math.Abs(resColumnMajor[i] - resRowMajor[i]) > 1e-6)
        {
            Console.WriteLine($"error by {size} at index {i}\nc: {resColumnMajor[i]}\nr: {resRowMajor[i]}");
            Environment.Exit(1);
        }

        if (Math.Abs(resColumnMajorSimd[i] - resRowMajor[i]) > 1e-6)
        {
            Console.WriteLine($"error by {size} at index {i}\nc: {resColumnMajorSimd[i]}\nr: {resRowMajor[i]}");
            Environment.Exit(1);
        }
    }
    Console.WriteLine($"validation for {size} OK");
}

#if !DEBUG
BenchmarkRunner.Run<Bench>();
#endif
#else
VTune.Run();
#endif
//-----------------------------------------------------------------------------
//[ShortRunJob]
//[DisassemblyDiagnoser]
[HardwareCounters(HardwareCounter.CacheMisses, HardwareCounter.LlcMisses, HardwareCounter.LlcReference)]
public class Bench
{
    private Matrix            _columnMajorSimd;
    private ColumnMajorMatrix _columnMajor;
    private RowMajorMatrix    _rowMajor;
    private double[]          _vector;
    private double[]          _result;

    public static IEnumerable<(int Rows, int Cols)> GetMatrixSizes()
    {
        yield return (10, 1600);
        yield return (2, 2);
        yield return (3, 2);
        yield return (3, 3);
        yield return (4, 4);
        yield return (5, 5);
        yield return (6, 6);
        yield return (  300,   200);
        yield return (  200,   300);
        yield return (  300,   300);
        yield return (3_000, 2_000);
        yield return (2_000, 3_000);
        yield return (3_000, 3_000);
    }

    //[ParamsSource(nameof(GetMatrixSizes))]
    public (int Rows, int Columns) Size { get; set; } = (1_000, 1_000);

    [GlobalSetup]
    public void GlobalSetup()
    {
        Random rnd = new(0);

        var (rows, cols) = this.Size;

        _columnMajorSimd = new Matrix(rows, cols, alignmentInBytes: 32, padColumnsForAlignment: true);
        _columnMajor     = new ColumnMajorMatrix(rows, cols);
        _rowMajor        = new RowMajorMatrix(rows, cols);
        _vector          = new double[cols];
        _result          = new double[rows];

        for (int i = 0; i < rows; ++i)
        {
            for (int j = 0; j < cols; ++j)
            {
                double value           = rnd.NextDouble();
                _columnMajorSimd[i, j] = value;
                _columnMajor    [i, j] = value;
                _rowMajor       [i, j] = value;
            }
        }

        for (int i = 0; i < cols; ++i)
        {
            _vector[i] = rnd.NextDouble();
        }
    }

    public ReadOnlySpan<double> Result => _result;

    [Benchmark(Baseline = true)]
    public void ColumnMajor() => _columnMajor.Multiply(_vector, _result);

    [Benchmark]
    public void ColumnMajorSimd() => _columnMajorSimd.Multiply(_vector, _result);

    [Benchmark]
    public void RowMajor() => _rowMajor.Multiply(_vector, _result);
}
//-----------------------------------------------------------------------------
public static class VTune
{
    private const int Rows = 40_000;
    private const int Cols = 40_000;

    private static readonly Matrix            s_matrix            = new Matrix(Rows, Cols, alignmentInBytes: 32, padColumnsForAlignment: true);
    private static readonly ColumnMajorMatrix s_columnMajorMatrix = new ColumnMajorMatrix(Rows, Cols);
    private static readonly RowMajorMatrix    s_rowMajorMatrix    = new RowMajorMatrix(Rows, Cols);
    private static readonly double[]          s_vector            = new double[Cols];
    private static readonly double[]          s_result            = new double[Rows];

    public static void Run()
    {
        ReadOnlySpan<double> vector = s_vector;
        Span<double> result         = s_result;

        Console.WriteLine("init...");
        Random rnd          = new();
        Stopwatch stopwatch = new();

#if VTUNE_INIT
        for (int col = 0; col < Cols; ++col)
            s_vector[col] = rnd.NextDouble();

        stopwatch.Restart();
        {
            Parallel.For(0, Cols, j =>
            {
                for (int i = 0; i < Rows; ++i)
                {
                    s_matrix[i, j] = i + j;
                }
            });
        }
        stopwatch.Stop();
        Console.WriteLine($"init done in {stopwatch.ElapsedMilliseconds} ms");
#endif
        Console.WriteLine("start...");

        const int iters = 5;
        stopwatch.Restart();
        {
            for (int i = 0; i < iters; ++i)
            {
                s_matrix.Multiply(vector, result);
                //s_columnMajorMatrix.Multiply(vector, result);
                //s_rowMajorMatrix.Multiply(vector, result);
            }
        }
        stopwatch.Stop();
        Console.WriteLine($"done in {stopwatch.ElapsedMilliseconds} ms for {iters} iterations, so {stopwatch.ElapsedMilliseconds / (double)iters} ms per iteration");
    }
}
