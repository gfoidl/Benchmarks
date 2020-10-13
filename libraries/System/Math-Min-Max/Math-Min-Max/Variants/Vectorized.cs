using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;

namespace Math_Min_Max.Variants
{
    public static class Vectorized
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static double Max(double val1, double val2)
        {
            // This matches the IEEE 754:2019 `maximum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if (Sse2.IsSupported)
            {
                Vector128<double> lhs = Vector128.CreateScalarUnsafe(val1);
                Vector128<double> rhs = Vector128.CreateScalarUnsafe(val2);

                // Get the larger of lhs or rhs, picking rhs if either is NaN or both are +/-0
                Vector128<double> larger = Sse2.MaxScalar(lhs, rhs);

                // Compare lhs and rhs for equality, giving us a mask of all ones (equal) or all zeros (not-equal)
                // and combine the raw bits of lhs and rhs
                Vector128<double> equalityMask = Sse2.CompareScalarEqual(lhs, rhs);
                Vector128<double> combinedBits = Sse2.And(lhs, rhs);

                if (Sse41.IsSupported)
                {
                    // Select combinedBits if lhs and rhs are equal; otherwise select larger
                    larger = Sse41.BlendVariable(larger, combinedBits, equalityMask);
                }
                else
                {
                    // Select combinedBits if lhs and rhs are equal; otherwise 0
                    Vector128<double> larger1 = Sse2.And(equalityMask, combinedBits);

                    // Select 0 if lhs and rhs are equal; otherwise larger
                    Vector128<double> larger2 = Sse2.AndNot(equalityMask, larger);

                    larger = Sse2.Or(larger1, larger2);
                }

                // Check if lhs is NaN, giving us a mask of all ones (true) or all zeros (false)
                Vector128<double> nanMask = Sse2.CompareScalarUnordered(lhs, lhs);

                if (Sse41.IsSupported)
                {
                    // Select lhs if lhs was NaN; otherwise select larger
                    return Sse41.BlendVariable(larger, lhs, nanMask).ToScalar();
                }
                else
                {
                    // Select lhs if lhs was NaN; otherwise 0
                    Vector128<double> result1 = Sse2.And(nanMask, lhs);

                    // Select 0 if lhs was NaN; otherwise larger
                    Vector128<double> result2 = Sse2.AndNot(nanMask, larger);

                    // Combine the two possible results for the actual result as only one will be non-zero
                    return Sse2.Or(result1, result2).ToScalar();
                }
            }

            return SoftwareFallback(val1, val2);

            static double SoftwareFallback(double val1, double val2)
            {
                if (val1 > val2 || IsNaN(val1) || val1 == val2 && !IsNegative(val1))
                {
                    goto Exit;
                }

                val1 = val2;

            Exit:
                return val1;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static float Max(float val1, float val2)
        {
            // This matches the IEEE 754:2019 `maximum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if (Sse.IsSupported)
            {
                Vector128<float> lhs = Vector128.CreateScalarUnsafe(val1);
                Vector128<float> rhs = Vector128.CreateScalarUnsafe(val2);

                // Get the larger of lhs or rhs, picking rhs if either is NaN or both are +/-0
                Vector128<float> larger = Sse.MaxScalar(lhs, rhs);

                // Compare lhs and rhs for equality, giving us a mask of all ones (equal) or all zeros (not-equal)
                // and combine the raw bits of lhs and rhs
                Vector128<float> equalityMask = Sse.CompareScalarEqual(lhs, rhs);
                Vector128<float> combinedBits = Sse.And(lhs, rhs);

                if (Sse41.IsSupported)
                {
                    // Select combinedBits if lhs and rhs are equal; otherwise select larger
                    larger = Sse41.BlendVariable(larger, combinedBits, equalityMask);
                }
                else
                {
                    // Select combinedBits if lhs and rhs are equal; otherwise 0
                    Vector128<float> larger1 = Sse.And(equalityMask, combinedBits);

                    // Select 0 if lhs and rhs are equal; otherwise larger
                    Vector128<float> larger2 = Sse.AndNot(equalityMask, larger);

                    larger = Sse.Or(larger1, larger2);
                }

                // Check if lhs is NaN, giving us a mask of all ones (true) or all zeros (false)
                Vector128<float> nanMask = Sse.CompareScalarUnordered(lhs, lhs);

                if (Sse41.IsSupported)
                {
                    // Select lhs if lhs was NaN; otherwise select larger
                    return Sse41.BlendVariable(larger, lhs, nanMask).ToScalar();
                }
                else
                {
                    // Select lhs if lhs was NaN; otherwise 0
                    Vector128<float> result1 = Sse.And(nanMask, lhs);

                    // Select 0 if lhs was NaN; otherwise larger
                    Vector128<float> result2 = Sse.AndNot(nanMask, larger);

                    // Combine the two possible results for the actual result as only one will be non-zero
                    return Sse.Or(result1, result2).ToScalar();
                }
            }

            return SoftwareFallback(val1, val2);

            static float SoftwareFallback(float val1, float val2)
            {
                if (val1 > val2 || IsNaN(val1) || val1 == val2 && !IsNegative(val1))
                {
                    goto Exit;
                }

                val1 = val2;

            Exit:
                return val1;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static double Min(double val1, double val2)
        {
            // This matches the IEEE 754:2019 `minimum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if (Sse2.IsSupported)
            {
                Vector128<double> lhs = Vector128.CreateScalarUnsafe(val1);
                Vector128<double> rhs = Vector128.CreateScalarUnsafe(val2);

                // Get the smaller of lhs or rhs, picking rhs if either is NaN or both are +/-0
                Vector128<double> smaller = Sse2.MinScalar(lhs, rhs);

                // Compare lhs and rhs for equality, giving us a mask of all ones (equal) or all zeros (not-equal)
                // and combine the raw bits of lhs and rhs
                Vector128<double> equalityMask = Sse2.CompareScalarEqual(lhs, rhs);
                Vector128<double> combinedBits = Sse2.Or(lhs, rhs);

                // AND the above two masks to either get a mask of all zeros (not-equal) or the combined bits (equal)
                // and then combine that result with the smaller value. This has the side-effect of setting the sign-bit
                // if both were zero, but only one input was negative zero; and otherwise returning the original value.
                combinedBits = Sse2.And(combinedBits, equalityMask);
                smaller = Sse2.Or(smaller, combinedBits);

                // Check if lhs is NaN, giving us a mask of all ones (true) or all zeros (false)
                Vector128<double> nanMask = Sse2.CompareScalarUnordered(lhs, lhs);

                if (Sse41.IsSupported)
                {
                    // Select lhs if lhs was NaN; otherwise select smaller
                    return Sse41.BlendVariable(smaller, lhs, nanMask).ToScalar();
                }
                else
                {
                    // Select lhs if lhs was NaN; otherwise 0
                    Vector128<double> result1 = Sse2.And(nanMask, lhs);

                    // Select 0 if lhs was NaN; otherwise smaller
                    Vector128<double> result2 = Sse2.AndNot(nanMask, smaller);

                    // Combine the two possible results for the actual result as only one will be non-zero
                    return Sse2.Or(result1, result2).ToScalar();
                }
            }

            return SoftwareFallback(val1, val2);

            static double SoftwareFallback(double val1, double val2)
            {
                if (val1 < val2 || IsNaN(val1) || (val1 == val2 && IsNegative(val1)))
                {
                    goto Exit;
                }

                val1 = val2;

            Exit:
                return val1;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static float Min(float val1, float val2)
        {
            // This matches the IEEE 754:2019 `minimum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if (Sse.IsSupported)
            {
                Vector128<float> lhs = Vector128.CreateScalarUnsafe(val1);
                Vector128<float> rhs = Vector128.CreateScalarUnsafe(val2);

                // Get the smaller of lhs or rhs, picking rhs if either is NaN or both are +/-0
                Vector128<float> smaller = Sse.MinScalar(lhs, rhs);

                // Compare lhs and rhs for equality, giving us a mask of all ones (equal) or all zeros (not-equal)
                // and combine the raw bits of lhs and rhs
                Vector128<float> equalityMask = Sse.CompareScalarEqual(lhs, rhs);
                Vector128<float> combinedBits = Sse.Or(lhs, rhs);

                // AND the above two masks to either get a mask of all zeros (not-equal) or the combined bits (equal)
                // and then combine that result with the smaller value. This has the side-effect of setting the sign-bit
                // if both were zero, but only one input was negative zero; and otherwise returning the original value.
                combinedBits = Sse.And(combinedBits, equalityMask);
                smaller = Sse.Or(smaller, combinedBits);

                // Check if lhs is NaN, giving us a mask of all ones (true) or all zeros (false)
                Vector128<float> nanMask = Sse.CompareScalarUnordered(lhs, lhs);

                if (Sse41.IsSupported)
                {
                    // Select lhs if lhs was NaN; otherwise select smaller
                    return Sse41.BlendVariable(smaller, lhs, nanMask).ToScalar();
                }
                else
                {
                    // Select lhs if lhs was NaN; otherwise 0
                    Vector128<float> result1 = Sse.And(nanMask, lhs);

                    // Select 0 if lhs was NaN; otherwise smaller
                    Vector128<float> result2 = Sse.AndNot(nanMask, smaller);

                    // Combine the two possible results for the actual result as only one will be non-zero
                    return Sse.Or(result1, result2).ToScalar();
                }
            }

            return SoftwareFallback(val1, val2);

            static float SoftwareFallback(float val1, float val2)
            {
                if (val1 < val2 || IsNaN(val1) || (val1 == val2 && IsNegative(val1)))
                {
                    goto Exit;
                }

                val1 = val2;

            Exit:
                return val1;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static bool IsNaN(double d)
        {
            // A NaN will never equal itself so this is an
            // easy and efficient way to check for NaN.

#pragma warning disable CS1718
            return d != d;
#pragma warning restore CS1718
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe bool IsNaN(float f)
        {
            // A NaN will never equal itself so this is an
            // easy and efficient way to check for NaN.

#pragma warning disable CS1718
            return f != f;
#pragma warning restore CS1718
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static bool IsNegative(double d)
        {
            return DoubleToInt64Bits(d) < 0;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe bool IsNegative(float f)
        {
            return SingleToInt32Bits(f) < 0;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe long DoubleToInt64Bits(double value)
        {
            if (Sse2.X64.IsSupported)
            {
                Vector128<long> vec = Vector128.CreateScalarUnsafe(value).AsInt64();
                return Sse2.X64.ConvertToInt64(vec);
            }

            return *(long*)&value;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe int SingleToInt32Bits(float value)
        {
            if (Sse2.IsSupported)
            {
                Vector128<int> vec = Vector128.CreateScalarUnsafe(value).AsInt32();
                return Sse2.ConvertToInt32(vec);
            }

            return *((int*)&value);
        }
    }
}
