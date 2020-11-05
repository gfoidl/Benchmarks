using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace gfoidl.Numerics
{
    [DebuggerDisplay("{" + nameof(GetDebuggerDisplay) + "(),nq}")]
    partial class Matrix
    {
#if DEBUG
        public int TotalPadding { get; private set; }
#endif
        //---------------------------------------------------------------------
        public void Print(char colSeparator = '\t')
        {
            for (int row = 0; row < _rows; ++row)
            {
                for (int col = 0; col < _cols; ++col)
                {
                    Console.Write($"{this[row, col]}{colSeparator}");
                }
                Console.WriteLine();
            }
        }
        //---------------------------------------------------------------------
        [Conditional("DEBUG")]
        private unsafe void MarkNonData()
        {
            // Mark start of array to start of data
            double* start = (double*)Marshal.UnsafeAddrOfPinnedArrayElement(_data, 0);
            Fill(start, _dataPtr);

            // Mark end of data to end of array
            start       = _dataPtr + _stride * _cols;
            double* end = (double*)Unsafe.AsPointer(ref _data[^1]);
            Fill(start, end + 1);

            // Mark padding in columns
            for (int col = 0; col < _cols; ++col)
            {
                nint startIndex = this.GetIndex(0, col);
                start           = _dataPtr + startIndex;
                end             = start + _stride;
                start          += _rows;

                Fill(start, end);
            }

            void Fill(double* start, double* end)
            {
                while (start < end)
                {
                    *start++ = double.NaN;
#if DEBUG
                    this.TotalPadding++;
#endif
                }
            }
        }
        //---------------------------------------------------------------------
        private string GetDebuggerDisplay() => $"{this.Rows} x {this.Cols}";
    }
}
