using System.Diagnostics;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
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

[ShortRunJob]
[DisassemblyDiagnoser]
//[GenericTypeArguments(typeof(byte))]
//[GenericTypeArguments(typeof(short))]
[GenericTypeArguments(typeof(int))]
//[GenericTypeArguments(typeof(long))]
public class Bench<T> where T : struct, INumberBase<T>, IMinMaxValue<T>
{
    private T[]? _source;
    private T _value;

    //[ParamsSource(nameof(ValuesForLength))]
    public int Length { get; set; } = 2 * Vector256<T>.Count - 1;

    public static IEnumerable<int> ValuesForLength()
    {
        yield return 2 * Vector256<T>.Count - 1;
        yield return Vector256<T>.Count + 1;
    }

    [GlobalSetup]
    public void Setup()
    {
        _source = new T[this.Length];
        _value = T.One;

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

    //[Benchmark(Baseline = true)]
    public int Default()
    {
        Debug.Assert(_source is not null);

        ref T source = ref MemoryMarshal.GetArrayDataReference(_source);
        return SpanHelpers.CountValueType(ref source, _value, this.Length);
    }

    //[Benchmark(Baseline = true)]
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

        if (typeof(T) == typeof(byte))
        {
            return SpanHelpers.CountValueType_PR_1(ref Unsafe.As<T, sbyte>(ref source), (sbyte)(byte)(object)_value, this.Length);
        }
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

    public static int CountValueType_PR_1<T>(ref T current, T value, int length) where T : struct, IEquatable<T>?, INumberBase<T>, IMinMaxValue<T>
    {
        Debug.Assert(default(T) is sbyte or short or int or long);

        int count = 0;
        ref T end = ref Unsafe.Add(ref current, length);

        if (Vector128.IsHardwareAccelerated && length >= Vector128<T>.Count)
        {
            if (Vector256.IsHardwareAccelerated && length >= Vector256<T>.Count)
            {
                Vector256<T> targetVector = Vector256.Create(value);
                Vector256<T> accumulator = Vector256<T>.Zero;
                T i = T.Zero;
                ref T oneVectorAwayFromEnd = ref Unsafe.Subtract(ref end, Vector256<T>.Count);

                do
                {
                    Vector256<T> vector = Vector256.LoadUnsafe(ref current);
                    Vector256<T> equals = Vector256.Equals(vector, targetVector);
                    accumulator -= equals;
                    i++;
                    current = ref Unsafe.Add(ref current, Vector256<T>.Count);

                    if (i == T.MaxValue)
                    {
                        count += SumVector256(accumulator);
                        accumulator = Vector256<T>.Zero;
                        i = T.Zero;
                    }
                }
                while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));

                count += SumVector256(accumulator);

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
                Vector128<T> accumulator = Vector128<T>.Zero;
                T i = T.Zero;
                ref T oneVectorAwayFromEnd = ref Unsafe.Subtract(ref end, Vector128<T>.Count);

                do
                {
                    Vector128<T> vector = Vector128.LoadUnsafe(ref current);
                    Vector128<T> equals = Vector128.Equals(vector, targetVector);
                    accumulator -= equals;
                    i++;
                    current = ref Unsafe.Add(ref current, Vector128<T>.Count);

                    if (i == T.MaxValue)
                    {
                        count += SumVector128(accumulator);
                        accumulator = Vector128<T>.Zero;
                        i = T.Zero;
                    }
                }
                while (!Unsafe.IsAddressGreaterThan(ref current, ref oneVectorAwayFromEnd));

                count += SumVector128(accumulator);

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

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            static int SumVector256(Vector256<T> counter)
            {
                T sum = Vector256.Sum(counter);

                if (typeof(T) == typeof(sbyte))
                {
                    return (sbyte)(object)sum;
                }
                else if (typeof(T) == typeof(short))
                {
                    return (short)(object)sum;
                }
                else if (typeof(T) == typeof(int))
                {
                    return (int)(object)sum;
                }
                else if (typeof(T) == typeof(long))
                {
                    return (int)(long)(object)sum;
                }
                else
                {
                    throw new NotSupportedException();
                }
            }

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            static int SumVector128(Vector128<T> counter)
            {
                T sum = Vector128.Sum(counter);

                if (typeof(T) == typeof(sbyte))
                {
                    return (sbyte)(object)sum;
                }
                else if (typeof(T) == typeof(short))
                {
                    return (short)(object)sum;
                }
                else if (typeof(T) == typeof(int))
                {
                    return (int)(object)sum;
                }
                else if (typeof(T) == typeof(long))
                {
                    return (int)(long)(object)sum;
                }
                else
                {
                    throw new NotSupportedException();
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
}
