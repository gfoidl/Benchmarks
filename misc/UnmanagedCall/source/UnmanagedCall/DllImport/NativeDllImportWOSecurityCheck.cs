using System.Runtime.InteropServices;
using System.Security;

namespace UnmanagedCall.DllImport
{
    internal static class NativeDllImportWOSecurityCheck
    {
        private const string LibName = "NativeLib";
        //---------------------------------------------------------------------
        [SuppressUnmanagedCodeSecurity]
        [DllImport(LibName)]
        public static extern int add_i(int a, int b);
        //---------------------------------------------------------------------
        [SuppressUnmanagedCodeSecurity]
        [DllImport(LibName)]
        public static extern double add_d(double a, double b);
        //---------------------------------------------------------------------
        [SuppressUnmanagedCodeSecurity]
        [DllImport(LibName)]
        public static extern unsafe double vec_sum(double* vec, int n);
        //---------------------------------------------------------------------
        [SuppressUnmanagedCodeSecurity]
        [DllImport(LibName)]
        public static extern unsafe void empty();
    }
}
