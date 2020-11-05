using System.Diagnostics;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;

namespace gfoidl.Numerics
{
    unsafe partial class Matrix
    {
        [DebuggerStepThrough]
        internal Vector128<double> ReadVector128(double* relBasePtr, nint row)
        {
            Debug.Assert(row + Vector128<double>.Count <= _rows);

            return Sse2.LoadVector128(relBasePtr + row);
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough]
        internal Vector256<double> ReadVector256(double* relBasePtr, nint row)
        {
            Debug.Assert(row + Vector256<double>.Count <= _rows);

            return Avx.LoadVector256(relBasePtr + row);
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough]
        internal void StoreVector(double* relBasePtr, nint row, Vector128<double> vec)
        {
            Debug.Assert(row + Vector128<double>.Count <= _rows);

            Sse2.Store(relBasePtr + row, vec);
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
