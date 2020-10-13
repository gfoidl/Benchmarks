using System.Security;

namespace UnmanagedCall.Load
{
    internal static class NativeMethodsWOSecurityCheck
    {
        public static readonly Delegates.add_i add_i     = GetMethodDelegate<Delegates.add_i>();
        public static readonly Delegates.add_d add_d     = GetMethodDelegate<Delegates.add_d>();
        public static readonly Delegates.vec_sum vec_sum = GetMethodDelegate<Delegates.vec_sum>();
        public static readonly Delegates.empty empty     = GetMethodDelegate<Delegates.empty>();
        //---------------------------------------------------------------------
        private static T GetMethodDelegate<T>() where T : class
        {
            return UnmanagedLibrary.GetNativeMethodDelegate<T>(typeof(T).Name);
        }
        //---------------------------------------------------------------------
        public static class Delegates
        {
            [SuppressUnmanagedCodeSecurity]
            public delegate int add_i(int a, int b);

            [SuppressUnmanagedCodeSecurity]
            public delegate double add_d(double a, double b);

            [SuppressUnmanagedCodeSecurity]
            public unsafe delegate double vec_sum(double* vec, int n);

            [SuppressUnmanagedCodeSecurity]
            public delegate void empty();
        }
    }
}
