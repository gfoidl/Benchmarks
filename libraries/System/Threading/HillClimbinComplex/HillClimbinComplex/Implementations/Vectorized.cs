using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.Arm;
using System.Runtime.Intrinsics.X86;

namespace HillClimbinComplex.Implementations
{
    [StructLayout(LayoutKind.Explicit)]
    public struct ComplexVectorized
    {
        [field: FieldOffset(0)]
        public double Real { get; }

        [field: FieldOffset(sizeof(double))]
        public double Imaginary { get; }

        [FieldOffset(0)]
        private readonly Vector128<double> _vector;

        public ComplexVectorized(double real, double imaginary)
        {
            Unsafe.SkipInit(out this);
            this.Real = real;
            this.Imaginary = imaginary;
        }

        private ComplexVectorized(Vector128<double> vector)
        {
            Unsafe.SkipInit(out this);
            _vector = vector;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe ComplexVectorized operator *(double scalar, ComplexVectorized complex)
        {
            if (Sse2.IsSupported)
            {
                Vector128<double> scalarVec = Vector128.Create(scalar);
                Vector128<double> resultVec = Sse2.Multiply(complex._vector, scalarVec);
                return new ComplexVectorized(resultVec);
            }
            else if (AdvSimd.Arm64.IsSupported)
            {
                Vector128<double> scalarVec = Vector128.Create(scalar);
                Vector128<double> resultVec = AdvSimd.Arm64.Multiply(complex._vector, scalarVec);
                return new ComplexVectorized(resultVec);
            }

            return new ComplexVectorized(scalar * complex.Real, scalar * complex.Imaginary);
        }

        public static ComplexVectorized operator *(ComplexVectorized complex, double scalar) => scalar * complex;

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ComplexVectorized operator /(ComplexVectorized complex, double scalar)
        {
            if (Sse2.IsSupported)
            {
                Vector128<double> scalarVec = Vector128.Create(scalar);
                Vector128<double> resultVec = Sse2.Divide(complex._vector, scalarVec);
                return new ComplexVectorized(resultVec);
            }
            else if (AdvSimd.Arm64.IsSupported)
            {
                Vector128<double> scalarVec = Vector128.Create(scalar);
                Vector128<double> resultVec = AdvSimd.Arm64.Divide(complex._vector, scalarVec);
                return new ComplexVectorized(resultVec);
            }

            return new ComplexVectorized(complex.Real / scalar, complex.Imaginary / scalar);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ComplexVectorized operator -(ComplexVectorized lhs, ComplexVectorized rhs)
        {
            if (Sse2.IsSupported)
            {
                Vector128<double> resultVec = Sse2.Subtract(lhs._vector, rhs._vector);
                return new ComplexVectorized(resultVec);
            }
            else if (AdvSimd.Arm64.IsSupported)
            {
                Vector128<double> resultVec = AdvSimd.Arm64.Subtract(lhs._vector, rhs._vector);
                return new ComplexVectorized(resultVec);
            }

            return new ComplexVectorized(lhs.Real - rhs.Real, lhs.Imaginary - rhs.Imaginary);
        }

        private static readonly long s_minus0AsLong = BitConverter.DoubleToInt64Bits(-0d);

        [ModuleInitializer]
        internal static void Init()
        {
            _ = s_minus0AsLong;
        }

        //[MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ComplexVectorized operator /(ComplexVectorized lhs, ComplexVectorized rhs)
        {
            if (Sse2.IsSupported)
            {
                Vector128<double> lhsVec = lhs._vector;
                Vector128<double> rhsVec = rhs._vector;

                Vector128<double> realVec = Sse2.Multiply(lhsVec, rhsVec);
                Vector128<double> swapped = Sse2.Shuffle(realVec, realVec, 0x1);
                realVec = Sse2.Add(realVec, swapped);

                Vector128<double> rhsSwapped = Sse2.Shuffle(rhsVec, rhsVec, 0x1);
                Vector128<double> imgVec = Sse2.Multiply(lhsVec, rhsSwapped);
                //Vector128<double> negSign = Vector128.CreateScalar(-0d);
                Vector128<double> negSign = Vector128.CreateScalar(BitConverter.Int64BitsToDouble(s_minus0AsLong));
                imgVec = Sse2.Xor(imgVec, negSign);
                swapped = Sse2.Shuffle(imgVec, imgVec, 0x1);
                imgVec = Sse2.Add(imgVec, swapped);

                Vector128<double> resVec = Vector128.Create(realVec.ToScalar(), imgVec.ToScalar());

                Vector128<double> denomVec = Sse2.Multiply(rhsVec, rhsVec);
                swapped = Sse2.Shuffle(denomVec, denomVec, 0x1);
                denomVec = Sse2.Add(denomVec, swapped);

                resVec = Sse2.Divide(resVec, denomVec);

                return new ComplexVectorized(resVec);
            }

            double denom = rhs.Real * rhs.Real + rhs.Imaginary * rhs.Imaginary;
            double real = (lhs.Real * rhs.Real + lhs.Imaginary * rhs.Imaginary) / denom;
            double img = (-lhs.Real * rhs.Imaginary + lhs.Imaginary * rhs.Real) / denom;
            return new ComplexVectorized(real, img);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public double Abs()
        {
            if (Sse2.IsSupported)
            {
                Vector128<double> vector = _vector;
                Vector128<double> squared = Sse2.Multiply(vector, vector);
                Vector128<double> swapped = Sse2.Shuffle(squared, squared, 0x1);
                Vector128<double> sum = Sse2.Add(squared, swapped);
                Vector128<double> sqrt = Sse2.SqrtScalar(sum);
                return sqrt.ToScalar();
            }

            return Math.Sqrt(this.Real * this.Real + this.Imaginary * this.Imaginary);
        }
    }
}
