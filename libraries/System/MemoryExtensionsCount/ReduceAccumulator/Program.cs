using System.Numerics;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;

{
    Console.WriteLine("sbyte");
    Bench<sbyte> bench = new();
    Console.WriteLine(bench.Scalar256Sum());
    Console.WriteLine(bench.Vec256Sum());
    Console.WriteLine(bench.Optimized256Sum());
    Console.WriteLine();
    Console.WriteLine(bench.Scalar128Sum());
    Console.WriteLine(bench.Vec128Sum());
    Console.WriteLine(bench.Optimized128Sum());
    Console.WriteLine(new string('-', 80));
}
{
    Console.WriteLine("short");
    Bench<short> bench = new();
    Console.WriteLine(bench.Scalar256Sum());
    Console.WriteLine(bench.Vec256Sum());
    Console.WriteLine(bench.Optimized256Sum());
    Console.WriteLine();
    Console.WriteLine(bench.Scalar128Sum());
    Console.WriteLine(bench.Vec128Sum());
    Console.WriteLine(bench.Optimized128Sum());
    Console.WriteLine(new string('-', 80));
}
{
    Console.WriteLine("int");
    Bench<int> bench = new();
    Console.WriteLine(bench.Scalar256Sum());
    Console.WriteLine(bench.Vec256Sum());
    Console.WriteLine(bench.Optimized256Sum());
    Console.WriteLine();
    Console.WriteLine(bench.Scalar128Sum());
    Console.WriteLine(bench.Vec128Sum());
    Console.WriteLine(bench.Optimized128Sum());
    Console.WriteLine(new string('-', 80));
}
{
    Console.WriteLine("long");
    Bench<long> bench = new();
    Console.WriteLine(bench.Scalar256Sum());
    Console.WriteLine(bench.Vec256Sum());
    Console.WriteLine(bench.Optimized256Sum());
    Console.WriteLine();
    Console.WriteLine(bench.Scalar128Sum());
    Console.WriteLine(bench.Vec128Sum());
    Console.WriteLine(bench.Optimized128Sum());
    Console.WriteLine(new string('-', 80));
}

#if !DEBUG
BenchmarkDotNet.Running.BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).RunAll();
#endif

//[ShortRunJob]
[DisassemblyDiagnoser]
[CategoriesColumn]
[GroupBenchmarksBy(BenchmarkLogicalGroupRule.ByCategory)]
//[GenericTypeArguments(typeof(sbyte))]
//[GenericTypeArguments(typeof(short))]
[GenericTypeArguments(typeof(int))]
//[GenericTypeArguments(typeof(long))]
public class Bench<T> where T : struct, INumber<T>, IMinMaxValue<T>
{
    private Vector256<T> _vec256;
    private Vector128<T> _vec128;

    public Bench()
    {
        T[] arr = new T[Vector256<T>.Count];
        T val = T.One;

        for (int i = 0; i < arr.Length; ++i)
        {
            arr[i] = val;
            //arr[i] = T.MaxValue;
            val++;
        }

        ref T ra = ref MemoryMarshal.GetArrayDataReference(arr);
        _vec256 = Vector256.LoadUnsafe(ref ra);
        _vec128 = Vector128.LoadUnsafe(ref ra);
    }

    public int Scalar256Sum()
    {
        int sum = 0;

        if (typeof(T) == typeof(sbyte))
        {
            for (int i = 0; i < Vector256<byte>.Count; ++i)
            {
                sum += (sbyte)(object)_vec256[i];
            }
        }
        else if (typeof(T) == typeof(short))
        {
            for (int i = 0; i < Vector256<short>.Count; ++i)
            {
                sum += (short)(object)_vec256[i];
            }
        }
        else if (typeof(T) == typeof(int))
        {
            for (int i = 0; i < Vector256<int>.Count; ++i)
            {
                sum += (int)(object)_vec256[i];
            }
        }
        else if (typeof(T) == typeof(long))
        {
            for (int i = 0; i < Vector256<long>.Count; ++i)
            {
                sum += (int)(long)(object)_vec256[i];
            }
        }
        else
        {
            throw new NotSupportedException();
        }

        return sum;
    }

