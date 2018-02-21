using System;
using System.Text;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.ObjectPool;

namespace ObjectPool
{
	public class StringBuilderFullPoolBenchmarks
	{
		public static void Run()
		{
#if !DEBUG
			BenchmarkRunner.Run<StringBuilderFullPoolBenchmarks>();
#else
			var benchs = new StringBuilderFullPoolBenchmarks();

			benchs.Default();
			benchs.Default();

			benchs.NoInterface();
			benchs.NoInterface();
#endif
		}
		//---------------------------------------------------------------------
		private readonly int _maximumRetained = Environment.ProcessorCount * 2;
		private readonly DefaultObjectPool1<StringBuilder> _pool1;
		private readonly DefaultObjectPool2<StringBuilder> _pool2;
		//---------------------------------------------------------------------
		public StringBuilderFullPoolBenchmarks()
		{
			var policy0 = new StringBuilderPooledObjectPolicy();
			var policy1 = new StringBuilderPooledObjectPolicy1();

			_pool1 = new DefaultObjectPool1<StringBuilder>(policy0);
			_pool2 = new DefaultObjectPool2<StringBuilder>(policy1);

			StringBuilder tmp = null;
			for (int i = 0; i < _maximumRetained; ++i)
			{
				tmp = _pool1.Get();
				tmp = _pool2.Get();
			}

			for (int i = 0; i < _maximumRetained; ++i)
			{
				_pool1.Return(tmp);
				_pool2.Return(tmp);
			}
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public void Default() => this.Core(_pool1);
		//---------------------------------------------------------------------
		[Benchmark]
		public void NoInterface() => this.Core(_pool2);
		//---------------------------------------------------------------------
		private void Core(ObjectPool<StringBuilder> pool)
		{
			StringBuilder obj = pool.Get();
			pool.Return(obj);
		}
	}
}
