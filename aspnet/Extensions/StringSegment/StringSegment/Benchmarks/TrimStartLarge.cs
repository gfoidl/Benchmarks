using BenchmarkDotNet.Attributes;
using Microsoft.Extensions.Primitives;

namespace StringSegment_Benchmarks.Benchmarks
{
	public class TrimStartLarge
	{
		private readonly StringSegment 	_default = new StringSegment ("                        Hello world!");
		private readonly StringSegment1 _new 	 = new StringSegment1("                        Hello world!");
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public StringSegment Default() => _default.TrimStart();
		//---------------------------------------------------------------------
		[Benchmark]
		public StringSegment1 New() => _new.TrimStart();
	}
}
