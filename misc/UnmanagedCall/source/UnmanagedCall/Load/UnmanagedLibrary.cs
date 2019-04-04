using System;
using System.IO;
using System.Runtime.InteropServices;

namespace UnmanagedCall.Load
{
    internal static partial class UnmanagedLibrary
    {
        private const string LibName = "NativeLib";
        //---------------------------------------------------------------------
        private static readonly string _libraryName;
        private static IntPtr _handle;
        //---------------------------------------------------------------------
        static UnmanagedLibrary()
        {
            _libraryName = RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
                ? $"{LibName}.dll"
                : $"./lib{LibName}.so";     // Cf. http://man7.org/linux/man-pages/man3/dlopen.3.html for /

            _handle = LoadLibrary();

            if (_handle == IntPtr.Zero)
            {
                string error = GetError();
                throw new IOException($"Error in loading library {_libraryName}: {error}");
            }
        }
        //---------------------------------------------------------------------
        public static T GetNativeMethodDelegate<T>(string methodName) where T : class
        {
            IntPtr ptr = LoadSymbol(methodName);

            if (ptr == IntPtr.Zero)
                throw new MissingMethodException($"The native method '{methodName}' does not exist in '{_libraryName}'");

            return Marshal.GetDelegateForFunctionPointer<T>(ptr);
        }
        //---------------------------------------------------------------------
        private static IntPtr LoadLibrary()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                return Windows.LoadLibrary(Path.Combine(AppContext.BaseDirectory, _libraryName));
            else
            {
                const int RTLD_LAZY   = 1;
                const int RTLD_GLOBAL = 8;

                return Linux.dlopen(_libraryName, RTLD_GLOBAL + RTLD_LAZY);
            }
        }
        //---------------------------------------------------------------------
        internal static IntPtr LoadSymbol(string symbolName)
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                return Windows.GetProcAddress(_handle, symbolName);
            else
                return Linux.dlsym(_handle, symbolName);
        }
        //---------------------------------------------------------------------
        private static void FreeLibraray()
        {
            if (_handle == IntPtr.Zero) return;

            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                Windows.FreeLibrary(_handle);
            else
                Linux.dlclose(_handle);

            _handle = IntPtr.Zero;
        }
        //---------------------------------------------------------------------
        private static string GetError()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                return Windows.GetError();
            else
                return Linux.dlerror();
        }
    }
}
