using System;
using System.Runtime.InteropServices;
using InlineIL;
using static InlineIL.IL.Emit;

namespace UnmanagedCall.Load
{
    internal static class Calli
    {
        public static readonly IntPtr s_addIPtr;
        public static readonly IntPtr s_addDPtr;
        public static readonly IntPtr s_vecSumPtr;
        public static readonly IntPtr s_emptyPtr;
        //---------------------------------------------------------------------
        static Calli()
        {
            s_addIPtr   = UnmanagedLibrary.LoadSymbol("add_i");
            s_addDPtr   = UnmanagedLibrary.LoadSymbol("add_d");
            s_vecSumPtr = UnmanagedLibrary.LoadSymbol("vec_sum");
            s_emptyPtr  = UnmanagedLibrary.LoadSymbol("empty");
        }
        //---------------------------------------------------------------------
        public static int Add(int a, int b)
        {
            Ldarg(nameof(a));
            Ldarg(nameof(b));
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_addIPtr)));
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(int), new TypeRef(typeof(int)), new TypeRef(typeof(int))));
            return IL.Return<int>();
        }
        //---------------------------------------------------------------------
        public static double Add(double a, double b)
        {
            Ldarg(nameof(a));
            Ldarg(nameof(b));
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_addDPtr)));
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(double), new TypeRef(typeof(double)), new TypeRef(typeof(double))));
            return IL.Return<double>();
        }
        //---------------------------------------------------------------------
        public static unsafe double VecSum(double* vec, int n)
        {
            Ldarg(nameof(vec));
            Ldarg(nameof(n));
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_vecSumPtr)));
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(double), new TypeRef(typeof(double*)), new TypeRef(typeof(int))));
            return IL.Return<double>();
        }
        //---------------------------------------------------------------------
        public static void Empty()
        {
            Ldsfld(new FieldRef(typeof(Calli), nameof(s_emptyPtr)));
            Calli(new StandAloneMethodSig(CallingConvention.Cdecl, typeof(void)));
        }
    }
}
