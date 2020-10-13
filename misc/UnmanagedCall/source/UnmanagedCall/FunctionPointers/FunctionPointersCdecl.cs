using System;
using System.Runtime.InteropServices;

namespace UnmanagedCall.FunctionPointers
{
    internal static unsafe class FunctionPointersCdecl
    {
        private static readonly IntPtr s_handle = NativeLibrary.Load("NativeLib");

        private static readonly delegate* cdecl<int, int, int>          s_add_i   = (delegate* cdecl<int, int, int>)         NativeLibrary.GetExport(s_handle, "add_i");
        private static readonly delegate* cdecl<double, double, double> s_add_d   = (delegate* cdecl<double, double, double>)NativeLibrary.GetExport(s_handle, "add_d");
        private static readonly delegate* cdecl<double*, int, double>   s_vec_sum = (delegate* cdecl<double*, int, double>)  NativeLibrary.GetExport(s_handle, "vec_sum");
        private static readonly delegate* cdecl<void>                   s_empty   = (delegate* cdecl<void>)                  NativeLibrary.GetExport(s_handle, "empty");
        //---------------------------------------------------------------------
        public static int    Add   (int a, int b)       => s_add_i(a, b);
        public static double Add   (double a, double b) => s_add_d(a, b);
        public static double VecSum(double* vec, int n) => s_vec_sum(vec, n);
        public static void   Empty ()                   => s_empty();
    }
}
