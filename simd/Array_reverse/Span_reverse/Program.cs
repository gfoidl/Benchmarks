using System;
using System.Buffers.Binary;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;

#if BENCH
using BenchmarkDotNet.Running;
#endif

namespace Span_reverse
{
    class Program
    {
        static void Main(string[] args)
        {
            var bench = new Bench();
            bench.N = 169;
            bench.GlobalSetup();

            Print(bench.Data);
            Validate(bench.Data, true);

            bench.Default();
            Print(bench.Data);
            Validate(bench.Data, false);

            bench.ReverseSse();
            Print(bench.Data);
            Validate(bench.Data, true);

            bench.ReverseAvx();
            Print(bench.Data);
            Validate(bench.Data, false);
#if BENCH
            BenchmarkRunner.Run<Bench>();
#endif
        }
        //---------------------------------------------------------------------
        private static void Print(Span<byte> data)
        {
            for (int i = 0; i < data.Length; ++i)
                Console.Write($"{data[i]:00} ");
            Console.WriteLine();
        }
        //---------------------------------------------------------------------
        private static void Validate(Span<byte> data, bool ascending)
        {
            for (int i = 1; i < data.Length; ++i)
            {
                if (ascending)
                    Debug.Assert(data[i - 1] < data[i]);
                else
                    Debug.Assert(data[i - 1] > data[i]);
            }
        }
    }
    //-------------------------------------------------------------------------
    public class Bench
    {
        private byte[] _arr;
        //---------------------------------------------------------------------
        public Span<byte> Data => _arr;
        //---------------------------------------------------------------------
        [Params(10, 128, 1_000, 1_000_000)]
        public int N { get; set; } = 64;
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _arr = new byte[this.N];

