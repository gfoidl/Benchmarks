using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks
{
	public class StringCtor
	{
		private const string Value = "Hello world!";
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public StringSegment Default() => new StringSegment(Value, 1, 4);
		//---------------------------------------------------------------------
		[Benchmark]
		public StringSegment1 New() => new StringSegment1(Value, 1, 4);
	}
}
