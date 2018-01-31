using System;
using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace LargeArrayBuilderBenchmarks
{
	//[DisassemblyDiagnoser(printSource: true)]
	public class AddRangeTSizeBenchmarks
	{
		public static void Run()
		{
#if DEBUG
			var benchs = new AddRangeTSizeBenchmarks();
			benchs.Size = 128;
			Console.WriteLine(benchs.Default());
			Console.WriteLine(benchs.New1());
			Console.WriteLine(benchs.New2());
#else
			BenchmarkRunner.Run<AddRangeTSizeBenchmarks>();
#endif
		}
		//---------------------------------------------------------------------
		public struct Size8
		{
			public long A;
		}
		//---------------------------------------------------------------------
		public struct Size16
		{
			public long A;
			public long B;
		}
		//---------------------------------------------------------------------
		public struct Size24
		{
			public long A;
			public long B;
			public long C;
		}
		//---------------------------------------------------------------------
		public struct Size32
		{
			public long A;
			public long B;
			public long C;
			public long D;
		}
		//---------------------------------------------------------------------
		public struct Size64
		{
			public Size32 A;
			public Size32 B;
		}
		//---------------------------------------------------------------------
		public struct Size128
		{
			public Size64 A;
			public Size64 B;
		}
		//---------------------------------------------------------------------
		private const int N = 100_000;
		//---------------------------------------------------------------------
		[Params(4, 8, 16, 24, 32, 64, 128)]
		public int Size { get; set; }
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public int Default()
		{
			switch (this.Size)
			{
				case 4:
					return DefaultImpl<int>().Length;
				case 8:
					return DefaultImpl<Size8>().Length;
				case 16:
					return DefaultImpl<Size16>().Length;
				case 24:
					return DefaultImpl<Size24>().Length;
				case 32:
					return DefaultImpl<Size32>().Length;
				case 64:
					return DefaultImpl<Size64>().Length;
				case 128:
					return DefaultImpl<Size128>().Length;
				default:
					throw new InvalidOperationException("Unknown size");
			}
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public int New1()
		{
			switch (this.Size)
			{
				case 4:
					return New1Impl<int>().Length;
				case 8:
					return New1Impl<Size8>().Length;
				case 16:
					return New1Impl<Size16>().Length;
				case 24:
					return New1Impl<Size24>().Length;
				case 32:
					return New1Impl<Size32>().Length;
				case 64:
					return New1Impl<Size64>().Length;
				case 128:
					return New1Impl<Size128>().Length;
				default:
					throw new InvalidOperationException("Unknown size");
			}
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public int New2()
		{
			switch (this.Size)
			{
				case 4:
					return New2Impl<int>().Length;
				case 8:
					return New2Impl<Size8>().Length;
				case 16:
					return New2Impl<Size16>().Length;
				case 24:
					return New2Impl<Size24>().Length;
				case 32:
					return New2Impl<Size32>().Length;
				case 64:
					return New2Impl<Size64>().Length;
				case 128:
					return New2Impl<Size128>().Length;
				default:
					throw new InvalidOperationException("Unknown size");
			}
		}
		//---------------------------------------------------------------------
		private static IEnumerable<T> GetItems<T>()
		{
			for (int i = 0; i < N; ++i)
				yield return default;
		}
		//---------------------------------------------------------------------
		private T[] DefaultImpl<T>()
		{
			var builder = new LargeArrayBuilder0<T>(true);

			builder.AddRange(GetItems<T>());

			return builder.ToArray();
		}
		//---------------------------------------------------------------------
		private T[] New1Impl<T>()
		{
			var builder = new LargeArrayBuilder1<T>(true);

			builder.AddRange(GetItems<T>());

			return builder.ToArray();
		}
		//---------------------------------------------------------------------
		private T[] New2Impl<T>()
		{
			var builder = new LargeArrayBuilder2<T>(true);

			builder.AddRange(GetItems<T>());

			return builder.ToArray();
		}
	}
}
