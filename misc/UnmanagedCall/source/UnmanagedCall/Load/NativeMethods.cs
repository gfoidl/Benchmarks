namespace UnmanagedCall.Load
{
    internal static class NativeMethods
    {
        public static readonly Delegates.add_i add_i     = GetMethodDelegate<Delegates.add_i>();
        public static readonly Delegates.add_d add_d     = GetMethodDelegate<Delegates.add_d>();
        public static readonly Delegates.vec_sum vec_sum = GetMethodDelegate<Delegates.vec_sum>();
        public static readonly Delegates.empty empty     = GetMethodDelegate<Delegates.empty>();
        //---------------------------------------------------------------------
        private static T GetMethodDelegate<T>() where T : class
            => UnmanagedLibrary.GetNativeMethodDelegate<T>(typeof(T).Name);
        //---------------------------------------------------------------------
        public static class Delegates
        {
            public        delegate int    add_i  (int a, int b);
            public        delegate double add_d  (double a, double b);
            public unsafe delegate double vec_sum(double* vec, int n);
            public        delegate void   empty  ();
        }
    }
}
