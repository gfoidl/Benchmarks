using System;
using System.ComponentModel;
using System.Runtime.InteropServices;

namespace UnmanagedCall.Load
{
    internal static partial class UnmanagedLibrary
    {
        private static class Windows
        {
            [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
            public static extern IntPtr LoadLibrary(string libraryPath);
            //-----------------------------------------------------------------
            [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
            public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
            //---------------------------------------------------------------------
            [DllImport("kernel32.dll", EntryPoint = "FreeLibrary", SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            private static extern bool FreeLibraryCore(IntPtr hModule);
            //---------------------------------------------------------------------
            public static void FreeLibrary(IntPtr hModule)
            {
                if (!FreeLibraryCore(hModule))
                    throw new Win32Exception(Marshal.GetLastWin32Error());
            }
            //-----------------------------------------------------------------
            public static string GetError()
            {
                //return Marshal.GetLastWin32Error().ToString();
                return new Win32Exception(Marshal.GetLastWin32Error()).Message;
            }
        }
    }
}
