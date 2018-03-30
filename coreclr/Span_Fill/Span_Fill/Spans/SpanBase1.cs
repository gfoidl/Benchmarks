using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using nuint = System.UInt64;

namespace WebEncodersBench.Spans
{
    public static class SpanBase1
    {
        public static void Fill<T>(Span<T> span, T element)
        {
            ref T r = ref MemoryMarshal.GetReference(span);
            Fill(ref r, span.Length, element);
        }
        //---------------------------------------------------------------------
        private static void Fill<T>(ref T r, int len, T value)
        {
            if (Unsafe.SizeOf<T>() == 1)
            {
                uint length = (uint)len;
                if (length == 0)
                    return;

                T tmp = value; // Avoid taking address of the "value" argument. It would regress performance of the loop below.
                Unsafe.InitBlockUnaligned(ref Unsafe.As<T, byte>(ref r), Unsafe.As<T, byte>(ref tmp), length);
            }
            else
            {
                // Do all math as nuint to avoid unnecessary 64->32->64 bit integer truncations
                nuint length = (uint)len;
                if (length == 0)
                    return;

                // TODO: Create block fill for value types of power of two sizes e.g. 2,4,8,16

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
                    Unsafe.AddByteOffset<T>(ref r, (IntPtr)(i * elementSize)) = value;
            }
        }
    }
}
