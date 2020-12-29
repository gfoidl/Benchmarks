using System;
using System.Runtime.CompilerServices;

namespace HillClimbinComplex.Implementations
{
    public struct Complex
    {
        public Complex(double real, double imaginary)
        {
            Real = real;
            Imaginary = imaginary;
        }

        public double Imaginary { get; }
        public double Real { get; }

        public static Complex operator *(double scalar, Complex complex) => new Complex(scalar * complex.Real, scalar * complex.Imaginary);

        public static Complex operator *(Complex complex, double scalar) => scalar * complex;

        public static Complex operator /(Complex complex, double scalar) => new Complex(complex.Real / scalar, complex.Imaginary / scalar);

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static Complex operator -(Complex lhs, Complex rhs) => new Complex(lhs.Real - rhs.Real, lhs.Imaginary - rhs.Imaginary);

        public static Complex operator /(Complex lhs, Complex rhs)
        {
            double denom = rhs.Real * rhs.Real + rhs.Imaginary * rhs.Imaginary;
            return new Complex((lhs.Real * rhs.Real + lhs.Imaginary * rhs.Imaginary) / denom, (-lhs.Real * rhs.Imaginary + lhs.Imaginary * rhs.Real) / denom);
        }

        public double Abs() => Math.Sqrt(Real * Real + Imaginary * Imaginary);
    }
}
