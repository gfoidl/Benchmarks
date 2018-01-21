using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace LargeArrayBuilderBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	public class AddRangeBenchmarks
	{
		public static void Run()
		{
#if DEBUG
			var benchs = new AddRangeBenchmarks();
			var a = benchs.Default();
			var b = benchs.New1();

			System.Console.WriteLine(a.Length);
			System.Console.WriteLine(b.Length);
#else
			BenchmarkRunner.Run<AddRangeBenchmarks>();
#endif
		}
		//---------------------------------------------------------------------
		private const int N = 100_000;
		private IEnumerable<int> _source;
		//---------------------------------------------------------------------
		public AddRangeBenchmarks() => _source = Enumerable.Range(0, N);
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public int[] Default()
		{
			var builder = new LargeArrayBuilder0<int>(true);

			builder.AddRange(_source);

			return builder.ToArray();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public int[] New1()
		{
			var builder = new LargeArrayBuilder1<int>(true);

			builder.AddRange(_source);

			return builder.ToArray();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public int[] New2()
		{
			var builder = new LargeArrayBuilder2<int>(true);

			builder.AddRange(_source);

			return builder.ToArray();
		}
	}
}