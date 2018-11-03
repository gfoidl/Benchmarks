using System;
using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;

namespace WebEncodersBench.Benchmarks
{
    public class CalcBufferSizeToEncode
    {
        private readonly int _size;
        //---------------------------------------------------------------------
        public CalcBufferSizeToEncode()
        {
            var rnd = new Random();
            _size = rnd.Next();
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public int Base() => GetBufferSizeRequiredToUrlEncode(_size);
        //---------------------------------------------------------------------
        [Benchmark]
        public int New() => GetBufferSizeRequiredToUrlEncode1(_size);
        //---------------------------------------------------------------------
        private static int GetBufferSizeRequiredToUrlEncode(int dataLength)
        {
            return GetBufferSizeRequiredToBase64Encode(dataLength) - GetNumBase64PaddingCharsAddedByEncode(dataLength);
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static int GetBufferSizeRequiredToUrlEncode1(int dataLength)
        {
            int size = (dataLength / 3) * 4;
            int paddingChars = dataLength % 3 == 0 ? 0 : 3 - dataLength % 3;

            if (paddingChars != 0) size += 4 - paddingChars;

            return size;
        }
        //---------------------------------------------------------------------
        private static int GetNumBase64PaddingCharsAddedByEncode(int dataLength)
        {
            // Calculation is:
            // switch (dataLength % 3)
            // 0 -> 0
            // 1 -> 2
            // 2 -> 1

            return dataLength % 3 == 0 ? 0 : 3 - dataLength % 3;
        }
        //---------------------------------------------------------------------
        private static int GetBufferSizeRequiredToBase64Encode(int dataLength)
        {
            if (dataLength == 0)
            {
                return 0;
            }

            // overflow conditions are already eliminated, so 'checked' is not necessary
            var numWholeOrPartialInputBlocks = (dataLength + 2) / 3;
            return numWholeOrPartialInputBlocks * 4;
        }
    }
}
