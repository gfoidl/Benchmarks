using System;
using System.Diagnostics.CodeAnalysis;

namespace gfoidl.Numerics
{
    public static partial class MatrixExtensions
    {
        private static readonly Random s_random = new Random();

        public static void Randomize(this Matrix matrix, double minInclusive = 0d, double maxExclusive = 1d)
        {
            if (matrix is null)
            {
                Throw();
                [DoesNotReturn] static void Throw() => throw new ArgumentNullException(nameof(matrix));
            }

            if (maxExclusive < minInclusive)
            {
                Throw();
                static void Throw() => throw new ArgumentOutOfRangeException(nameof(maxExclusive));
            }

            double scale = maxExclusive - minInclusive;
            RandomizeCore(matrix, scale);
        }
        //---------------------------------------------------------------------
        private static void RandomizeCore(Matrix matrix, double scale)
        {
            foreach (Span<double> column in matrix)
            {
                foreach (ref double item in column)
                {
                    double value = s_random.NextDouble();
                    value       *= scale;
                    item         = value;
                }
            }
        }
    }
}
