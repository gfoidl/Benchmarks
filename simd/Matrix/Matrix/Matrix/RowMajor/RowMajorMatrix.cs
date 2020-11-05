using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace gfoidl.Numerics
{
    public unsafe partial class RowMajorMatrix
    {
        private readonly double[] _data;
        private readonly double*  _dataPtr;
        private readonly int      _rows;
        private readonly int      _cols;
        private readonly int      _stride;
        //---------------------------------------------------------------------
        public RowMajorMatrix(int rows, int cols, int align = 0, bool padRowsForAlignment = false)
        {
            _rows = rows;
            _cols = cols;

            if (align == 0 || !padRowsForAlignment)
            {
                _stride = cols;
            }
            else
            {
                int padding = align - cols % align;
                _stride     = cols + padding;
            }

            int size = _stride * rows + align;

            _data    = GC.AllocateUninitializedArray<double>(size, pinned: true);
            _dataPtr = (double*)Marshal.UnsafeAddrOfPinnedArrayElement(_data, 0);

            if (align > 0)
            {
                _dataPtr = Align(_dataPtr, align);
            }
            //-----------------------------------------------------------------
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
        public Span<double> GetRow(int row)
        {
            ref double rowStart = ref this.GetColumnRef(row);
            return MemoryMarshal.CreateSpan(ref rowStart, _rows);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ref double GetColumnRef(int row)
        {
            Debug.Assert(row >= 0);

            double* rowStart = this.GetRowPtr((nint)(uint)row);
            return ref *rowStart;       // same as Unsafe.AsRef
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public double* GetRowPtr(nint row)
        {
            nint startIndex = this.GetIndex(row, 0);

            Debug.Assert(startIndex + _cols <= _data.Length);

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

            return row * (nint)(uint)_stride + col;
        }
    }
}