    public int Scalar128Sum()
    {
        int sum = 0;

        if (typeof(T) == typeof(sbyte))
        {
            for (int i = 0; i < Vector128<byte>.Count; ++i)
            {
                sum += (sbyte)(object)_vec128[i];
            }
        }
        else if (typeof(T) == typeof(short))
        {
            for (int i = 0; i < Vector128<short>.Count; ++i)
            {
                sum += (short)(object)_vec128[i];
            }
        }
        else if (typeof(T) == typeof(int))
        {
            for (int i = 0; i < Vector128<int>.Count; ++i)
            {
                sum += (int)(object)_vec128[i];
            }
        }
        else if (typeof(T) == typeof(long))
        {
            for (int i = 0; i < Vector128<long>.Count; ++i)
            {
                sum += (int)(long)(object)_vec128[i];
            }
        }
        else
        {
            throw new NotSupportedException();
        }

        return sum;
    }

    [Benchmark(Baseline = true, Description = "VecSum")]
    [BenchmarkCategory("Vector256")]
    public int Vec256Sum()
    {
        if (typeof(T) == typeof(sbyte))
        {
            int sum = 0;

            for (int i = 0; i < Vector256<sbyte>.Count; ++i)
            {
                sum += _vec256.AsSByte()[i];
            }

            return sum;
        }
        else if (typeof(T) == typeof(short))
        {
            int sum = 0;

            for (int i = 0; i < Vector256<short>.Count; ++i)
            {
                sum += _vec256.AsInt16()[i];
            }

            return sum;
        }
        else if (typeof(T) == typeof(int))
        {
            return (int)(object)Vector256.Sum(_vec256);
        }
        else if (typeof(T) == typeof(long))
        {
            return (int)(long)(object)Vector256.Sum(_vec256);
        }
        else
        {
            throw new NotSupportedException();
        }
    }

    [Benchmark(Baseline = true, Description = "VecSum")]
    [BenchmarkCategory("Vector128")]
    public int Vec128Sum()
    {
        if (typeof(T) == typeof(sbyte))
        {
            int sum = 0;

            for (int i = 0; i < Vector128<sbyte>.Count; ++i)
            {
                sum += _vec128.AsSByte()[i];
            }

            return sum;
        }
        else if (typeof(T) == typeof(short))
        {
            int sum = 0;

            for (int i = 0; i < Vector128<short>.Count; ++i)
            {
                sum += _vec128.AsInt16()[i];
            }

            return sum;
        }
        else if (typeof(T) == typeof(int))
        {
            return (int)(object)Vector128.Sum(_vec128);
        }
        else if (typeof(T) == typeof(long))
        {
            return (int)(long)(object)Vector128.Sum(_vec128);
        }
        else
        {
            throw new NotSupportedException();
        }
    }

