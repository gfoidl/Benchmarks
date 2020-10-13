using System;
using System.Runtime.InteropServices;
using InlineIL;
using static InlineIL.IL.Emit;

namespace UnmanagedCall.Load
{
    /*
     * These methods won't inline because of
     * [FAILED: explicit tail prefix in callee] CalliTail:Empty()
     */
    internal static class CalliTail
    {
        public static readonly IntPtr s_addIPtr   = UnmanagedLibrary.LoadSymbol("add_i");
        public static readonly IntPtr s_addDPtr   = UnmanagedLibrary.LoadSymbol("add_d");
        public static readonly IntPtr s_vecSumPtr = UnmanagedLibrary.LoadSymbol("vec_sum");
        public static readonly IntPtr s_emptyPtr  = UnmanagedLibrary.LoadSymbol("empty");
        //---------------------------------------------------------------------
        public static int Add(int a, int b)
        {
            Ldarg(nameof(a));
            Ldarg(nameof(b));
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_addIPtr)));
#if !DEBUG
            Tail();
#endif
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(int), new TypeRef(typeof(int)), new TypeRef(typeof(int))));
            return IL.Return<int>();
        }
        //---------------------------------------------------------------------
        public static double Add(double a, double b)
        {
            Ldarg(nameof(a));
            Ldarg(nameof(b));
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_addDPtr)));
#if !DEBUG
            Tail();
#endif
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(double), new TypeRef(typeof(double)), new TypeRef(typeof(double))));
            return IL.Return<double>();
        }
        //---------------------------------------------------------------------
        public static unsafe double VecSum(double* vec, int n)
        {
            Ldarg(nameof(vec));
            Ldarg(nameof(n));
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_vecSumPtr)));
#if !DEBUG
            Tail();
#endif
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(double), new TypeRef(typeof(double*)), new TypeRef(typeof(int))));
            return IL.Return<double>();
        }
        //---------------------------------------------------------------------
        public static void Empty()
        {
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_emptyPtr)));
#if !DEBUG
            Tail();
#endif
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(void)));
        }
    }
}
