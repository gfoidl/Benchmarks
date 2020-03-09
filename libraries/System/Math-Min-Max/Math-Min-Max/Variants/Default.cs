namespace Math_Min_Max.Variants
{
    public static class Default
    {
        public static double Max(double val1, double val2)
        {
            // This matches the IEEE 754:2019 `maximum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if ((val1 > val2) || double.IsNaN(val1))
            {
                return val1;
            }

            if (val1 == val2)
            {
                return double.IsNegative(val1) ? val2 : val1;
            }

            return val2;
        }

        public static float Max(float val1, float val2)
        {
            // This matches the IEEE 754:2019 `maximum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if ((val1 > val2) || float.IsNaN(val1))
            {
                return val1;
            }

            if (val1 == val2)
            {
                return float.IsNegative(val1) ? val2 : val1;
            }

            return val2;
        }

        public static double Min(double val1, double val2)
        {
            // This matches the IEEE 754:2019 `minimum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if ((val1 < val2) || double.IsNaN(val1))
            {
                return val1;
            }

            if (val1 == val2)
            {
                return double.IsNegative(val1) ? val1 : val2;
            }

            return val2;
        }

        public static float Min(float val1, float val2)
        {
            // This matches the IEEE 754:2019 `minimum` function
            //
            // It propagates NaN inputs back to the caller and
            // otherwise returns the larger of the inputs. It
            // treats +0 as larger than -0 as per the specification.

            if ((val1 < val2) || float.IsNaN(val1))
            {
                return val1;
            }

            if (val1 == val2)
            {
                return float.IsNegative(val1) ? val1 : val2;
            }

            return val2;
        }
    }
}
