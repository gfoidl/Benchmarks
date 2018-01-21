using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace LargeArrayBuilderBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	public class AddBenchmarks
	{
		public static void Run()
		{
#if DEBUG
			var benchs = new AddBenchmarks();
			var a = benchs.Default();
			var b = benchs.New1();

			System.Console.WriteLine(a.Length);
			System.Console.WriteLine(b.Length);
#else
			BenchmarkRunner.Run<AddBenchmarks>();
#endif
		}
		//---------------------------------------------------------------------
		private const int N = 100_000;
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public int[] Default()
		{
			var builder = new LargeArrayBuilder0<int>(true);

			for (int i = 0; i < N; ++i)
				builder.Add(i);

			return builder.ToArray();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public int[] New1()
		{
			var builder = new LargeArrayBuilder1<int>(true);

			for (int i = 0; i < N; ++i)
				builder.Add(i);

			return builder.ToArray();
		}
	}
}