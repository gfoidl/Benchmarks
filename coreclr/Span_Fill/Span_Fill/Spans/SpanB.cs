using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using nuint = System.UInt64;

namespace WebEncodersBench.Spans
{
    public static class SpanB
    {
        public static void Fill<T>(Span<T> span, T element)
        {
            ref T r = ref MemoryMarshal.GetReference(span);
            Fill(ref r, span.Length, element);
        }
        //---------------------------------------------------------------------
        private unsafe static void Fill<T>(ref T r, int len, T value)
        {
            nuint length = (uint)len;

            if (length == 0) return;

            if (Unsafe.SizeOf<T>() == 1)
            {
                byte fill = Unsafe.As<T, byte>(ref value);
                Unsafe.InitBlockUnaligned(ref Unsafe.As<T, byte>(ref r), fill, (uint)length);
                return;
            }

            T val = value;
            nuint i = 0;
            for (; i < (length & ~(nuint)7); i += 8)
            {
                Unsafe.Add<T>(ref r, (IntPtr)(i + 0)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 1)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 2)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 3)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 4)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 5)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 6)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 7)) = val;
            }

            if (i < (length & ~(nuint)3))
            {
                Unsafe.Add<T>(ref r, (IntPtr)(i + 0)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 1)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 2)) = val;
                Unsafe.Add<T>(ref r, (IntPtr)(i + 3)) = val;

                i += 4;
            }

            for (; i < length; ++i)
                Unsafe.Add<T>(ref r, (IntPtr)i) = val;
        }
    }
}
