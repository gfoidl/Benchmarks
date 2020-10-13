using System;
using System.IO;
using System.Runtime.InteropServices;

namespace UnmanagedCall.Load
{
    internal static partial class UnmanagedLibrary
    {
        private const string LibName = "NativeLib";
        //---------------------------------------------------------------------
        private static readonly string s_libraryName;
        private static IntPtr          s_handle;
        //---------------------------------------------------------------------
        static UnmanagedLibrary()
        {
            s_libraryName = RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
                ? $"{LibName}.dll"
                : $"./lib{LibName}.so";		// Cf. http://man7.org/linux/man-pages/man3/dlopen.3.html for /

            s_handle = LoadLibrary();

            if (s_handle == IntPtr.Zero)
            {
                string error = GetError();
                throw new IOException($"Error in loading library {s_libraryName}: {error}");
            }
        }
        //---------------------------------------------------------------------
        public static T GetNativeMethodDelegate<T>(string methodName) where T : class
        {
            IntPtr ptr = LoadSymbol(methodName);

            if (ptr == IntPtr.Zero)
                throw new MissingMethodException($"The native method '{methodName}' does not exist in '{s_libraryName}'");

            return Marshal.GetDelegateForFunctionPointer<T>(ptr);
        }
        //---------------------------------------------------------------------
        private static IntPtr LoadLibrary()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                return Windows.LoadLibrary(Path.Combine(AppContext.BaseDirectory, s_libraryName));
            }
            else
            {
                const int RTLD_LAZY   = 1;
                const int RTLD_GLOBAL = 8;

                return Linux.dlopen(s_libraryName, RTLD_GLOBAL + RTLD_LAZY);
            }
        }
        //---------------------------------------------------------------------
        internal static IntPtr LoadSymbol(string symbolName) => RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
            ? Windows.GetProcAddress(s_handle, symbolName)
            : Linux.dlsym(s_handle, symbolName);
        //---------------------------------------------------------------------
        private static void FreeLibraray()
        {
            if (s_handle == IntPtr.Zero) return;

            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                Windows.FreeLibrary(s_handle);
            }
            else
            {
                Linux.dlclose(s_handle);
            }

            s_handle = IntPtr.Zero;
        }
        //---------------------------------------------------------------------
        private static string GetError() => RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
            ? Windows.GetError()
            : Linux.dlerror();
    }
}
