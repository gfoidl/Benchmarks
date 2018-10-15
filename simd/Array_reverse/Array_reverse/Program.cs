using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace Array_reverse
{
    class Program
    {
        static void Main(string[] args)
        {
            var bench = new Bench();
            bench.N = 32;
            bench.GlobalSetup();

            Print(bench.Arr);
            Validate(bench.Arr, true);

            bench.Sequential();
            Print(bench.Arr);
            Validate(bench.Arr, false);

            bench.Sequential_2();
            Print(bench.Arr);
            Validate(bench.Arr, true);

            bench.Simd_Sse2();
            Print(bench.Arr);
            Validate(bench.Arr, false);

            bench.Simd_Sse2_CacheLine();
            Print(bench.Arr);
            Validate(bench.Arr, true);
#if !DEBUG
            BenchmarkRunner.Run<Bench>();
#endif
        }
        //---------------------------------------------------------------------
        private static void Print(int[] arr)
        {
            for (int i = 0; i < arr.Length; ++i)
                Console.Write($"{arr[i]} ");
            Console.WriteLine();
        }
        //---------------------------------------------------------------------
        private static void Validate(int[] arr, bool ascending)
        {
            for (int i = 1; i < arr.Length; ++i)
            {
                if (ascending)
                    Debug.Assert(arr[i - 1] < arr[i]);
                else
                    Debug.Assert(arr[i - 1] > arr[i]);
            }
        }
    }
    //-------------------------------------------------------------------------
    public class Bench
    {
        private int[] _arr;
        //---------------------------------------------------------------------
        public int[] Arr => _arr;
        //---------------------------------------------------------------------
        [Params(10, 1_000, 1_000_000)]
        public int N { get; set; }
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _arr = new int[this.N];

            for (int i = 0; i < N; ++i)
                _arr[i] = i;
        }
        //---------------------------------------------------------------------
        //[Benchmark]
        public void Sequential() => Reverse(_arr);
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void Sequential_2() => Reverse_2(_arr);
        //---------------------------------------------------------------------
        [Benchmark]
        public void Simd_Sse2() => ReverseSse2(_arr);
        //---------------------------------------------------------------------
        [Benchmark]
        public void Simd_Sse2_CacheLine() => ReverseSse2_CacheLine(_arr);
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.NoInlining)]
        private static unsafe void Reverse(int[] arr)
        {
            fixed (int* ptr = arr)
            {
                int* start = ptr;
                int* end = ptr + arr.Length - 1;

                while (start < end)
                {
                    int c = *start;
                    *start = *end;
                    *end = c;

                    start++;
                    end--;
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.NoInlining)]
        private static void Reverse_2(int[] arr)
        {
            ref int start = ref arr[0];
            ref int end = ref Unsafe.Add(ref start, arr.Length - 1);

            while (Unsafe.IsAddressLessThan(ref start, ref end))
            {
                int c = start;
                start = end;
                end = c;

                start = ref Unsafe.Add(ref start, 1);
                end = ref Unsafe.Subtract(ref end, 1);
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.NoInlining)]
        private static void ReverseSse2(int[] arr)
        {
            const int sseIntElements = 128 / 8 / sizeof(int);

            ref int start = ref arr[0];
            ref int end = ref Unsafe.Add(ref start, arr.Length - 1);

            ref int sseEnd = ref Unsafe.Add(ref end, -sseIntElements + 1);
            while (Unsafe.IsAddressLessThan(ref start, ref sseEnd))
            {
                ref Vector128<int> s = ref Unsafe.As<int, Vector128<int>>(ref start);
                ref Vector128<int> e = ref Unsafe.As<int, Vector128<int>>(ref sseEnd);

                Vector128<int> sRev = Sse2.Shuffle(s, 0x1B);
                Vector128<int> eRev = Sse2.Shuffle(e, 0x1B);

                s = eRev;
                e = sRev;

                start = ref Unsafe.Add(ref start, sseIntElements);
                sseEnd = ref Unsafe.Subtract(ref sseEnd, sseIntElements);
            }
            end = ref Unsafe.Add(ref sseEnd, sseIntElements - 1);

            while (Unsafe.IsAddressLessThan(ref start, ref end))
            {
                int c = start;
                start = end;
                end = c;

                start = ref Unsafe.Add(ref start, 1);
                end = ref Unsafe.Subtract(ref end, 1);
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.NoInlining)]
        private static void ReverseSse2_CacheLine(int[] arr)
        {
            const int sseIntElements = 128 / 8 / sizeof(int);

            ref int start = ref arr[0];
            ref int end = ref Unsafe.Add(ref start, arr.Length - 1);

            ref int sseEnd = ref Unsafe.Add(ref end, -4 * sseIntElements + 1);
            while (Unsafe.IsAddressLessThan(ref start, ref sseEnd))
            {
                // A whole cache line (64 bytes)
                ref Vector128<int> s0 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref start, 0 * sseIntElements));
                ref Vector128<int> s1 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref start, 1 * sseIntElements));
                ref Vector128<int> s2 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref start, 2 * sseIntElements));
                ref Vector128<int> s3 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref start, 3 * sseIntElements));

                ref Vector128<int> e0 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref sseEnd, 0 * sseIntElements));
                ref Vector128<int> e1 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref sseEnd, 1 * sseIntElements));
                ref Vector128<int> e2 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref sseEnd, 2 * sseIntElements));
                ref Vector128<int> e3 = ref Unsafe.As<int, Vector128<int>>(ref Unsafe.Add(ref sseEnd, 3 * sseIntElements));

                Vector128<int> sRev0 = Sse2.Shuffle(s0, 0x1B);
                Vector128<int> sRev1 = Sse2.Shuffle(s1, 0x1B);
                Vector128<int> sRev2 = Sse2.Shuffle(s2, 0x1B);
                Vector128<int> sRev3 = Sse2.Shuffle(s3, 0x1B);

                Vector128<int> eRev0 = Sse2.Shuffle(e0, 0x1B);
                Vector128<int> eRev1 = Sse2.Shuffle(e1, 0x1B);
                Vector128<int> eRev2 = Sse2.Shuffle(e2, 0x1B);
                Vector128<int> eRev3 = Sse2.Shuffle(e3, 0x1B);

                s0 = eRev3;
                s1 = eRev2;
                s2 = eRev1;
                s3 = eRev0;

                e0 = sRev3;
                e1 = sRev2;
                e2 = sRev1;
                e3 = sRev0;

                start = ref Unsafe.Add(ref start, 4 * sseIntElements);
                sseEnd = ref Unsafe.Subtract(ref sseEnd, 4 * sseIntElements);
            }
            end = ref Unsafe.Add(ref sseEnd, 4 * sseIntElements - 1);

            sseEnd = ref Unsafe.Add(ref end, -sseIntElements + 1);
            while (Unsafe.IsAddressLessThan(ref start, ref sseEnd))
            {
                ref Vector128<int> s = ref Unsafe.As<int, Vector128<int>>(ref start);
                ref Vector128<int> e = ref Unsafe.As<int, Vector128<int>>(ref sseEnd);

                Vector128<int> sRev = Sse2.Shuffle(s, 0x1B);
                Vector128<int> eRev = Sse2.Shuffle(e, 0x1B);

                s = eRev;
                e = sRev;

                start = ref Unsafe.Add(ref start, sseIntElements);
                sseEnd = ref Unsafe.Subtract(ref sseEnd, sseIntElements);
            }
            end = ref Unsafe.Add(ref sseEnd, sseIntElements - 1);

            while (Unsafe.IsAddressLessThan(ref start, ref end))
            {
                int c = start;
                start = end;
                end = c;

                start = ref Unsafe.Add(ref start, 1);
                end = ref Unsafe.Subtract(ref end, 1);
            }
        }
    }
}
