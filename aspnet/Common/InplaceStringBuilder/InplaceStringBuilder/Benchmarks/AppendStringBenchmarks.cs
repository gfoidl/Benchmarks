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
			Console.WriteLine(benchs.This_PR());
			Console.WriteLine(benchs.This_PR_wo_pre_init());
			Console.WriteLine(benchs.New_Idea());
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
		public string This_PR()
		{
			var sb = new InplaceStringBuilder00(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string This_PR_wo_pre_init()
		{
			var sb = new InplaceStringBuilder02(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string New_Idea()
		{
			var sb = new InplaceStringBuilder01(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		//[Benchmark]
		public string CharArray()
		{
			var sb = new InplaceStringBuilder1(N);

			for (int i = 0; i < N / 2; ++i)
				sb.Append("ab");

			return sb.ToString();
		}
	}
}
