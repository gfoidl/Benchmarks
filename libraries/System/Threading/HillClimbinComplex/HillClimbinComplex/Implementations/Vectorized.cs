using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HillClimbinComplex.Implementations
{
    public struct ComplexVectorized
    {
        public ComplexVectorized(double real, double imaginary)
        {
            Real = real;
            Imaginary = imaginary;
        }

        public double Imaginary { get; }
        public double Real { get; }

        public static ComplexVectorized operator *(double scalar, ComplexVectorized ComplexVectorized) => new ComplexVectorized(scalar * ComplexVectorized.Real, scalar * ComplexVectorized.Imaginary);

        public static ComplexVectorized operator *(ComplexVectorized ComplexVectorized, double scalar) => scalar * ComplexVectorized;

        public static ComplexVectorized operator /(ComplexVectorized ComplexVectorized, double scalar) => new ComplexVectorized(ComplexVectorized.Real / scalar, ComplexVectorized.Imaginary / scalar);

        public static ComplexVectorized operator -(ComplexVectorized lhs, ComplexVectorized rhs) => new ComplexVectorized(lhs.Real - rhs.Real, lhs.Imaginary - rhs.Imaginary);

        public static ComplexVectorized operator /(ComplexVectorized lhs, ComplexVectorized rhs)
        {
            double denom = rhs.Real * rhs.Real + rhs.Imaginary * rhs.Imaginary;
            return new ComplexVectorized((lhs.Real * rhs.Real + lhs.Imaginary * rhs.Imaginary) / denom, (-lhs.Real * rhs.Imaginary + lhs.Imaginary * rhs.Real) / denom);
        }

        public double Abs() => Math.Sqrt(Real * Real + Imaginary * Imaginary);
    }
}
