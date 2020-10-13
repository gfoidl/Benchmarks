using System;
using System.Runtime.InteropServices;

namespace UnmanagedCall.Load
{
    internal static partial class UnmanagedLibrary
    {
        private static class Linux
        {
            /*
             * Possible values are when the *.so resides next the app
             * libdl
             * libdl.so
             */
            private const string LIB = "libdl";
            //-----------------------------------------------------------------
            [DllImport(LIB, CharSet = CharSet.Unicode)]
            public static extern IntPtr dlopen(string libraryPath, int flags);
            //-----------------------------------------------------------------
            [DllImport(LIB, CharSet = CharSet.Unicode)]
            public static extern IntPtr dlsym(IntPtr handle, string symbol);
            //---------------------------------------------------------------------
            [DllImport(LIB)]
            public static extern void dlclose(IntPtr handle);
            //-----------------------------------------------------------------
            [DllImport(LIB, CharSet = CharSet.Unicode)]
            [return: MarshalAs(UnmanagedType.LPStr)]
            public static extern string dlerror();
        }
    }
}
