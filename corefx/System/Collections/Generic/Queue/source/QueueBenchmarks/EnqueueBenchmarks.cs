using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace QueueBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	//[Config(typeof(FastAndDirtyConfig))]
	public class EnqueueBenchmarks
	{
		public static void Run()
		{
			BenchmarkRunner.Run<EnqueueBenchmarks>();
		}
		//---------------------------------------------------------------------
		private const int N = 10_000;
		private Queue0<object> _queue0;
		private Queue1<object> _queue1;
		//---------------------------------------------------------------------
		[GlobalSetup]
		public void GlobalSetup()
		{
			_queue0 = new Queue0<object>();
			_queue1 = new Queue1<object>();
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public void Enqueue_Default()
		{
			if (_queue0.Count == N) _queue0.Clear();
			_queue0.Enqueue(new object());
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public void Enqueue_New()
		{
			if (_queue1.Count == N) _queue1.Clear();
			_queue1.Enqueue(new object());
		}
	}
}