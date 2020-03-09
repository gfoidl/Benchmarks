// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Math_Min_Max.Variants;
using Xunit;
using Xunit.Sdk;

#pragma warning disable xUnit1025 // reporting duplicate test cases due to not distinguishing 0.0 from -0.0

namespace System.Tests
{
    public static class InlinedOptimizedTests
    {
        // binary64 (double) has a machine epsilon of 2^-52 (approx. 2.22e-16). However, this
        // is slightly too accurate when writing tests meant to run against libm implementations
        // for various platforms. 2^-50 (approx. 8.88e-16) seems to be as accurate as we can get.
        //
        // The tests themselves will take CrossPlatformMachineEpsilon and adjust it according to the expected result
        // so that the delta used for comparison will compare the most significant digits and ignore
        // any digits that are outside the double precision range (15-17 digits).
        //
        // For example, a test with an expect result in the format of 0.xxxxxxxxxxxxxxxxx will use
        // CrossPlatformMachineEpsilon for the variance, while an expected result in the format of 0.0xxxxxxxxxxxxxxxxx
        // will use CrossPlatformMachineEpsilon / 10 and expected result in the format of x.xxxxxxxxxxxxxxxx will
        // use CrossPlatformMachineEpsilon * 10.
        private const double CrossPlatformMachineEpsilon = 8.8817841970012523e-16;

        // binary32 (float) has a machine epsilon of 2^-23 (approx. 1.19e-07). However, this
        // is slightly too accurate when writing tests meant to run against libm implementations
        // for various platforms. 2^-21 (approx. 4.76e-07) seems to be as accurate as we can get.
        //
        // The tests themselves will take CrossPlatformMachineEpsilon and adjust it according to the expected result
        // so that the delta used for comparison will compare the most significant digits and ignore
        // any digits that are outside the single precision range (6-9 digits).

        // For example, a test with an expect result in the format of 0.xxxxxxxxx will use
        // CrossPlatformMachineEpsilon for the variance, while an expected result in the format of 0.0xxxxxxxxx
        // will use CrossPlatformMachineEpsilon / 10 and expected result in the format of x.xxxxxx will
        // use CrossPlatformMachineEpsilon * 10.
        private const float CrossPlatformMachineEpsilonSingle = 4.76837158e-07f;

        /// <summary>Verifies that two <see cref="double"/> values are equal, within the <paramref name="allowedVariance"/>.</summary>
        /// <param name="expected">The expected value</param>
        /// <param name="actual">The value to be compared against</param>
        /// <param name="allowedVariance">The total variance allowed between the expected and actual results.</param>
        /// <exception cref="EqualException">Thrown when the values are not equal</exception>
        private static void AssertEqual(double expected, double actual, double variance)
        {
            if (double.IsNaN(expected))
            {
                if (double.IsNaN(actual))
                {
                    return;
                }

                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
            else if (double.IsNaN(actual))
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }

            if (double.IsNegativeInfinity(expected))
            {
                if (double.IsNegativeInfinity(actual))
                {
                    return;
                }

                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
            else if (double.IsNegativeInfinity(actual))
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }

            if (double.IsPositiveInfinity(expected))
            {
                if (double.IsPositiveInfinity(actual))
                {
                    return;
                }

                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
            else if (double.IsPositiveInfinity(actual))
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }

            if (IsNegativeZero(expected))
            {
                if (IsNegativeZero(actual))
                {
                    return;
                }

                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly -0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }
            else if (IsNegativeZero(actual))
            {
                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly -0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }

            if (IsPositiveZero(expected))
            {
                if (IsPositiveZero(actual))
                {
                    return;
                }

                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly +0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }
            else if (IsPositiveZero(actual))
            {
                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly +0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }

            var delta = Math.Abs(actual - expected);

            if (delta > variance)
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
        }

