﻿using System;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace gfoidl.Numerics
{
    public static partial class RowMajorMatrixExtensions
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Multiply(this RowMajorMatrix matrix, ReadOnlySpan<double> vector, Span<double> result)
        {
            if (matrix is null)
            {
                Throw();
                [DoesNotReturn] static void Throw() => throw new ArgumentNullException(nameof(matrix));
            }

            if (vector.Length != matrix.Cols)
            {
                Throw();
                static void Throw() => throw new ArgumentOutOfRangeException(nameof(vector));
            }

            if (result.Length != matrix.Rows)
            {
                Throw();
                static void Throw() => throw new ArgumentOutOfRangeException(nameof(result));
            }

            MultiplyCore(matrix, ref MemoryMarshal.GetReference(vector), ref MemoryMarshal.GetReference(result));
        }
        //---------------------------------------------------------------------
        private static unsafe void MultiplyCore(RowMajorMatrix matrix, ref double vector, ref double result)
        {
            fixed (double* vec = &vector)
            fixed (double* res = &result)
            {
                nint rows = (nint)(uint)matrix.Rows;
                nint cols = (nint)(uint)matrix.Cols;

                for (nint i = 0; i < rows; ++i)
                {
                    double* rowPtr = matrix.GetRowPtr(i);
                    double dot     = 0;

                    for (nint j = 0; j < cols; ++j)
                    {
                        //dot += rowPtr[j] * vec[j];
                        dot = Math.FusedMultiplyAdd(rowPtr[j], vec[j], dot);
                    }

                    res[i] = dot;
                }
            }
        }
    }
}