    [Benchmark(Description = "Optimized")]
    [BenchmarkCategory("Vector256")]
    public int Optimized256Sum()
    {
        if (typeof(T) == typeof(sbyte))
        {
            if (Avx2.IsSupported)
            {
                Vector256<ushort> sad0 = Avx2.SumAbsoluteDifferences(_vec256.AsByte(), Vector256<byte>.Zero);
                Vector256<ushort> sad1 = Avx2.Shuffle(sad0.AsInt32(), 0x2).AsUInt16();
                Vector256<ushort> tmp = sad0 + sad1;
                Vector128<ushort> t1 = tmp.GetUpper();

                return tmp.ToScalar() + t1.ToScalar();
            }
            else
            {
                int sum = 0;

                for (int i = 0; i < Vector256<sbyte>.Count; ++i)
                {
                    sum += (byte)(sbyte)(object)_vec256[i];
                }

                return sum;
            }
        }
        else if (typeof(T) == typeof(short))
        {
            if (Avx2.IsSupported)
            {
                Vector256<short> vec = _vec256.AsInt16();
                Vector256<int> hadd = Avx2.MultiplyAddAdjacent(vec, Vector256<short>.One);
                Vector256<int> hadd1 = Avx2.HorizontalAdd(hadd, hadd);
                Vector256<int> hadd2 = Avx2.HorizontalAdd(hadd1, hadd1);
                Vector128<int> t1 = hadd2.GetUpper();

                return hadd2.ToScalar() + t1.ToScalar();
            }
            else
            {
                int sum = 0;

                for (int i = 0; i < Vector256<short>.Count; ++i)
                {
                    sum += (ushort)(short)(object)_vec256[i];
                }

                return sum;
            }
        }
        else if (typeof(T) == typeof(int))
        {
            if (Avx2.IsSupported)
            {
                Vector256<int> v0 = _vec256.AsInt32();
                Vector256<int> hadd = Avx2.HorizontalAdd(v0, v0);
                Vector256<int> hadd1 = Avx2.Shuffle(hadd, 0x1);
                Vector256<int> sum = hadd + hadd1;
                Vector128<int> t1 = sum.GetUpper();

                return sum.ToScalar() + t1.ToScalar();
            }

            return (int)(object)Vector256.Sum(_vec256);
        }
        else if (typeof(T) == typeof(long))
        {
            if (Avx2.IsSupported)
            {
                Vector256<long> v0 = _vec256.AsInt64();
                Vector256<long> v1 = Avx2.Permute4x64(v0, 0b_10_11_00_01);
                Vector256<long> s0 = v0 + v1;
                Vector256<long> s1 = Avx2.Permute4x64(s0, 0x2);
                Vector256<long> sum = s0 + s1;

                return (int)sum.ToScalar();
            }

            return (int)(long)(object)Vector256.Sum(_vec256);
        }
        else
        {
            throw new NotSupportedException();
        }
    }

    [Benchmark(Description = "Optimized")]
    [BenchmarkCategory("Vector128")]
    public int Optimized128Sum()
    {
        if (typeof(T) == typeof(sbyte))
        {
            if (Sse2.IsSupported)
            {
                Vector128<ushort> sad0 = Sse2.SumAbsoluteDifferences(_vec128.AsByte(), Vector128<byte>.Zero);
                Vector128<ushort> sad1 = Sse2.Shuffle(sad0.AsInt32(), 0x2).AsUInt16();
                return sad0.ToScalar() + sad1.ToScalar();
            }
            else
            {
                int sum = 0;

                for (int i = 0; i < Vector128<sbyte>.Count; ++i)
                {
                    sum += (byte)(sbyte)(object)_vec128[i];
                }

                return sum;
            }
        }
        else if (typeof(T) == typeof(short))
        {
            if (Ssse3.IsSupported)
            {
                Vector128<short> vec = _vec128.AsInt16();
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
                    sum += (ushort)(short)(object)_vec128[i];
                }

                return sum;
            }
        }
        else if (typeof(T) == typeof(int))
        {
            if (Ssse3.IsSupported)
            {
                Vector128<int> vec = _vec128.AsInt32();
                Vector128<int> hadd = Ssse3.HorizontalAdd(vec, vec);
                Vector128<int> hadd1 = Sse2.Shuffle(hadd, 0x1);
                Vector128<int> sum = hadd + hadd1;

                return sum.ToScalar();
            }

            return (int)(object)Vector128.Sum(_vec128);
        }
        else if (typeof(T) == typeof(long))
        {
            long l0 = _vec128.AsInt64().ToScalar();
            long l1 = _vec128.AsInt64().GetElement(1);
            return (int)(l0 + l1);
        }
        else
        {
            throw new NotSupportedException();
        }
    }
}