        /// <summary>Verifies that two <see cref="float"/> values are equal, within the <paramref name="variance"/>.</summary>
        /// <param name="expected">The expected value</param>
        /// <param name="actual">The value to be compared against</param>
        /// <param name="variance">The total variance allowed between the expected and actual results.</param>
        /// <exception cref="EqualException">Thrown when the values are not equal</exception>
        private static void AssertEqual(float expected, float actual, float variance)
        {
            if (float.IsNaN(expected))
            {
                if (float.IsNaN(actual))
                {
                    return;
                }

                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
            else if (float.IsNaN(actual))
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }

            if (float.IsNegativeInfinity(expected))
            {
                if (float.IsNegativeInfinity(actual))
                {
                    return;
                }

                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
            else if (float.IsNegativeInfinity(actual))
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }

            if (float.IsPositiveInfinity(expected))
            {
                if (float.IsPositiveInfinity(actual))
                {
                    return;
                }

                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
            else if (float.IsPositiveInfinity(actual))
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }

            if (IsNegativeZero(expected))
            {
                if (IsNegativeZero(actual))
                {
                    return;
                }

                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly -0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }
            else if (IsNegativeZero(actual))
            {
                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly -0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }

            if (IsPositiveZero(expected))
            {
                if (IsPositiveZero(actual))
                {
                    return;
                }

                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly +0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }
            else if (IsPositiveZero(actual))
            {
                if (IsPositiveZero(variance) || IsNegativeZero(variance))
                {
                    throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
                }

                // When the variance is not +-0.0, then we are handling a case where
                // the actual result is expected to not be exactly +0.0 on some platforms
                // and we should fallback to checking if it is within the allowed variance instead.
            }

            var delta = Math.Abs(actual - expected);

            if (delta > variance)
            {
                throw new EqualException(ToStringPadded(expected), ToStringPadded(actual));
            }
        }

        private static unsafe bool IsNegativeZero(double value)
        {
            return (*(ulong*)(&value)) == 0x8000000000000000;
        }

        private static unsafe bool IsNegativeZero(float value)
        {
            return (*(uint*)(&value)) == 0x80000000;
        }

        private static unsafe bool IsPositiveZero(double value)
        {
            return (*(ulong*)(&value)) == 0x0000000000000000;
        }

        private static unsafe bool IsPositiveZero(float value)
        {
            return (*(uint*)(&value)) == 0x00000000;
        }

        // We have a custom ToString here to ensure that edge cases (specifically +-0.0,
        // but also NaN and +-infinity) are correctly and consistently represented.
        private static string ToStringPadded(double value)
        {
            if (double.IsNaN(value))
            {
                return "NaN".PadLeft(20);
            }
            else if (double.IsPositiveInfinity(value))
            {
                return "+\u221E".PadLeft(20);
            }
            else if (double.IsNegativeInfinity(value))
            {
                return "-\u221E".PadLeft(20);
            }
            else if (IsNegativeZero(value))
            {
                return "-0.0".PadLeft(20);
            }
            else if (IsPositiveZero(value))
            {
                return "+0.0".PadLeft(20);
            }
            else
            {
                return $"{value,20:G17}";
            }
        }

        [Theory]
        [InlineData(double.NegativeInfinity, double.PositiveInfinity, double.PositiveInfinity)]
        [InlineData(double.PositiveInfinity, double.NegativeInfinity, double.PositiveInfinity)]
        [InlineData(double.MinValue,         double.MaxValue,         double.MaxValue)]
        [InlineData(double.MaxValue,         double.MinValue,         double.MaxValue)]
        [InlineData(double.NaN,              double.NaN,              double.NaN)]
        [InlineData(double.NaN,              1.0,                     double.NaN)]
        [InlineData(1.0,                     double.NaN,              double.NaN)]
        [InlineData(double.PositiveInfinity, double.NaN,              double.NaN)]
        [InlineData(double.NegativeInfinity, double.NaN,              double.NaN)]
        [InlineData(double.NaN,              double.PositiveInfinity, double.NaN)]
        [InlineData(double.NaN,              double.NegativeInfinity, double.NaN)]
        [InlineData(-0.0,                    0.0,                     0.0)]
        [InlineData( 0.0,                   -0.0,                     0.0)]
        [InlineData( 2.0,                   -3.0,                     2.0)]
        [InlineData(-3.0,                    2.0,                     2.0)]
        [InlineData( 3.0,                   -2.0,                     3.0)]
        [InlineData(-2.0,                    3.0,                     3.0)]
        public static void Max_Double_NotNetFramework(double x, double y, double expectedResult)
        {
            AssertEqual(expectedResult, InlinedOptimized.Max(x, y), 0.0);
        }

