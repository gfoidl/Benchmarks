using System.Runtime.InteropServices;

namespace UnmanagedCall.DllImport
{
    internal static class NativeDllImport
    {
        private const string LibName = "NativeLib";
        //---------------------------------------------------------------------
        [DllImport(LibName)]
        public static extern int add_i(int a, int b);
        //---------------------------------------------------------------------
        [DllImport(LibName)]
        public static extern double add_d(double a, double b);
        //---------------------------------------------------------------------
        [DllImport(LibName)]
        public static extern unsafe double vec_sum(double* vec, int n);
        //---------------------------------------------------------------------
        [DllImport(LibName)]
        public static extern unsafe void empty();
    }
}
