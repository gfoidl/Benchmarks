using System;

namespace gfoidl.Numerics
{
    public partial class Matrix
    {
        public ColumnEnumerator GetEnumerator() => new ColumnEnumerator(this);
        //---------------------------------------------------------------------
        public struct ColumnEnumerator
        {
            private readonly Matrix _matrix;
            private int             _curCol;
            //-----------------------------------------------------------------
            public ColumnEnumerator(Matrix matrix)
            {
                _matrix = matrix;
                _curCol = -1;
            }
            //-----------------------------------------------------------------
            public Span<double> Current => _matrix.GetColumn(_curCol);
            //-----------------------------------------------------------------
            public bool MoveNext()
            {
                int curCol = ++_curCol;

                return curCol < _matrix.Cols;
            }
        }
    }
}
