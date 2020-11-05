using System;
using gfoidl.Numerics;

//ObjectLayoutInspector.TypeLayout.PrintLayout<Matrix>();
//Console.WriteLine();

const int align = 32;
const bool padColumnsForAlignment = true;

Matrix matrix = new(3, 2, align, padColumnsForAlignment);
matrix[0, 0] = 1;
matrix[1, 0] = 2;
matrix[2, 0] = 3;
matrix[0, 1] = 4;
matrix[1, 1] = 5;
matrix[2, 1] = 6;

Span<double> col0 = matrix.GetColumn(0);
Span<double> col1 = matrix.GetColumn(1);

matrix.Print();
Console.WriteLine();
Print(col0);
Print(col1);

if (align > 0)
{
    Console.WriteLine();
    int colIdx = 0;

    foreach (Span<double> column in matrix)
    {
        Console.WriteLine($"col{colIdx} aligned to {align}: {IsAligned(col0, align)}");
        colIdx++;
    }
}

Console.WriteLine("\nM.v");
ShowVecMultiply(matrix);

Console.WriteLine("\nmatrix.Randomize();");
matrix.Randomize(minInclusive: 0d, maxExclusive: 100d);
matrix.Print();

#if DEBUG
Console.WriteLine("\nmatrix = new Matrix(300, 300, align: 32, padColumnsForAlignment: true);");
matrix = new Matrix(300, 300, alignmentInBytes: 32, padColumnsForAlignment: true);
Console.WriteLine($"size: {matrix.Size}, total padding: {matrix.TotalPadding} / {(double)matrix.TotalPadding / matrix.Size:P}");
#endif

static void Print(ReadOnlySpan<double> vector)
{
    foreach (double d in vector)
        Console.WriteLine($"{d}\t");
    Console.WriteLine();
}

static unsafe bool IsAligned(ReadOnlySpan<double> vector, int align)
{
    fixed (double* ptr = vector)
    {
        nint address = (nint)ptr;
        return address % align == 0;
    }
}

static void ShowVecMultiply(Matrix matrix)
{
    Span<double> vector = stackalloc double[] { 2, 3 };
    Span<double> result = stackalloc double[] { 1, 1, 1 };  // simulate non empty result vector

    matrix.Multiply(vector, result);

    Console.WriteLine($"{matrix[0, 0]}  {matrix[0, 1]}     {vector[0]}     {result[0]}  |  14  err: {Math.Abs(result[0] - 14)}");
    Console.WriteLine($"{matrix[1, 0]}  {matrix[1, 1]}  *  {vector[1]}  =  {result[1]}  |  19  err: {Math.Abs(result[1] - 19)}");
    Console.WriteLine($"{matrix[2, 0]}  {matrix[2, 1]}           {result[2]}  |  24  err: {Math.Abs(result[2] - 24)}");
}
