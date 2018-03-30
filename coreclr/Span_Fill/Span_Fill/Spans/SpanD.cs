using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using nuint = System.UInt64;

namespace WebEncodersBench.Spans
{
    public static class SpanD
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
            nuint elementSize = (nuint)Unsafe.SizeOf<T>();
            nuint i = 0;
            for (; i < (length & ~(nuint)7); i += 8)
            {
                ref T tmp = ref Unsafe.AddByteOffset<T>(ref r, (IntPtr)(i * elementSize));

                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(0 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(1 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(2 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(3 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(4 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(5 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(6 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(7 * elementSize)) = value;
            }

            if (i < (length & ~(nuint)3))
            {
                ref T tmp = ref Unsafe.AddByteOffset<T>(ref r, (IntPtr)(i * elementSize));

                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(0 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(1 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(2 * elementSize)) = value;
                Unsafe.AddByteOffset<T>(ref tmp, (IntPtr)(3 * elementSize)) = value;

                i += 4;
            }

            for (; i < length; ++i)
                Unsafe.Add<T>(ref r, (IntPtr)i) = val;
        }
    }
}
