using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace gfoidl.Numerics
{
    public unsafe partial class Matrix
    {
        private readonly double[] _data;
        private readonly double*  _dataPtr;
        private readonly int      _rows;
        private readonly int      _cols;
        private readonly uint     _stride;
        //---------------------------------------------------------------------
        public Matrix(int rows, int cols, int alignmentInBytes = 0, bool padColumnsForAlignment = false)
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

            // With in the size could overflow (is check later)
            ulong size;

            if (alignmentInBytes <= 0 || !padColumnsForAlignment)
            {
                _stride = (uint)rows;
                size    = (ulong)(uint)rows * (ulong)(uint)cols;
            }
            else
            {
                _stride = Helpers.GetStride((uint)rows, (uint)alignmentInBytes);
                size    = (ulong)_stride * (ulong)(uint)cols + (ulong)(uint)alignmentInBytes / sizeof(double);
            }

            if (size > int.MaxValue)    // actually Array.MaxSize for double
            {
                Throw();
                static void Throw() => throw new ArgumentOutOfRangeException("Matrix is too large");
            }

            _data    = GC.AllocateUninitializedArray<double>((int)size, pinned: true);

            // I'm not sure if this call inlines, at least in sharplab it doesn't.
            //_dataPtr = (double*)Marshal.UnsafeAddrOfPinnedArrayElement(_data, 0);
            _dataPtr = (double*)Unsafe.AsPointer(ref MemoryMarshal.GetArrayDataReference(_data));

            if (alignmentInBytes > 0)
            {
                _dataPtr = Helpers.AlignPointer(_dataPtr, (uint)alignmentInBytes);
            }

            this.MarkNonData();
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
        [DebuggerStepThrough]
        public Span<double> GetColumn(int col)
        {
            ref double colStart = ref this.GetColumnRef(col);
            return MemoryMarshal.CreateSpan(ref colStart, _rows);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        [DebuggerStepThrough]
        public ref double GetColumnRef(int col)
        {
            Debug.Assert(col >= 0);

            double* colStart = this.GetColumnPtr((nint)(uint)col);
            return ref *colStart;       // same as Unsafe.AsRef
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        [DebuggerStepThrough]
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
        [DebuggerStepThrough]
        private nint GetIndex(nint row, nint col)
        {
            Debug.Assert(row < _rows);
            Debug.Assert(col < _cols);

            return col * (nint)(uint)_stride + row;
        }
    }
}