        [Theory]
        [InlineData(float.NegativeInfinity, float.PositiveInfinity, float.PositiveInfinity)]
        [InlineData(float.PositiveInfinity, float.NegativeInfinity, float.PositiveInfinity)]
        [InlineData(float.MinValue,         float.MaxValue,         float.MaxValue)]
        [InlineData(float.MaxValue,         float.MinValue,         float.MaxValue)]
        [InlineData(float.NaN,              float.NaN,              float.NaN)]
        [InlineData(float.NaN,              1.0,                    float.NaN)]
        [InlineData(1.0,                    float.NaN,              float.NaN)]
        [InlineData(float.PositiveInfinity, float.NaN,              float.NaN)]
        [InlineData(float.NegativeInfinity, float.NaN,              float.NaN)]
        [InlineData(float.NaN,              float.PositiveInfinity, float.NaN)]
        [InlineData(float.NaN,              float.NegativeInfinity, float.NaN)]
        [InlineData(-0.0,                   0.0,                    0.0)]
        [InlineData( 0.0,                  -0.0,                    0.0)]
        [InlineData( 2.0,                  -3.0,                    2.0)]
        [InlineData(-3.0,                   2.0,                    2.0)]
        [InlineData( 3.0,                  -2.0,                    3.0)]
        [InlineData(-2.0,                   3.0,                    3.0)]
        public static void Max_Single_NotNetFramework(float x, float y, float expectedResult)
        {
            AssertEqual(expectedResult, InlinedOptimized.Max(x, y), 0.0f);
        }

        [Theory]
        [InlineData(double.NegativeInfinity, double.PositiveInfinity, double.NegativeInfinity)]
        [InlineData(double.PositiveInfinity, double.NegativeInfinity, double.NegativeInfinity)]
        [InlineData(double.MinValue,         double.MaxValue,         double.MinValue)]
        [InlineData(double.MaxValue,         double.MinValue,         double.MinValue)]
        [InlineData(double.NaN,              double.NaN,              double.NaN)]
        [InlineData(double.NaN,              1.0,                     double.NaN)]
        [InlineData(1.0,                     double.NaN,              double.NaN)]
        [InlineData(double.PositiveInfinity, double.NaN,              double.NaN)]
        [InlineData(double.NegativeInfinity, double.NaN,              double.NaN)]
        [InlineData(double.NaN,              double.PositiveInfinity, double.NaN)]
        [InlineData(double.NaN,              double.NegativeInfinity, double.NaN)]
        [InlineData(-0.0,                    0.0,                     -0.0)]
        [InlineData( 0.0,                   -0.0,                     -0.0)]
        [InlineData( 2.0,                   -3.0,                     -3.0)]
        [InlineData(-3.0,                    2.0,                     -3.0)]
        [InlineData( 3.0,                   -2.0,                     -2.0)]
        [InlineData(-2.0,                    3.0,                     -2.0)]
        public static void Min_Double_NotNetFramework(double x, double y, double expectedResult)
        {
            AssertEqual(expectedResult, InlinedOptimized.Min(x, y), 0.0);
        }

        [Theory]
        [InlineData(float.NegativeInfinity, float.PositiveInfinity, float.NegativeInfinity)]
        [InlineData(float.PositiveInfinity, float.NegativeInfinity, float.NegativeInfinity)]
        [InlineData(float.MinValue,         float.MaxValue,         float.MinValue)]
        [InlineData(float.MaxValue,         float.MinValue,         float.MinValue)]
        [InlineData(float.NaN,              float.NaN,              float.NaN)]
        [InlineData(float.NaN,              1.0,                    float.NaN)]
        [InlineData(1.0,                    float.NaN,              float.NaN)]
        [InlineData(float.PositiveInfinity, float.NaN,              float.NaN)]
        [InlineData(float.NegativeInfinity, float.NaN,              float.NaN)]
        [InlineData(float.NaN,              float.PositiveInfinity, float.NaN)]
        [InlineData(float.NaN,              float.NegativeInfinity, float.NaN)]
        [InlineData(-0.0,                   0.0,                    -0.0)]
        [InlineData( 0.0,                  -0.0,                    -0.0)]
        [InlineData( 2.0,                  -3.0,                    -3.0)]
        [InlineData(-3.0,                   2.0,                    -3.0)]
        [InlineData( 3.0,                  -2.0,                    -2.0)]
        [InlineData(-2.0,                   3.0,                    -2.0)]
        public static void Min_Single_NotNetFramework(float x, float y, float expectedResult)
        {
            AssertEqual(expectedResult, InlinedOptimized.Min(x, y), 0.0f);
        }
    }
}
