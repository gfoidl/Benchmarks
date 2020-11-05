using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace gfoidl.Numerics
{
    internal static class Helpers
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static uint GetStride(uint rows, uint align)
        {
            Debug.Assert(align.IsPowerOfTwo());

            if (align < sizeof(double))
            {
                align = sizeof(double);
            }

            align /= sizeof(double);

            // final % is necessary. E.g. for align=32 bytes and rows=4
            // the padding would be 4 w/o the final %.

            uint elementsToNextAlignment = align - (rows & (align - 1));
            uint padding                 = elementsToNextAlignment & (align - 1);

            return rows + padding;
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static unsafe double* AlignPointer(double* ptr, uint align)
        {
            Debug.Assert(align.IsPowerOfTwo());

            nuint address         = (nuint)ptr;
            nuint unalignedBytes  = address & (align - 1);      // bithack for % 
            nuint bytesToAlign    = ((nuint)align - unalignedBytes) & (align - 1);
            nuint elementsToAlign = bytesToAlign / sizeof(double);
            ptr                  += elementsToAlign;

            Debug.Assert((long)ptr % align == 0);

            return ptr;
        }
        //---------------------------------------------------------------------
        public static bool IsPowerOfTwo(this uint x)
        {
            Debug.Assert(x > 0);

            return (x & (x - 1)) == 0;
        }
    }
}
