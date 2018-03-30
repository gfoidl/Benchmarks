using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace WebEncodersBench.Spans
{
    public static class SpanA
    {
        public static void Fill<T>(Span<T> span, T element)
        {
            ref T r = ref MemoryMarshal.GetReference(span);
            Fill(ref r, span.Length, element);
        }
        //---------------------------------------------------------------------
        private static void Fill<T>(ref T r, int length, T value)
        {
            if (length == 0) return;

            if (Unsafe.SizeOf<T>() == 1)
            {
                byte fill = Unsafe.As<T, byte>(ref value);
                Unsafe.InitBlockUnaligned(ref Unsafe.As<T, byte>(ref r), fill, (uint)length);
                return;
            }

            int i = 0;
            for (; i < (length & ~7); i += 8)
            {
                Unsafe.Add<T>(ref r, i + 0) = value;
                Unsafe.Add<T>(ref r, i + 1) = value;
                Unsafe.Add<T>(ref r, i + 2) = value;
                Unsafe.Add<T>(ref r, i + 3) = value;
                Unsafe.Add<T>(ref r, i + 4) = value;
                Unsafe.Add<T>(ref r, i + 5) = value;
                Unsafe.Add<T>(ref r, i + 6) = value;
                Unsafe.Add<T>(ref r, i + 7) = value;
            }

            if (i < (length & ~3))
            {
                Unsafe.Add<T>(ref r, i + 0) = value;
                Unsafe.Add<T>(ref r, i + 1) = value;
                Unsafe.Add<T>(ref r, i + 2) = value;
                Unsafe.Add<T>(ref r, i + 3) = value;

                i += 4;
            }

            for (; i < length; ++i)
                Unsafe.Add<T>(ref r, i) = value;
        }
    }
}
