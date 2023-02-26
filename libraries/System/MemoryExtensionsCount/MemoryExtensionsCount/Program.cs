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
    Console.WriteLine();
}
{
    Bench<short> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine();
}
{
    Bench<int> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine();
}
{
    Bench<long> bench = new();
    bench.Setup();
    Console.WriteLine(bench.Default());
    Console.WriteLine(bench.PR());
    Console.WriteLine();
}

#if !DEBUG
BenchmarkDotNet.Running.BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).RunAll();
#endif

//[ShortRunJob]
//[DisassemblyDiagnoser]
[GenericTypeArguments(typeof(byte))]
[GenericTypeArguments(typeof(short))]
[GenericTypeArguments(typeof(int))]
[GenericTypeArguments(typeof(long))]
public class Bench<T> where T : struct, INumberBase<T>
{
    private T[]? _source;
    private T _value;

    [ParamsSource(nameof(ValuesForLength))]
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

    [Benchmark(Baseline = true)]
    public int Default()
    {
        Debug.Assert(_source is not null);

        ref T source = ref MemoryMarshal.GetArrayDataReference(_source);
        return SpanHelpers.CountValueType(ref source, _value, this.Length);
    }

    [Benchmark]
    public int PR()
    {
        Debug.Assert(_source is not null);

        ref T source = ref MemoryMarshal.GetArrayDataReference(_source);
        return SpanHelpers.CountValueType_PR(ref source, _value, this.Length);
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

                nint remaining = Unsafe.ByteOffset(ref current, ref end) / Unsafe.SizeOf<T>();
                if (remaining > 0)
                {
                    uint mask = Vector256.Equals(Vector256.LoadUnsafe(ref oneVectorAwayFromEnd), targetVector).ExtractMostSignificantBits();

                    // The mask contains some elements that may be double-checked, so shift them away in order to get the correct pop-count.
                    nint overlaps = Vector256<T>.Count - remaining;
                    mask >>= (int)overlaps;
                    count += BitOperations.PopCount(mask);
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

                nint remaining = Unsafe.ByteOffset(ref current, ref end) / Unsafe.SizeOf<T>();
                if (remaining > 0)
                {
                    uint mask = Vector128.Equals(Vector128.LoadUnsafe(ref oneVectorAwayFromEnd), targetVector).ExtractMostSignificantBits();

                    // The mask contains some elements that may be double-checked, so shift them away in order to get the correct pop-count.
                    nint overlaps = Vector128<T>.Count - remaining;
                    mask >>= (int)overlaps;
                    count += BitOperations.PopCount(mask);
                }
            }
        }
        else
        {
            while (Unsafe.IsAddressLessThan(ref current, ref end))
            {
                if (current.Equals(value))
                {
                    count++;
                }

                current = ref Unsafe.Add(ref current, 1);
            }
        }

        return count;
    }
}
