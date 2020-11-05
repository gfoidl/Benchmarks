using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace gfoidl.Numerics
{
    public unsafe partial class ColumnMajorMatrix
    {
        private readonly double[] _data;
        private readonly double*  _dataPtr;
        private readonly int      _rows;
        private readonly int      _cols;
        private readonly int      _stride;
        //---------------------------------------------------------------------
        public ColumnMajorMatrix(int rows, int cols, int align = 0, bool padColumnsForAlignment = false)
        {
            if (rows <= 0 || cols <= 0)
            {
                Throw(rows, cols);
                static void Throw(int rows, int cols)
                {
                    if (rows <= 0) throw new ArgumentOutOfRangeException(nameof(rows));
                    if (cols <= 0) throw new ArgumentOutOfRangeException(nameof(cols));
                }
            }

            _rows = rows;
            _cols = cols;

            if (align == 0 || !padColumnsForAlignment)
            {
                _stride = rows;
            }
            else
            {
                int padding = align - rows % align;
                _stride     = rows + padding;
            }

            // With int this could overflow
            long size = (long)_stride * cols + align;

            if (size > int.MaxValue)    // actually Array.MaxSize for double
            {
                Throw();
                static void Throw() => throw new ArgumentOutOfRangeException("Matrix is too large");
            }

            _data    = GC.AllocateUninitializedArray<double>((int)size, pinned: true);
            _dataPtr = (double*)Marshal.UnsafeAddrOfPinnedArrayElement(_data, 0);

            if (align > 0)
            {
                _dataPtr = Align(_dataPtr, align);
            }

            static double* Align(double* ptr, int align)
            {
                nuint address         = (nuint)ptr;
                nuint unalignedBytes  = address % (nuint)align;
                nuint bytesToAlign    = ((nuint)align - unalignedBytes) % (nuint)align;
                nuint elementsToAlign = bytesToAlign / sizeof(double);
                ptr += elementsToAlign;

                Debug.Assert((long)ptr % align == 0);

                return ptr;
            }
        }
        //---------------------------------------------------------------------
        public ref double this[int row, int col]
        {
            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            get
            {
                nint index = this.GetIndex(row, col);
                Debug.Assert(index < _data.Length);
                return ref _dataPtr[index];
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public Span<double> GetColumn(int col)
        {
            ref double colStart = ref this.GetColumnRef(col);
            return MemoryMarshal.CreateSpan(ref colStart, _rows);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ref double GetColumnRef(int col)
        {
            Debug.Assert(col >= 0);

            double* colStart = this.GetColumnPtr((nint)(uint)col);
            return ref *colStart;       // same as Unsafe.AsRef
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public double* GetColumnPtr(nint col)
        {
            nint startIndex = this.GetIndex(0, col);

            Debug.Assert(startIndex + _rows <= _data.Length);

            return _dataPtr + startIndex;
        }
        //---------------------------------------------------------------------
        public int Rows => _rows;
        public int Cols => _cols;
        public int Size => this.Rows * this.Cols;
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nint GetIndex(nint row, nint col)
        {
            Debug.Assert(row < _rows);
            Debug.Assert(col < _cols);

            return col * (nint)(uint)_stride + row;
        }
    }
}
