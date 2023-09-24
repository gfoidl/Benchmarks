using System.Diagnostics;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;

{
    Bench<byte> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine(bench.PR_1());
    Console.WriteLine();
}
{
    Bench<short> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine(bench.PR_1());
    Console.WriteLine();
}
{
    Bench<int> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine(bench.PR_1());
    Console.WriteLine();
}
{
    Bench<long> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine(bench.PR_1());
    Console.WriteLine();
}

#if !DEBUG
BenchmarkDotNet.Running.BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).RunAll();
#endif

//[ShortRunJob]
//[DisassemblyDiagnoser]
[GenericTypeArguments(typeof(byte))]
//[GenericTypeArguments(typeof(short))]
//[GenericTypeArguments(typeof(int))]
//[GenericTypeArguments(typeof(long))]
public class Bench<T> where T : struct, INumberBase<T>, IMinMaxValue<T>
{
    private T[]? _source;
    private T _value;

    [ParamsSource(nameof(ValuesForLength))]
    public int Length { get; set; } = 10_000;

    //[Params(false, true)]
    public bool AllValuesSet { get; set; } = true;

    public static IEnumerable<int> ValuesForLength()
    {
        //yield return 2 * Vector256<T>.Count - 1;
        //yield return Vector256<T>.Count + 1;

        if (typeof(T) == typeof(byte))
        {
            yield return 10 * Vector256<T>.Count;
        }
        else if (typeof(T) == typeof(short))
        {
            yield return 5 * Vector256<T>.Count;
        }
        else if (typeof(T) == typeof(int))
        {
            yield return 2 * Vector256<T>.Count;
        }
        else if (typeof(T) == typeof(long))
        {
            yield return 3 * Vector256<T>.Count;
        }

        yield return 100;
        yield return 1_000;
    }

    [GlobalSetup]
    public void Setup()
    {
        _source = new T[this.Length];
        _value = T.One;

        if (this.AllValuesSet)
        {
            _source.AsSpan().Fill(T.One);
        }
        else
        {
            _source[0] = _value;

            if (this.Length > Vector128<T>.Count)
            {
                _source[^Vector128<T>.Count] = _value;

                if (this.Length > Vector256<T>.Count)
                {
                    _source[^Vector256<T>.Count] = _value;
                }
            }
            _source[^1] = _value;
        }
    }

    //[Benchmark(Baseline = true)]
    public int Default()
    {
        Debug.Assert(_source is not null);

        ref T source = ref MemoryMarshal.GetArrayDataReference(_source);
        return SpanHelpers.CountValueType(ref source, _value, this.Length);
    }

    [Benchmark(Baseline = true)]
    public int PR()
    {
        Debug.Assert(_source is not null);

        ref T source = ref MemoryMarshal.GetArrayDataReference(_source);
        return SpanHelpers.CountValueType_PR(ref source, _value, this.Length);
    }

    [Benchmark]
    public int PR_1()
    {
        Debug.Assert(_source is not null);

        ref T source = ref MemoryMarshal.GetArrayDataReference(_source);
        return SpanHelpers.CountValueType_PR_1(ref source, _value, this.Length);
    }
}

public static class SpanHelpers
{
    public static int CountValueType<T>(ref T current, T value, int length) where T : struct, IEquatable<T>?
    {
        int count = 0;

        ref T end = ref Unsafe.Add(ref current, length);
        if (Vector128.IsHardwareAccelerated && length >= Vector128<T>.Count)
        {
            if (Vector256.IsHardwareAccelerated && length >= Vector256<T>.Count)
            {
                Vector256<T> targetVector = Vector256.Create(value);
                ref T oneVectorAwayFromEndMinus1 = ref Unsafe.Subtract(ref end, Vector256<T>.Count - 1);
                do
                {
                    count += BitOperations.PopCount(Vector256.Equals(Vector256.LoadUnsafe(ref current), targetVector).ExtractMostSignificantBits());
                    current = ref Unsafe.Add(ref current, Vector256<T>.Count);
                }
                while (Unsafe.IsAddressLessThan(ref current, ref oneVectorAwayFromEndMinus1));

                if (Unsafe.IsAddressLessThan(ref current, ref Unsafe.Subtract(ref end, Vector128<T>.Count - 1)))
                {
                    count += BitOperations.PopCount(Vector128.Equals(Vector128.LoadUnsafe(ref current), Vector128.Create(value)).ExtractMostSignificantBits());
                    current = ref Unsafe.Add(ref current, Vector128<T>.Count);
                }
            }
            else
            {
                Vector128<T> targetVector = Vector128.Create(value);
                ref T oneVectorAwayFromEndMinus1 = ref Unsafe.Subtract(ref end, Vector128<T>.Count - 1);
                do
                {
                    count += BitOperations.PopCount(Vector128.Equals(Vector128.LoadUnsafe(ref current), targetVector).ExtractMostSignificantBits());
                    current = ref Unsafe.Add(ref current, Vector128<T>.Count);
                }
                while (Unsafe.IsAddressLessThan(ref current, ref oneVectorAwayFromEndMinus1));
            }
        }

        while (Unsafe.IsAddressLessThan(ref current, ref end))
        {
            if (current.Equals(value))
            {
                count++;
            }

            current = ref Unsafe.Add(ref current, 1);
        }

        return count;
    }

