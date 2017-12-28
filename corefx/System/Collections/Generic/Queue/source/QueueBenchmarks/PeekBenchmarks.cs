using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace QueueBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	//[Config(typeof(FastAndDirtyConfig))]
	public class PeekBenchmarks
	{
		public static void Run()
		{
			BenchmarkRunner.Run<PeekBenchmarks>();
		}
		//---------------------------------------------------------------------
		private const int N = 10_000;
		private Queue0<object> _queue0;
		private Queue1<object> _queue1;
		//---------------------------------------------------------------------
		[GlobalSetup]
		public void GlobalSetup()
		{
			_queue0 = new Queue0<object>(N);
			_queue1 = new Queue1<object>(N);

			for (int i = 0; i < N; ++i)
			{
				_queue0.Enqueue(new object());
				_queue1.Enqueue(new object());
			}
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public object Peek_Default()
		{
			return _queue0.Peek();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public object Peek_New()
		{
			return _queue1.Peek();
		}
	}
}