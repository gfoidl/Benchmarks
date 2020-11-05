using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.Arm;
using System.Runtime.Intrinsics.X86;

namespace gfoidl.Numerics
{
    unsafe partial class Matrix
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        [DebuggerStepThrough]
        internal Vector128<double> ReadVector128(double* relBasePtr, nint row)
        {
            Debug.Assert(row + Vector128<double>.Count <= _rows);

            if (Sse2.IsSupported)
            {
                return Sse2.LoadVector128(relBasePtr + row);
            }
            else if (AdvSimd.IsSupported)
            {
                return AdvSimd.LoadVector128(relBasePtr + row);
            }
            else
            {
                throw new InvalidOperationException();
            }
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough]
        internal Vector256<double> ReadVector256(double* relBasePtr, nint row)
        {
            Debug.Assert(row + Vector256<double>.Count <= _rows);

            return Avx.LoadVector256(relBasePtr + row);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        [DebuggerStepThrough]
        internal void StoreVector(double* relBasePtr, nint row, Vector128<double> vec)
        {
            Debug.Assert(row + Vector128<double>.Count <= _rows);

            if (Sse2.IsSupported)
            {
                Sse2.Store(relBasePtr + row, vec);
            }
            else if (AdvSimd.IsSupported)
            {
                AdvSimd.Store(relBasePtr + row, vec);
            }
            else
            {
                throw new NotImplementedException();
            }
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough]
        internal void StoreVector(double* relBasePtr, nint row, Vector256<double> vec)
        {
            Debug.Assert(row + Vector256<double>.Count <= _rows);

            Avx.Store(relBasePtr + row, vec);
        }
    }
}
