//#define BENCH_CUSTOM_CONFIG
//-----------------------------------------------------------------------------
using System;
using System.Buffers.Binary;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;

#if BENCH_CUSTOM_CONFIG
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
#endif

#if BENCH
using BenchmarkDotNet.Running;
#endif

namespace Span_reverse
{
    class Program
    {
        static void Main(string[] args)
        {
            var bench = new Bench<char>();
            bench.N = 35;
            bench.GlobalSetup();
            bool ascending = true;

            Print(bench.Data, ascending);

            ascending = !ascending;
            bench.Default();
            Print(bench.Data, ascending);

            ascending = !ascending;
            bench.ReverseVectorized();
            Print(bench.Data, ascending);
#if BENCH
            //BenchmarkRunner.Run<Bench>();
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
            //BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).RunAllJoined();
#endif
        }
        //---------------------------------------------------------------------
        private static void Print<T>(Span<T> data, bool ascending) where T : IComparable<T>
        {
            Console.Write($"{data[0]:00} ");

            for (int i = 1; i < data.Length; ++i)
            {
                int cmp = data[i - 1].CompareTo(data[i]);
                bool success = ascending
                    ? cmp < 0
                    : cmp > 0;

                if (!success)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Environment.ExitCode = 1;
                }

                Console.Write($"{data[i]:00} ");

                if (!success) Console.ResetColor();
            }
            Console.WriteLine();
        }
    }
    //-------------------------------------------------------------------------
#if BENCH_CUSTOM_CONFIG
    public class HWCustomConfig : ManualConfig
    {
        private const string EnableAVX = "COMPlus_EnableAVX";
        private const string EnableSSE = "COMPlus_EnableSSE";
        //---------------------------------------------------------------------
        public HWCustomConfig()
        {
            this.Add(Job.Default.WithId("AVX2"));

            this.Add(Job.Default
                .With(new[] { new EnvironmentVariable(EnableAVX, "0") })
                .WithId("SSSE3"));

            this.Add(Job.Default
                .With(new[] { new EnvironmentVariable(EnableSSE, "0") })
                .WithId("Scalar"));
        }
    }
#endif
    //-------------------------------------------------------------------------
    //[ShortRunJob]
#if BENCH_CUSTOM_CONFIG
    [Config(typeof(HWCustomConfig))]
