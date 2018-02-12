using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.Primitives;

namespace InplaceStringBuilder
{
	public class AppendStringBenchmarks
	{
		public static void Run()
		{
			var benchs = new AppendStringBenchmarks();

			Console.WriteLine(benchs.Default());
			Console.WriteLine(benchs.Default_ThrowHelper());
			Console.WriteLine(benchs.Default_ThrowHelper_AggressiveInlining());
			Console.WriteLine(benchs.CharArray());
#if !DEBUG
			BenchmarkRunner.Run<AppendStringBenchmarks>();
#endif
		}
		//---------------------------------------------------------------------
		private const int N = 100;
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public string Default()
		{
			var sb = new InplaceStringBuilder0(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string Default_ThrowHelper_AggressiveInlining()
		{
			var sb = new InplaceStringBuilder00(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string Default_ThrowHelper()
		{
			var sb = new InplaceStringBuilder01(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string CharArray()
		{
			var sb = new InplaceStringBuilder1(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
	}
}
