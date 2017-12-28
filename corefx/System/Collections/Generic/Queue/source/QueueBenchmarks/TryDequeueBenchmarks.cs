using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace QueueBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	//[Config(typeof(FastAndDirtyConfig))]
	public class TryDequeueBenchmarks
	{
		public static void Run()
		{
			BenchmarkRunner.Run<TryDequeueBenchmarks>();
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
		public object TryDequeue_Default()
		{
			object tmp = default;

			while (_queue0.TryDequeue(out object res))
				tmp = res;

			return tmp;
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public object TryDequeue_New()
		{
			object tmp = default;

			while (_queue1.TryDequeue(out object res))
				tmp = res;

			return tmp;
		}
	}
}