#endif
    [GenericTypeArguments(typeof(byte))]
    [GenericTypeArguments(typeof(short))]
    [GenericTypeArguments(typeof(int))]
    [GenericTypeArguments(typeof(long))]
    [GenericTypeArguments(typeof(Size16))]
    [GenericTypeArguments(typeof(Size32))]
    [GenericTypeArguments(typeof(string))]
    public class Bench<T>
    {
        private T[] _arr;
        //---------------------------------------------------------------------
        public Span<T> Data => _arr;
        //---------------------------------------------------------------------
        [Params(2, 10, 128, 1_000, 1_000_000)]
        public int N { get; set; } = 1_000;
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _arr = new T[this.N];

            if (typeof(T) == typeof(Size16))
            {
                for (int i = 0; i < 2 * this.N; i += 2)
                {
                    int j = i;
                    var size16 = new Size16
                    {
                        A = j,
                        B = j + 1
                    };
                    _arr[i / 2] = (T)(object)size16;
                }
            }
            else if (typeof(T) == typeof(Size32))
            {
                for (int i = 0; i < 4 * this.N; i += 4)
                {
                    int j = i;
                    var a = new Size16
                    {
                        A = j,
                        B = j + 1
                    };
                    var b = new Size16
                    {
                        A = j + 2,
                        B = j + 3
                    };
                    var size32 = new Size32
                    {
                        A = a,
                        B = b
                    };

                    _arr[i / 4] = (T)(object)size32;
                }
            }
            else if (typeof(T) == typeof(string))
            {
                for (int i = 0; i < this.N; ++i)
                {
                    int j = i;
                    string s = j.ToString();
                    _arr[i] = (T)(object)s;
                }
            }
            else if (typeof(T) == typeof(char))
            {
                const string data = "0123456789abcdefghijklmnopqrstuvwxyz";

                for (int i = 0; i < this.N; ++i)
                {
                    int j = i % data.Length;
                    char c = data[j];
                    _arr[i] = (T)(object)c;
                }
            }
            else
            {
                for (int i = 0; i < this.N; ++i)
                {
                    //int j = i + 300;
                    int j = i;
                    _arr[i] = Unsafe.As<int, T>(ref j);
                }
            }
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Default() => this.Data.Reverse();
        //---------------------------------------------------------------------
        [Benchmark]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public void ReverseVectorized() => ReverseVectorized(this.Data);
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void ReverseVectorized(Span<T> data)
        {
            Debug.Assert(Unsafe.SizeOf<Size16>() == 16);

            int length = data.Length;

            if (length <= 1) return;

            if (Unsafe.SizeOf<T>() == sizeof(byte))
            {
                ReverseVectorized(ref Unsafe.As<T, byte>(ref MemoryMarshal.GetReference(data)), length);
            }
            else if (Unsafe.SizeOf<T>() == sizeof(short))
            {
                ReverseVectorized(ref Unsafe.As<T, short>(ref MemoryMarshal.GetReference(data)), length);
            }
            else if (Unsafe.SizeOf<T>() == sizeof(int))
            {
                ReverseVectorized(ref Unsafe.As<T, int>(ref MemoryMarshal.GetReference(data)), length);
            }
            else if (Unsafe.SizeOf<T>() == sizeof(long))
            {
                ReverseVectorized(ref Unsafe.As<T, long>(ref MemoryMarshal.GetReference(data)), length);
            }
            else if (Unsafe.SizeOf<T>() == Unsafe.SizeOf<Vector128<byte>>())
            {
                ReverseVectorized(ref Unsafe.As<T, Vector128<byte>>(ref MemoryMarshal.GetReference(data)), length);
            }
            else if (Unsafe.SizeOf<T>() == Unsafe.SizeOf<Vector256<byte>>())
            {
                ReverseVectorized(ref Unsafe.As<T, Vector256<byte>>(ref MemoryMarshal.GetReference(data)), length);
            }
            else
            {
                Reverse(ref MemoryMarshal.GetReference(data), length);
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static void Reverse(ref T data, int length)
        {
            ref T first = ref data;
            ref T last = ref Unsafe.Add(ref Unsafe.Add(ref first, length), -1);

            do
            {
                T temp = first;
                first = last;
                last = temp;

                first = ref Unsafe.Add(ref first, 1);
                last = ref Unsafe.Subtract(ref last, 1);
            } while (Unsafe.IsAddressLessThan(ref first, ref last));
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static unsafe void ReverseVectorized(ref byte data, int length)
        {
            fixed (byte* pData = &data)
            {
                byte* pLower = pData;
                byte* pUpper = pData + length;
                byte* pLowerHead;
                byte* pUpperHead;
                Vector128<byte> sseShuffleVec = default;

                if (Avx2.IsSupported || Ssse3.IsSupported)
                {
                    ReadOnlySpan<byte> sseShuffleVecData = new byte[16] { 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
                    sseShuffleVec = Unsafe.ReadUnaligned<Vector128<byte>>(ref MemoryMarshal.GetReference(sseShuffleVecData));
                }

                // Theshold 128 bytes found by testing, 64 bytes is the actual minimum for AVX2 operation.
                if (Avx2.IsSupported && length >= 4 * Vector256<byte>.Count)
                {
                    Vector256<byte> avxShuffleVec = Vector256.Create(sseShuffleVec, sseShuffleVec);

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

                if (pUpper - pLower >= 2 * sizeof(short))
                {
                    pLowerHead = pLower + sizeof(short);
                    pUpperHead = pUpper - sizeof(short);

                    do
                    {
                        short lower = *(short*)(pLowerHead - sizeof(short));
                        short upper = *(short*)pUpperHead;

                        lower = BinaryPrimitives.ReverseEndianness(lower);
                        upper = BinaryPrimitives.ReverseEndianness(upper);

                        *(short*)(pLowerHead - sizeof(short)) = upper;
                        *(short*)pUpperHead = lower;

                        pLowerHead += sizeof(short);
                        pUpperHead -= sizeof(short);
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - sizeof(short);
                    pUpper = pUpperHead + sizeof(short);

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
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static unsafe void ReverseVectorized(ref short data, int length)
        {
            fixed (short* pData = &data)
            {
                short* pLower = pData;
                short* pUpper = pData + length;
                short* pLowerHead;
                short* pUpperHead;
                Vector128<byte> sseShuffleVec = default;

                if (Avx2.IsSupported || Ssse3.IsSupported)
                {
                    ReadOnlySpan<byte> sseShuffleVecData = new byte[16] { 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 };
                    sseShuffleVec = Unsafe.ReadUnaligned<Vector128<byte>>(ref MemoryMarshal.GetReference(sseShuffleVecData));
                }

                if (Avx2.IsSupported && length >= 2 * Vector256<short>.Count)
                {
                    Vector256<byte> avxShuffleVec = Vector256.Create(sseShuffleVec, sseShuffleVec);

                    pLowerHead = pLower + Vector256<short>.Count;
                    pUpperHead = pUpper - Vector256<short>.Count;

                    do
                    {
                        Vector256<short> lower = Avx.LoadVector256(pLowerHead - Vector256<short>.Count);
                        Vector256<short> upper = Avx.LoadVector256(pUpperHead);

                        lower = Avx2.Shuffle(lower.AsByte(), avxShuffleVec).AsInt16();
                        upper = Avx2.Shuffle(upper.AsByte(), avxShuffleVec).AsInt16();

                        lower = Avx2.Permute2x128(lower, lower, 0x01);
                        upper = Avx2.Permute2x128(upper, upper, 0x01);

                        Avx.Store(pLowerHead - Vector256<short>.Count, upper);
                        Avx.Store(pUpperHead, lower);

                        pLowerHead += Vector256<short>.Count;
                        pUpperHead -= Vector256<short>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector256<short>.Count;
                    pUpper = pUpperHead + Vector256<short>.Count;

                    if (pLower >= pUpper) return;
                }

                // cast to byte* to get better codegen, note: also the Vector128 has to be byte then
                if (Ssse3.IsSupported && (byte*)pUpper - (byte*)pLower >= 2 * Vector128<byte>.Count)
                {
                    pLowerHead = pLower + Vector128<short>.Count;
                    pUpperHead = pUpper - Vector128<short>.Count;

                    do
                    {
                        Vector128<short> lower = Sse2.LoadVector128(pLowerHead - Vector128<short>.Count);
                        Vector128<short> upper = Sse2.LoadVector128(pUpperHead);

                        lower = Ssse3.Shuffle(lower.AsByte(), sseShuffleVec).AsInt16();
                        upper = Ssse3.Shuffle(upper.AsByte(), sseShuffleVec).AsInt16();

                        Sse2.Store(pLowerHead - Vector128<short>.Count, upper);
                        Sse2.Store(pUpperHead, lower);

                        pLowerHead += Vector128<short>.Count;
                        pUpperHead -= Vector128<short>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector128<short>.Count;
                    pUpper = pUpperHead + Vector128<short>.Count;

                    if (pLower >= pUpper) return;
                }

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    short lower = *pLowerHead;
                    short upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static unsafe void ReverseVectorized(ref int data, int length)
        {
            fixed (int* pData = &data)
            {
                int* pLower = pData;
                int* pUpper = pData + length;
                int* pLowerHead;
                int* pUpperHead;

                if (Avx2.IsSupported && length >= 2 * Vector256<int>.Count)
                {
                    pLowerHead = pLower + Vector256<int>.Count;
                    pUpperHead = pUpper - Vector256<int>.Count;

                    do
                    {
                        Vector256<int> lower = Avx.LoadVector256(pLowerHead - Vector256<int>.Count);
                        Vector256<int> upper = Avx.LoadVector256(pUpperHead);

                        lower = Avx2.Shuffle(lower, 0x1B);
                        upper = Avx2.Shuffle(upper, 0x1B);

                        lower = Avx2.Permute2x128(lower, lower, 0x01);
                        upper = Avx2.Permute2x128(upper, upper, 0x01);

                        Avx.Store(pLowerHead - Vector256<int>.Count, upper);
                        Avx.Store(pUpperHead, lower);

                        pLowerHead += Vector256<int>.Count;
                        pUpperHead -= Vector256<int>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector256<int>.Count;
                    pUpper = pUpperHead + Vector256<int>.Count;

                    if (pLower >= pUpper) return;
                }

                // cast to byte* to get better codegen, note: also the Vector128 has to be byte then
                if (Sse2.IsSupported && (byte*)pUpper - (byte*)pLower >= 2 * Vector128<byte>.Count)
                {
                    pLowerHead = pLower + Vector128<int>.Count;
                    pUpperHead = pUpper - Vector128<int>.Count;

                    do
                    {
                        Vector128<int> lower = Sse2.LoadVector128(pLowerHead - Vector128<int>.Count);
                        Vector128<int> upper = Sse2.LoadVector128(pUpperHead);

                        lower = Sse2.Shuffle(lower, 0x1B);
                        upper = Sse2.Shuffle(upper, 0x1B);

                        Sse2.Store(pLowerHead - Vector128<int>.Count, upper);
                        Sse2.Store(pUpperHead, lower);

                        pLowerHead += Vector128<int>.Count;
                        pUpperHead -= Vector128<int>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector128<int>.Count;
                    pUpper = pUpperHead + Vector128<int>.Count;

                    if (pLower >= pUpper) return;
                }

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    int lower = *pLowerHead;
                    int upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static unsafe void ReverseVectorized(ref long data, int length)
        {
            fixed (long* pData = &data)
            {
                long* pLower = pData;
                long* pUpper = pData + length;
                long* pLowerHead;
                long* pUpperHead;

                if (Avx2.IsSupported && length >= 2 * Vector256<long>.Count)
                {
                    pLowerHead = pLower + Vector256<long>.Count;
                    pUpperHead = pUpper - Vector256<long>.Count;

                    do
                    {
                        Vector256<long> lower = Avx.LoadVector256(pLowerHead - Vector256<long>.Count);
                        Vector256<long> upper = Avx.LoadVector256(pUpperHead);

                        lower = Avx2.AlignRight(lower, lower, sizeof(long));
                        upper = Avx2.AlignRight(upper, upper, sizeof(long));

                        lower = Avx2.Permute2x128(lower, lower, 0x01);
                        upper = Avx2.Permute2x128(upper, upper, 0x01);

                        Avx.Store(pLowerHead - Vector256<long>.Count, upper);
                        Avx.Store(pUpperHead, lower);

                        pLowerHead += Vector256<long>.Count;
                        pUpperHead -= Vector256<long>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector256<long>.Count;
                    pUpper = pUpperHead + Vector256<long>.Count;

                    if (pLower >= pUpper) return;
                }

                // cast to byte* to get better codegen, note: also the Vector128 has to be byte then
                if (Ssse3.IsSupported && (byte*)pUpper - (byte*)pLower >= 2 * Vector128<byte>.Count)
                {
                    pLowerHead = pLower + Vector128<long>.Count;
                    pUpperHead = pUpper - Vector128<long>.Count;

                    do
                    {
                        Vector128<long> lower = Sse2.LoadVector128(pLowerHead - Vector128<long>.Count);
                        Vector128<long> upper = Sse2.LoadVector128(pUpperHead);

                        lower = Ssse3.AlignRight(lower, lower, sizeof(long));
                        upper = Ssse3.AlignRight(upper, upper, sizeof(long));

                        Sse2.Store(pLowerHead - Vector128<long>.Count, upper);
                        Sse2.Store(pUpperHead, lower);

                        pLowerHead += Vector128<long>.Count;
                        pUpperHead -= Vector128<long>.Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - Vector128<long>.Count;
                    pUpper = pUpperHead + Vector128<long>.Count;

                    if (pLower >= pUpper) return;
                }

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    long lower = *pLowerHead;
                    long upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static unsafe void ReverseVectorized(ref Vector128<byte> data, int length)
        {
            fixed (Vector128<byte>* pData = &data)
            {
                Vector128<byte>* pLower = pData;
                Vector128<byte>* pUpper = pData + length;
                Vector128<byte>* pLowerHead;
                Vector128<byte>* pUpperHead;

                // Vector256<Vector128<byte>>.Count, but Vector128<byte> is not supported as type argument for Vector256
                const int vector256Size16Count = 256 / 8 / 16;

                if (Avx2.IsSupported && length >= 2 * vector256Size16Count)
                {
                    pLowerHead = pLower + vector256Size16Count;
                    pUpperHead = pUpper - vector256Size16Count;

                    do
                    {
                        Vector256<long> lower = Avx.LoadVector256((long*)(pLowerHead - vector256Size16Count));
                        Vector256<long> upper = Avx.LoadVector256((long*)pUpperHead);

                        lower = Avx2.Permute2x128(lower, lower, 0x01);
                        upper = Avx2.Permute2x128(upper, upper, 0x01);

                        Avx.Store((long*)(pLowerHead - vector256Size16Count), upper);
                        Avx.Store((long*)pUpperHead, lower);

                        pLowerHead += vector256Size16Count;
                        pUpperHead -= vector256Size16Count;
                    } while (pLowerHead <= pUpperHead);

                    pLower = pLowerHead - vector256Size16Count;
                    pUpper = pUpperHead + vector256Size16Count;

                    if (pLower >= pUpper) return;
                }

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    Vector128<byte> lower = *pLowerHead;
                    Vector128<byte> upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
        //---------------------------------------------------------------------
        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        private static unsafe void ReverseVectorized(ref Vector256<byte> data, int length)
        {
            fixed (Vector256<byte>* pData = &data)
            {
                Vector256<byte>* pLower = pData;
                Vector256<byte>* pUpper = pData + length;
                Vector256<byte>* pLowerHead;
                Vector256<byte>* pUpperHead;

                pLowerHead = pLower;
                pUpperHead = pUpper - 1;
                while (pLowerHead < pUpperHead)
                {
                    Vector256<byte> lower = *pLowerHead;
                    Vector256<byte> upper = *pUpperHead;

                    *pLowerHead = upper;
                    *pUpperHead = lower;

                    pLowerHead++;
                    pUpperHead--;
                }
            }
        }
    }
    //-------------------------------------------------------------------------
    [StructLayout(LayoutKind.Sequential, Pack = 0)]
    public struct Size16 : IComparable<Size16>
    {
        public long A;
        public long B;

        public int CompareTo(Size16 other)
        {
            return A.CompareTo(other.A) + B.CompareTo(other.B);
        }

        public override string ToString() => $"({A}, {B})";
    }
    //-------------------------------------------------------------------------
    [StructLayout(LayoutKind.Sequential, Pack = 0)]
    public struct Size32 : IComparable<Size32>
    {
        public Size16 A;
        public Size16 B;

        public int CompareTo(Size32 other)
        {
            return A.CompareTo(other.A) + B.CompareTo(other.B);
        }

        public override string ToString() => $"({A}, {B})";
    }
}
