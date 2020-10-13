using System;
using System.Runtime.InteropServices;

namespace UnmanagedCall.FunctionPointers
{
    internal static unsafe class FunctionPointersDefault
    {
        private static readonly IntPtr s_handle = NativeLibrary.Load("NativeLib");

        private static readonly delegate*<int, int, int>          s_add_i   = (delegate*<int, int, int>)         NativeLibrary.GetExport(s_handle, "add_i");
        private static readonly delegate*<double, double, double> s_add_d   = (delegate*<double, double, double>)NativeLibrary.GetExport(s_handle, "add_d");
        private static readonly delegate*<double*, int, double>   s_vec_sum = (delegate*<double*, int, double>)  NativeLibrary.GetExport(s_handle, "vec_sum");
        private static readonly delegate*<void>                   s_empty   = (delegate*<void>)                  NativeLibrary.GetExport(s_handle, "empty");
        //---------------------------------------------------------------------
        public static int    Add   (int a, int b)       => s_add_i(a, b);
        public static double Add   (double a, double b) => s_add_d(a, b);
        public static double VecSum(double* vec, int n) => s_vec_sum(vec, n);
        public static void   Empty ()                   => s_empty();
    }
}
