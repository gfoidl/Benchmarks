using System;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.Arm;
using System.Runtime.Intrinsics.X86;

namespace gfoidl.Numerics
{
    public static unsafe partial class MatrixExtensions
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Multiply(this Matrix matrix, ReadOnlySpan<double> vector, Span<double> result)
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
        // Prevent inling, so the budget won't be exceeded. The JIT won't inline this method anyway...
        [MethodImpl(MethodImplOptions.NoInlining)]
        private static void MultiplyCore(Matrix matrix, ref double vector, ref double result)
        {
            fixed (double* vec = &vector)
            fixed (double* res = &result)
            {
                nint rows = (nint)(uint)matrix.Rows;
                nint cols = (nint)(uint)matrix.Cols;

                MultiplyCoreFirstColumn(matrix, rows, vec, res);
                MultiplyCore(matrix, rows, cols, vec, res);
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreFirstColumn(Matrix matrix, nint rows, double* vec, double* res)
        {
            if (Avx2.IsSupported)
            {
                MultiplyCoreFirstColumnAvx(matrix, rows, vec, res);
            }
            else if (Sse2.IsSupported)
            {
                MultiplyCoreFirstColumnSse(matrix, rows, vec, res);
            }
            else if (AdvSimd.Arm64.IsSupported)
            {
                throw new NotImplementedException();
            }
            else
            {
                MultiplyCoreFirstColumnScalar(matrix, rows, vec, res);
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCore(Matrix matrix, nint rows, nint cols, double* vec, double* res)
        {
            if (Avx.IsSupported)
            {
                MultiplyCoreAvx(matrix, rows, cols, vec, res);
            }
            else if (Sse2.IsSupported)
            {
                MultiplyCoreSse(matrix, rows, cols, vec, res);
            }
            else
            {
                MultiplyCoreScalar(matrix, rows, cols, vec, res);
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreFirstColumnAvx(Matrix matrix, nint rows, double* vec, double* res)
        {
            nint i                 = 0;
            double* colPtr         = matrix.GetColumnPtr(0);
            Vector256<double> x256 = Avx.BroadcastScalarToVector256(vec);

            // AVX loop 2x unrolled, then a SSE loop
            // (it's better than having a single step AVX before the single SSE step)
            if (rows >= 2 * Vector256<double>.Count)
            {
                do
                {
                    Vector256<double> colVec0 = matrix.ReadVector256(colPtr, i);
                    Vector256<double> colVec1 = matrix.ReadVector256(colPtr, i + Vector256<double>.Count);

                    Vector256<double> resVec0 = Avx.Multiply(colVec0, x256);
                    Vector256<double> resVec1 = Avx.Multiply(colVec1, x256);

                    matrix.StoreVector(res, i + 0 * Vector256<double>.Count, resVec0);
                    matrix.StoreVector(res, i + 1 * Vector256<double>.Count, resVec1);

                    i += 2 * Vector256<double>.Count;
                }
                while (i <= rows - 2 * Vector256<double>.Count);
            }

            if (i <= rows - Vector128<double>.Count)
            {
                Vector128<double> x128 = x256.GetLower();

                do
                {
                    Vector128<double> colVec = matrix.ReadVector128(colPtr, i);
                    Vector128<double> resVec = Sse2.Multiply(colVec, x128);
                    matrix.StoreVector(res, i, resVec);

                    i += Vector128<double>.Count;
                } while (i <= rows - Vector128<double>.Count);
            }

            // Max one row left
            Debug.Assert(Vector128<double>.Count == 2);
            if (i < rows)
            {
                res[i] = colPtr[i] * x256.ToScalar();
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreAvx(Matrix matrix, nint rows, nint cols, double* vec, double* res)
        {
            for (nint j = 1; j < cols; ++j)
            {
                nint i                 = 0;
                double* colPtr         = matrix.GetColumnPtr(j);
                Vector256<double> x256 = Avx.BroadcastScalarToVector256(vec + j);

                // AVX loop 2x unrolled, then a SSE loop
                // (it's better than having a single step AVX before the single SSE step)
                if (rows >= 2 * Vector256<double>.Count)
                {
                    do
                    {
                        Vector256<double> colVec0 = matrix.ReadVector256(colPtr, i);
                        Vector256<double> colVec1 = matrix.ReadVector256(colPtr, i + Vector256<double>.Count);

                        Vector256<double> resVec0 = matrix.ReadVector256(res, i);
                        Vector256<double> resVec1 = matrix.ReadVector256(res, i + Vector256<double>.Count);

                        Vector256<double> prod0 = Avx.Multiply(colVec0, x256);
                        Vector256<double> prod1 = Avx.Multiply(colVec1, x256);

                        resVec0 = Avx.Add(resVec0, prod0);
                        resVec1 = Avx.Add(resVec1, prod1);

                        matrix.StoreVector(res, i + 0 * Vector256<double>.Count, resVec0);
                        matrix.StoreVector(res, i + 1 * Vector256<double>.Count, resVec1);

                        i += 2 * Vector256<double>.Count;
                    } while (i <= rows - 2 * Vector256<double>.Count);
                }

                if (i <= rows - Vector128<double>.Count)
                {
                    Vector128<double> x128 = x256.GetLower();

                    do
                    {
                        Vector128<double> colVec = matrix.ReadVector128(colPtr, i);
                        Vector128<double> resVec = matrix.ReadVector128(res, i);
                        Vector128<double> prod   = Sse2.Multiply(colVec, x128);
                        resVec                   = Sse2.Add(resVec, prod);

                        matrix.StoreVector(res, i, resVec);

                        i += Vector128<double>.Count;
                    } while (i <= rows - Vector128<double>.Count);
                }

                // Max one row left
                Debug.Assert(Vector128<double>.Count == 2);
                if (i < rows)
                {
                    res[i] += colPtr[i] * x256.ToScalar();
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreFirstColumnSse(Matrix matrix, nint rows, double* vec, double* res)
        {
            nint i              = 0;
            double* colPtr      = matrix.GetColumnPtr(0);
            Vector128<double> x = Sse3.IsSupported
                ? Sse3.LoadAndDuplicateToVector128(vec)
                : Vector128.Create(vec[0]);

            if (rows >= Vector128<double>.Count)
            {
                do
                {
                    Vector128<double> colVec = matrix.ReadVector128(colPtr, i);
                    Vector128<double> resVec = Sse2.Multiply(colVec, x);
                    matrix.StoreVector(res, i, resVec);

                    i += Vector128<double>.Count;
                } while (i <= rows - Vector128<double>.Count);
            }

            // Max one left, otherwise another SSE2 iteration would be done
            Debug.Assert(Vector128<double>.Count == 2);
            if (i < rows)
            {
                res[i] = colPtr[i] * x.ToScalar();
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreSse(Matrix matrix, nint rows, nint cols, double* vec, double* res)
        {
            for (nint j = 1; j < cols; ++j)
            {
                nint i              = 0;
                double* colPtr      = matrix.GetColumnPtr(j);
                Vector128<double> x = Sse3.IsSupported
                    ? Sse3.LoadAndDuplicateToVector128(vec + j)
                    : Vector128.Create(vec[j]);

                if (rows >= Vector128<double>.Count)
                {
                    do
                    {
                        Vector128<double> colVec = matrix.ReadVector128(colPtr, i);
                        Vector128<double> resVec = matrix.ReadVector128(res, i);
                        Vector128<double> prod   = Sse2.Multiply(colVec, x);
                        resVec                   = Sse2.Add(resVec, prod);

                        matrix.StoreVector(res, i, resVec);

                        i += Vector128<double>.Count;
                    } while (i <= rows - Vector128<double>.Count);
                }

                // Max one left, otherwise another SSE2 iteration would be done
                Debug.Assert(Vector128<double>.Count == 2);
                if (i < rows)
                {
                    res[i] += colPtr[i] * x.ToScalar();
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreFirstColumnScalar(Matrix matrix, nint rows, double* vec, double* res)
        {
            double* colPtr = matrix.GetColumnPtr(0);
            double x       = vec[0];

            for (nint i = 0; i < rows; ++i)
            {
                res[i] = colPtr[i] * x;
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void MultiplyCoreScalar(Matrix matrix, nint rows, nint cols, double* vec, double* res)
        {
            for (nint j = 1; j < cols; ++j)
            {
                double* colPtr = matrix.GetColumnPtr(j);
                double x       = vec[j];

                for (nint i = 0; i < rows; ++i)
                {
                    res[i] += colPtr[i] * x;
                }
            }
        }
    }
}
