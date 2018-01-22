using System.Collections.Generic;
using System.Linq0;
using System.Linq1;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace LargeArrayBuilderBenchmarks
{
	public class LinqSelectBenchmarks
	{
		public static void Run()
		{
#if DEBUG
			var benchs = new LinqSelectBenchmarks();
			//benchs.Default();
			benchs.New1();
#else
			BenchmarkRunner.Run<LinqSelectBenchmarks>();
#endif
		}
		//---------------------------------------------------------------------
		private const int N = 100_000;
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public int[] Default()
		{
			var values = this.GetValues();
			var iterator = Enumerable0.Select(values, i => i + i) as Enumerable0.SelectEnumerableIterator<int, int>;

			return iterator.ToArray();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public int[] New1()
		{
			var values = this.GetValues();
			var iterator = Enumerable1.Select(values, i => i + i) as Enumerable1.SelectEnumerableIterator<int, int>;

			return iterator.ToArray();
		}
		//---------------------------------------------------------------------
		private IEnumerable<int> GetValues()
		{
			for (int i = 0; i < N; ++i)
				yield return i;
		}
	}
}