    public static int CountValueType_PR<T>(ref T current, T value, int length) where T : struct, IEquatable<T>?
    {
        int count = 0;
        ref T end = ref Unsafe.Add(ref current, length);

        if (Vector128.IsHardwareAccelerated && length >= Vector128<T>.Count)
        {
            if (Vector256.IsHardwareAccelerated && length >= Vector256<T>.Count)
            {
                Vector256<T> targetVector = Vector256.Create(value);
                ref T oneVectorAwayFromEnd = ref Unsafe.Subtract(ref end, Vector256<T>.Count);
                do
                {
                    count += BitOperations.PopCount(Vector256.Equals(Vector256.LoadUnsafe(ref current), targetVector).ExtractMostSignificantBits());
                    current = ref Unsafe.Add(ref current, Vector256<T>.Count);
                }
                while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));

                uint remaining = (uint)Unsafe.ByteOffset(ref current, ref end) / (uint)Unsafe.SizeOf<T>();
                if (remaining > Vector256<T>.Count / 2)
                {
                    uint mask = Vector256.Equals(Vector256.LoadUnsafe(ref oneVectorAwayFromEnd), targetVector).ExtractMostSignificantBits();

                    // The mask contains some elements that may be double-checked, so shift them away in order to get the correct pop-count.
                    uint overlaps = (uint)Vector256<T>.Count - remaining;
                    mask >>= (int)overlaps;
                    count += BitOperations.PopCount(mask);

                    return count;
                }
            }
            else
            {
                Vector128<T> targetVector = Vector128.Create(value);
                ref T oneVectorAwayFromEnd = ref Unsafe.Subtract(ref end, Vector128<T>.Count);
                do
                {
                    count += BitOperations.PopCount(Vector128.Equals(Vector128.LoadUnsafe(ref current), targetVector).ExtractMostSignificantBits());
                    current = ref Unsafe.Add(ref current, Vector128<T>.Count);
                }
                while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));

                uint remaining = (uint)Unsafe.ByteOffset(ref current, ref end) / (uint)Unsafe.SizeOf<T>();
                if (remaining > Vector128<T>.Count / 2)
                {
                    uint mask = Vector128.Equals(Vector128.LoadUnsafe(ref oneVectorAwayFromEnd), targetVector).ExtractMostSignificantBits();

                    // The mask contains some elements that may be double-checked, so shift them away in order to get the correct pop-count.
                    uint overlaps = (uint)Vector128<T>.Count - remaining;
                    mask >>= (int)overlaps;
                    count += BitOperations.PopCount(mask);

                    return count;
                }
            }
        }

        while (Unsafe.IsAddressLessThan(ref current, ref end))
        {
            if (current.Equals(value))
            {
                count++;
            }

            current = ref Unsafe.Add(ref current, 1);
        }

        return count;
    }

    public static int CountValueType_PR_1<T>(ref T current, T value, int length) where T : struct, INumberBase<T>, IMinMaxValue<T>
    {
        Debug.Assert(default(T) is byte or short or int or long);

        int count = 0;
        ref T end = ref Unsafe.Add(ref current, length);

        if (Vector128.IsHardwareAccelerated && length >= Vector128<T>.Count)
        {
            if (Vector256.IsHardwareAccelerated && length >= Vector256<T>.Count)
            {
                Vector256<T> targetVector = Vector256.Create(value);
                ref T oneVectorAwayFromEnd = ref Unsafe.Subtract(ref end, Vector256<T>.Count);

                int threshould = 0;

                if (typeof(T) == typeof(byte))
                {
                    threshould = 10;
                }
                else if (typeof(T) == typeof(short))
                {
                    threshould = 5;
                }
                else if (typeof(T) == typeof(int))
                {
                    threshould = 2;
                }
                else if (typeof(T) == typeof(long))
                {
                    threshould = 3;
                }

                // The reduction of the accumulator has some cost, so a threshould is used (found by benchmarks).
                if (length < threshould * Vector256<T>.Count || !Avx2.IsSupported)
                {
                    do
                    {
                        count += BitOperations.PopCount(Vector256.Equals(Vector256.LoadUnsafe(ref current), targetVector).ExtractMostSignificantBits());
                        current = ref Unsafe.Add(ref current, Vector256<T>.Count);
                    }
                    while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));
                }
                else
                {
                    // In this optimization we use an accumulator that can be sumed up, by re-interpreting the result
                    // of equals (all or no bits set) as signed values (so -1 or 0) and by subtracting from the accumulator.
                    //
                    // This is only done for Vector256 when AVX2 is supported.
                    // * for the reduction of the accumulator to an int there's no corresponding code for Arm
                    // * for large enough length to hit this code-path on x86 there's no need to complicate the Vector128 code-path
                    //   as on recent hardware AVX2 should be available then.

                    Vector256<T> accumulator = Vector256<T>.Zero;

                    // Need to special case byte and short to prevent overflow in the vector registers.
                    if (typeof(T) == typeof(byte) || typeof(T) == typeof(short))
                    {
                        while (true)
                        {
                            int maxValue = typeof(T) == typeof(byte) ? byte.MaxValue : short.MaxValue;
                            ref T vectorEnd = ref Unsafe.Add(ref current, (maxValue - 1) * Vector256<T>.Count);

                            if (Unsafe.IsAddressGreaterThan(ref vectorEnd, ref oneVectorAwayFromEnd))
                            {
                                break;
                            }

                            do
                            {
                                Vector256<T> equals = Vector256.Equals(Vector256.LoadUnsafe(ref current), targetVector);

                                if (typeof(T) == typeof(byte))
                                {
                                    // Subtract via sbyte, overflow is OK here, as we cast to unsigned later.
                                    accumulator = (accumulator.AsSByte() - equals.AsSByte()).As<sbyte, T>();
                                }
                                else
                                {
                                    accumulator -= equals;
                                }

                                current = ref Unsafe.Add(ref current, Vector256<T>.Count);
                            }
                            while (!Unsafe.IsAddressGreaterThan(ref current, ref vectorEnd));

                            count += SumVector256(accumulator);
                            accumulator = Vector256<T>.Zero;
                        }

                        while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd))
                        {
                            Vector256<T> equals = Vector256.Equals(Vector256.LoadUnsafe(ref current), targetVector);
                            if (typeof(T) == typeof(byte))
                            {
                                accumulator = (accumulator.AsSByte() - equals.AsSByte()).As<sbyte, T>();
                            }
                            else
                            {
                                accumulator -= equals;
                            }
                            current = ref Unsafe.Add(ref current, Vector256<T>.Count);
                        }

                        count += SumVector256(accumulator);
                    }
                    else
                    {
                        do
                        {
                            Vector256<T> equals = Vector256.Equals(Vector256.LoadUnsafe(ref current), targetVector);
                            accumulator -= equals;

                            current = ref Unsafe.Add(ref current, Vector256<T>.Count);
                        }
                        while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));

                        count += SumVector256(accumulator);
                    }
                }

                uint remaining = (uint)Unsafe.ByteOffset(ref current, ref end) / (uint)Unsafe.SizeOf<T>();
                if (remaining >= Vector256<T>.Count / 2)
                {
                    uint mask = Vector256.Equals(Vector256.LoadUnsafe(ref oneVectorAwayFromEnd), targetVector).ExtractMostSignificantBits();

                    // The mask contains some elements that may be double-checked, so shift them away in order to get the correct pop-count.
                    uint overlaps = (uint)Vector256<T>.Count - remaining;
                    mask >>= (int)overlaps;
                    count += BitOperations.PopCount(mask);

                    return count;
                }
            }
            else
            {
                Vector128<T> targetVector = Vector128.Create(value);
                ref T oneVectorAwayFromEnd = ref Unsafe.Subtract(ref end, Vector128<T>.Count);

                do
                {
                    count += BitOperations.PopCount(Vector128.Equals(Vector128.LoadUnsafe(ref current), targetVector).ExtractMostSignificantBits());
                    current = ref Unsafe.Add(ref current, Vector128<T>.Count);
                }
                while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));

                uint remaining = (uint)Unsafe.ByteOffset(ref current, ref end) / (uint)Unsafe.SizeOf<T>();
                if (remaining >= Vector128<T>.Count / 2)
                {
                    uint mask = Vector128.Equals(Vector128.LoadUnsafe(ref oneVectorAwayFromEnd), targetVector).ExtractMostSignificantBits();

                    // The mask contains some elements that may be double-checked, so shift them away in order to get the correct pop-count.
                    uint overlaps = (uint)Vector128<T>.Count - remaining;
                    mask >>= (int)overlaps;
                    count += BitOperations.PopCount(mask);

                    return count;
                }
            }
        }

        while (Unsafe.IsAddressLessThan(ref current, ref end))
        {
            if (current == value)
            {
                count++;
            }

            current = ref Unsafe.Add(ref current, 1);
        }

        return count;

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        static int SumVector256<TVector>(Vector256<TVector> accumulator) where TVector : struct
        {
            Debug.Assert(Avx2.IsSupported);

            if (typeof(TVector) == typeof(byte))
            {
                Vector256<ushort> sad0 = Avx2.SumAbsoluteDifferences(accumulator.AsByte(), Vector256<byte>.Zero);
                Vector256<ushort> sad1 = Avx2.Shuffle(sad0.AsInt32(), 0x2).AsUInt16();
                Vector256<ushort> tmp = sad0 + sad1;
                Vector128<ushort> t1 = tmp.GetUpper();

                return tmp.ToScalar() + t1.ToScalar();
            }
            else if (typeof(TVector) == typeof(short))
            {
                Vector256<short> vec = accumulator.AsInt16();
                Vector256<int> hadd = Avx2.MultiplyAddAdjacent(vec, Vector256<short>.One);
                Vector256<int> hadd1 = Avx2.HorizontalAdd(hadd, hadd);
                Vector256<int> hadd2 = Avx2.HorizontalAdd(hadd1, hadd1);
                Vector128<int> t1 = hadd2.GetUpper();

                return hadd2.ToScalar() + t1.ToScalar();
            }
            else if (typeof(TVector) == typeof(int))
            {
                return (int)(object)Vector256.Sum(accumulator);
            }
            else if (typeof(TVector) == typeof(long))
            {
                // Vector256.Sum stores the vector on the stack, then reads from there the longs and sums them up.
                // This approach avoids intermediate memory stores / loads.
                Vector256<long> v0 = accumulator.AsInt64();
                Vector256<long> v1 = Avx2.Permute4x64(v0, 0b_10_11_00_01);
                Vector256<long> s0 = v0 + v1;
                Vector256<long> s1 = Avx2.Permute4x64(s0, 0x2);
                Vector256<long> sum = s0 + s1;

                return (int)sum.ToScalar();
            }
            else
            {
                throw new NotSupportedException();
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        static int SumVector128<TVector>(Vector128<TVector> accumulator) where TVector : struct
        {
            if (typeof(TVector) == typeof(byte))
            {
                if (Sse2.IsSupported)
                {
                    Vector128<ushort> sad0 = Sse2.SumAbsoluteDifferences(accumulator.AsByte(), Vector128<byte>.Zero);
                    Vector128<ushort> sad1 = Sse2.Shuffle(sad0.AsInt32(), 0x2).AsUInt16();
                    return sad0.ToScalar() + sad1.ToScalar();
                }
                else
                {
                    int sum = 0;

                    for (int i = 0; i < Vector128<byte>.Count; ++i)
                    {
                        sum += (byte)(byte)(object)accumulator[i];
                    }

                    return sum;
                }
            }
            else if (typeof(TVector) == typeof(short))
            {
                if (Ssse3.IsSupported)
                {
                    Vector128<short> vec = accumulator.AsInt16();
                    Vector128<int> hadd = Sse2.MultiplyAddAdjacent(vec, Vector128<short>.One);
                    Vector128<int> hadd1 = Ssse3.HorizontalAdd(hadd, hadd);
                    Vector128<int> hadd2 = Sse2.Shuffle(hadd1, 0x1);
                    Vector128<int> sum = hadd1 + hadd2;

                    return sum.ToScalar();
                }
                else
                {
                    int sum = 0;

                    for (int i = 0; i < Vector128<short>.Count; ++i)
                    {
                        sum += (ushort)(short)(object)accumulator[i];
                    }

                    return sum;
                }
            }
            else if (typeof(TVector) == typeof(int))
            {
                return (int)(object)Vector128.Sum(accumulator);
            }
            else if (typeof(TVector) == typeof(long))
            {
                long l0 = accumulator.AsInt64().ToScalar();
                long l1 = accumulator.AsInt64().GetElement(1);
                return (int)(l0 + l1);
            }
            else
            {
                throw new NotSupportedException();
            }
        }
    }
}
