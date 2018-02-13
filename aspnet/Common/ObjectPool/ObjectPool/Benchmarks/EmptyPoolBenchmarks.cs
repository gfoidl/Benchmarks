using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.ObjectPool;

namespace ObjectPool
{
	public class EmptyPoolBenchmarks
	{
		public static void Run()
		{
#if !DEBUG
			BenchmarkRunner.Run<EmptyPoolBenchmarks>();
#else
			var benchs = new EmptyPoolBenchmarks();

			benchs.Default();
			benchs.Default();

			benchs.New_wo_ObjectWrapper();
			benchs.New_wo_ObjectWrapper();

			benchs.New_with_ObjectWrapper();
			benchs.New_with_ObjectWrapper();
#endif
		}
		//---------------------------------------------------------------------
		private readonly DefaultObjectPool0<object>  _pool0;
		private readonly DefaultObjectPool00<object> _pool00;
		private readonly DefaultObjectPool1<object>  _pool1;
		//---------------------------------------------------------------------
		public EmptyPoolBenchmarks()
		{
			var policy = new DefaultPooledObjectPolicy<object>();

			_pool0 	= new DefaultObjectPool0<object>(policy);
			_pool00 = new DefaultObjectPool00<object>(policy);
			_pool1 	= new DefaultObjectPool1<object>(policy);
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public void Default() => this.Core(_pool0);
		//---------------------------------------------------------------------
		[Benchmark]
		public void New_wo_ObjectWrapper() => this.Core(_pool00);
		//---------------------------------------------------------------------
		[Benchmark]
		public void New_with_ObjectWrapper() => this.Core(_pool1);
		//---------------------------------------------------------------------
		private void Core(ObjectPool<object> pool)
		{
			object obj = pool.Get();
		}
	}
}
