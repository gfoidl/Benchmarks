using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
	public class Subsegment
	{
		private readonly StringSegment 	_default = new StringSegment("Hello world!");
		private readonly StringSegment1 _new 	 = new StringSegment1("Hello world!");
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public StringSegment Default() => _default.Subsegment(3, 2);
		//---------------------------------------------------------------------
		[Benchmark]
		public StringSegment1 New() => _new.Subsegment(3, 2);
	}
}
