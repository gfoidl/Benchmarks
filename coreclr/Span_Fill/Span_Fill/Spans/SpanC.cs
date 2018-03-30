using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using nuint = System.UInt64;

namespace WebEncodersBench.Spans
{
    public static class SpanC
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
                ref T tmp = ref Unsafe.Add<T>(ref r, (IntPtr)i);

                Unsafe.Add<T>(ref tmp, 0) = val;
                Unsafe.Add<T>(ref tmp, 1) = val;
                Unsafe.Add<T>(ref tmp, 2) = val;
                Unsafe.Add<T>(ref tmp, 3) = val;
                Unsafe.Add<T>(ref tmp, 4) = val;
                Unsafe.Add<T>(ref tmp, 5) = val;
                Unsafe.Add<T>(ref tmp, 6) = val;
                Unsafe.Add<T>(ref tmp, 7) = val;
            }

            if (i < (length & ~(nuint)3))
            {
                ref T tmp = ref Unsafe.Add<T>(ref r, (IntPtr)i);

                Unsafe.Add<T>(ref tmp, 0) = val;
                Unsafe.Add<T>(ref tmp, 1) = val;
                Unsafe.Add<T>(ref tmp, 2) = val;
                Unsafe.Add<T>(ref tmp, 3) = val;

                i += 4;
            }

            for (; i < length; ++i)
                Unsafe.Add<T>(ref r, (IntPtr)i) = val;
        }
    }
}