            for (int i = 0; i < this.N; ++i)
                _arr[i] = (byte)i;
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void Default() => this.Data.Reverse();
        //---------------------------------------------------------------------
        [Benchmark]
        public void ReverseSse() => ReverseSse(this.Data);
        //---------------------------------------------------------------------
        [Benchmark]
        public void ReverseAvx() => ReverseAvx(this.Data);
        //---------------------------------------------------------------------
        private static ReadOnlySpan<byte> SseShuffleVec => new byte[16] { 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
        //---------------------------------------------------------------------
        private static unsafe void ReverseAvx(Span<byte> data)
        {
            if (data.Length <= 1) return;

            fixed (byte* pData = &MemoryMarshal.GetReference(data))
            {
                byte* pLower = pData;
                byte* pUpper = pData + data.Length;
                byte* pLowerHead;
                byte* pUpperHead;
                Vector128<byte> sseShuffleVec = default;

                if (Avx2.IsSupported || Ssse3.IsSupported)
                {
                    sseShuffleVec = Unsafe.ReadUnaligned<Vector128<byte>>(ref MemoryMarshal.GetReference(SseShuffleVec));
                }

                // Theshold 128 bytes found by testing, 64 bytes is the actual minimum for AVX2 operation.
                if (Avx2.IsSupported && data.Length >= 4 * Vector256<byte>.Count)
                {
                    Vector256<byte> avxShuffleVec = sseShuffleVec.ToVector256Unsafe();
                    avxShuffleVec = avxShuffleVec.WithUpper(sseShuffleVec);

                    pLowerHead = pLower + Vector256<byte>.Count;
                    pUpperHead = pUpper - Vector256<byte>.Count;

                    do
                    {
                        Vector256<byte> lower = Avx.LoadVector256(pLowerHead - Vector256<byte>.Count);
                        Vector256<byte> upper = Avx.LoadVector256(pUpperHead);

                        lower = Avx2.Shuffle(lower, avxShuffleVec);
                        upper = Avx2.Shuffle(upper, avxShuffleVec);

                        lower = Avx2.Permute2x128(lower, lower, 0x01);
                        upper = Avx2.Permute2x128(upper, upper, 0x01);

                        Avx.Store(pLowerHead - Vector256<byte>.Count, upper);
                        Avx.Store(pUpperHead, lower);

                        pLowerHead += Vector256<byte>.Count;
                        pUpperHead -= Vector256<byte>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector256<byte>.Count;
                    pUpper = pUpperHead + Vector256<byte>.Count;

                    if (pLower >= pUpper) return;
                }

                if (Ssse3.IsSupported && pUpper - pLower >= 2 * Vector128<byte>.Count)
                {
                    pLowerHead = pLower + Vector128<byte>.Count;
                    pUpperHead = pUpper - Vector128<byte>.Count;

                    do
                    {
                        Vector128<byte> lower = Sse2.LoadVector128(pLowerHead - Vector128<byte>.Count);
                        Vector128<byte> upper = Sse2.LoadVector128(pUpperHead);

                        lower = Ssse3.Shuffle(lower, sseShuffleVec);
                        upper = Ssse3.Shuffle(upper, sseShuffleVec);

                        Sse2.Store(pLowerHead - Vector128<byte>.Count, upper);
                        Sse2.Store(pUpperHead, lower);

                        pLowerHead += Vector128<byte>.Count;
                        pUpperHead -= Vector128<byte>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector128<byte>.Count;
                    pUpper = pUpperHead + Vector128<byte>.Count;

                    if (pLower >= pUpper) return;
                }

                if (Environment.Is64BitProcess && pUpper - pLower >= 2 * sizeof(ulong))
                {
                    pLowerHead = pLower + sizeof(ulong);
                    pUpperHead = pUpper - sizeof(ulong);

                    do
                    {
                        ulong lower = *(ulong*)(pLowerHead - sizeof(ulong));
                        ulong upper = *(ulong*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(ulong*)(pLowerHead - sizeof(ulong)) = upper;
                        *(ulong*)pUpperHead = lower;

                        pLowerHead += sizeof(ulong);
                        pUpperHead -= sizeof(ulong);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(ulong);
                    pUpper = pUpperHead + sizeof(ulong);

                    if (pLower >= pUpper) return;
                }

                if (pUpper - pLower >= 2 * sizeof(uint))
                {
                    pLowerHead = pLower + sizeof(uint);
                    pUpperHead = pUpper - sizeof(uint);

                    do
                    {
                        uint lower = *(uint*)(pLowerHead - sizeof(uint));
                        uint upper = *(uint*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(uint*)(pLowerHead - sizeof(uint)) = upper;
                        *(uint*)pUpperHead = lower;

                        pLowerHead += sizeof(uint);
                        pUpperHead -= sizeof(uint);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(uint);
                    pUpper = pUpperHead + sizeof(uint);

                    if (pLower >= pUpper) return;
                }

                if (pUpper - pLower >= 2 * sizeof(ushort))
                {
                    pLowerHead = pLower + sizeof(ushort);
                    pUpperHead = pUpper - sizeof(ushort);

                    do
                    {
                        ushort lower = *(ushort*)(pLowerHead - sizeof(ushort));
                        ushort upper = *(ushort*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(ushort*)(pLowerHead - sizeof(ushort)) = upper;
                        *(ushort*)pUpperHead = lower;

                        pLowerHead += sizeof(ushort);
                        pUpperHead -= sizeof(ushort);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(ushort);
                    pUpper = pUpperHead + sizeof(ushort);

                    if (pLower >= pUpper) return;
                }

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    byte lower = *pLowerHead;
                    byte upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
        //---------------------------------------------------------------------
        private static unsafe void ReverseSse(Span<byte> data)
        {
            if (data.Length <= 1) return;

            fixed (byte* pData = &MemoryMarshal.GetReference(data))
            {
                byte* pLower = pData;
                byte* pUpper = pData + data.Length;
                byte* pLowerHead;
                byte* pUpperHead;

                if (Ssse3.IsSupported && data.Length >= 2 * Vector128<byte>.Count)
                {
                    Vector128<byte> sseShuffleVec = Unsafe.ReadUnaligned<Vector128<byte>>(ref MemoryMarshal.GetReference(SseShuffleVec));

                    pLowerHead = pLower + Vector128<byte>.Count;
                    pUpperHead = pUpper - Vector128<byte>.Count;

                    do
                    {
                        Vector128<byte> lower = Sse2.LoadVector128(pLowerHead - Vector128<byte>.Count);
                        Vector128<byte> upper = Sse2.LoadVector128(pUpperHead);

                        lower = Ssse3.Shuffle(lower, sseShuffleVec);
                        upper = Ssse3.Shuffle(upper, sseShuffleVec);

                        Sse2.Store(pLowerHead - Vector128<byte>.Count, upper);
                        Sse2.Store(pUpperHead, lower);

                        pLowerHead += Vector128<byte>.Count;
                        pUpperHead -= Vector128<byte>.Count;
                    }
                    while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector128<byte>.Count;
                    pUpper = pUpperHead + Vector128<byte>.Count;

                    if (pLower == pUpper) return;
                }

                if (Environment.Is64BitProcess && pUpper - pLower >= 2 * sizeof(ulong))
                {
                    pLowerHead = pLower + sizeof(ulong);
                    pUpperHead = pUpper - sizeof(ulong);

                    do
                    {
                        ulong lower = *(ulong*)(pLowerHead - sizeof(ulong));
                        ulong upper = *(ulong*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(ulong*)(pLowerHead - sizeof(ulong)) = upper;
                        *(ulong*)pUpperHead = lower;

                        pLowerHead += sizeof(ulong);
                        pUpperHead -= sizeof(ulong);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(ulong);
                    pUpper = pUpperHead + sizeof(ulong);

                    if (pLower == pUpper) return;
                }

                if (pUpper - pLower >= 2 * sizeof(uint))
                {
                    pLowerHead = pLower + sizeof(uint);
                    pUpperHead = pUpper - sizeof(uint);

                    do
                    {
                        uint lower = *(uint*)(pLowerHead - sizeof(uint));
                        uint upper = *(uint*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(uint*)(pLowerHead - sizeof(uint)) = upper;
                        *(uint*)pUpperHead = lower;

                        pLowerHead += sizeof(uint);
                        pUpperHead -= sizeof(uint);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(uint);
                    pUpper = pUpperHead + sizeof(uint);

                    if (pLower == pUpper) return;
                }

                if (pUpper - pLower >= 2 * sizeof(ushort))
                {
                    pLowerHead = pLower + sizeof(ushort);
                    pUpperHead = pUpper - sizeof(ushort);

                    do
                    {
                        ushort lower = *(ushort*)(pLowerHead - sizeof(ushort));
                        ushort upper = *(ushort*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(ushort*)(pLowerHead - sizeof(ushort)) = upper;
                        *(ushort*)pUpperHead = lower;

                        pLowerHead += sizeof(ushort);
                        pUpperHead -= sizeof(ushort);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(ushort);
                    pUpper = pUpperHead + sizeof(ushort);

                    if (pLower == pUpper) return;
                }

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    byte lower = *pLowerHead;
                    byte upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
    }
}
