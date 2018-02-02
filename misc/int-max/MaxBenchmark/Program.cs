#define NO_BRANCH_PREDICTION
//-----------------------------------------------------------------------------
using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace MaxBenchmark
{
	static class Program
	{
		static void Main(string[] args)
		{
			for (int i = 0; i < 2; ++i)
			{
				var benchs = new Benchmarks();
				Console.WriteLine($"{nameof(benchs.Max1)}: {benchs.Max1()}");
				Console.WriteLine($"{nameof(benchs.Max2)}: {benchs.Max2()}");
				Console.WriteLine($"{nameof(benchs.Max3)}: {benchs.Max3()}");
				Console.WriteLine($"{nameof(benchs.Max4)}: {benchs.Max4()}");
				Console.WriteLine($"{nameof(benchs.Max5)}: {benchs.Max5()}");
				Console.WriteLine($"{nameof(benchs.Max6)}: {benchs.Max6()}");
				Console.WriteLine($"{nameof(benchs.Max7)}: {benchs.Max7()}");
				Console.WriteLine($"{nameof(benchs.Max8)}: {benchs.Max8()}");
				Console.WriteLine($"{nameof(benchs.Max9)}: {benchs.Max9()}");
				Console.WriteLine();
			}
#if !DEBUG
			if (!Debugger.IsAttached) BenchmarkRunner.Run<Benchmarks>();
#endif
		}
	}
	//-------------------------------------------------------------------------
	public class Benchmarks
	{
		private int _a = 42;
		private int _b = -666;
		//---------------------------------------------------------------------
		public int A
		{
			get
			{
				_a *= -1;
				return _a;
			}
		}
		//---------------------------------------------------------------------
		public int B
		{
			get
			{
				_b *= -1;
				return _b;
			}
		}
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark(Baseline = true)]
		public int Max1() => this.Max1(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max2() => this.Max2(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max3() => this.Max3(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max4() => this.Max4(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max5() => this.Max5(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max6() => this.Max6(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max7() => this.Max7(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max8() => this.Max8(this.A, this.B);
		//---------------------------------------------------------------------
#if !BENCH
		[MethodImpl(MethodImplOptions.NoInlining)]
#endif
		[Benchmark]
		public int Max9() => this.Max9(this.A, this.B);
		//---------------------------------------------------------------------
		private int Max1(int a, int b) => a > b ? a : b;
		//---------------------------------------------------------------------
		private int Max2(int a, int b)
		{
			if (a > b) return a;
			return b;
		}
		//---------------------------------------------------------------------
		private int Max3(int a, int b)
		{
			if (a > b)
				return a;
			else
				return b;
		}
		//---------------------------------------------------------------------
		private int Max4(int a, int b)
		{
			int m = b;

			if (a > b) m = a;

			return m;
		}
		//---------------------------------------------------------------------
		private int Max5(int a, int b)
		{
			int m = a;

			if (a < b) m = b;

			return m;
		}
		//---------------------------------------------------------------------
		private int Max6(int a, int b) => Math.Max(a, b);
		//---------------------------------------------------------------------
		// https://hbfs.wordpress.com/2008/08/05/branchless-equivalents-of-simple-functions/
		private int Max7(int a, int b)
		{
			return a + ((b - a) & ~sex(b - a));
			//-----------------------------------------------------------------
			int sex(int x)
			{
				const int CHAR_BIT = 8;
				return x >> (CHAR_BIT * sizeof(int) - 1);
			}
		}
		//---------------------------------------------------------------------
		[StructLayout(LayoutKind.Explicit)]
		private struct Z
		{
			[FieldOffset(0)]
			public long w;

			[FieldOffset(0)]
			public Tmp t;

			public struct Tmp
			{
				public int Lo;
				public int Hi;
			}
		}
		//---------------------------------------------------------------------
		private int Max8(int a, int b)
		{
			return a + ((b - a) & ~sex(b - a));
			//-----------------------------------------------------------------
			int sex(int x)
			{
				var z = new Z { w = x };

				return z.t.Hi;
			}
		}
		//---------------------------------------------------------------------
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		private int Max9(int a, int b)
		{
			int tmp = b - a;
			var z = new Z { w = tmp };
			int sex = z.t.Hi;

			return a + (tmp & ~sex);
		}
	}
}
