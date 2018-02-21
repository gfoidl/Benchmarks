#define COMPARE_ORIGINAL
//-----------------------------------------------------------------------------
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
#if COMPARE_ORIGINAL
			benchs.Original();
			benchs.Original();
#endif
			benchs.Default();
			benchs.Default();

			benchs.NoInterface();
			benchs.NoInterface();

			benchs.Expressions();
			benchs.Expressions();

			benchs.DynamicMethod();
			benchs.DynamicMethod();
#endif
		}
		//---------------------------------------------------------------------
		private readonly int _maximumRetained = Environment.ProcessorCount * 2;
#if COMPARE_ORIGINAL
		private readonly DefaultObjectPool0<StringBuilder> _pool0;
#endif
		private readonly DefaultObjectPool1<StringBuilder> _pool1;
		private readonly DefaultObjectPool2<StringBuilder> _pool2;
		private readonly DefaultObjectPool3<StringBuilder> _pool3;
		private readonly DefaultObjectPool4<StringBuilder> _pool4;
		//---------------------------------------------------------------------
		public StringBuilderFullPoolBenchmarks()
		{
			var policy0 = new StringBuilderPooledObjectPolicy();
			var policy1 = new StringBuilderPooledObjectPolicy1();
#if COMPARE_ORIGINAL
			_pool0 = new DefaultObjectPool0<StringBuilder>(policy0);	
#endif
			_pool1 = new DefaultObjectPool1<StringBuilder>(policy0);
			_pool2 = new DefaultObjectPool2<StringBuilder>(policy1);
			_pool3 = new DefaultObjectPool3<StringBuilder>(policy0);
			_pool4 = new DefaultObjectPool4<StringBuilder>(policy0);

			StringBuilder tmp = null;
			for (int i = 0; i < _maximumRetained; ++i)
			{
#if COMPARE_ORIGINAL
				tmp = _pool0.Get();
#endif
				tmp = _pool1.Get();
				tmp = _pool2.Get();
				tmp = _pool3.Get();
				tmp = _pool4.Get();
			}

			for (int i = 0; i < _maximumRetained; ++i)
			{
#if COMPARE_ORIGINAL
				_pool0.Return(tmp);
#endif
				_pool1.Return(tmp);
				_pool2.Return(tmp);
				_pool3.Return(tmp);
				_pool4.Return(tmp);
			}
		}
		//---------------------------------------------------------------------
#if COMPARE_ORIGINAL
		[Benchmark(Baseline = true)]
		public void Original() => this.Core(_pool0);
		//---------------------------------------------------------------------
		[Benchmark]
#else
		[Benchmark(Baseline = true)]
#endif
		public void Default() => this.Core(_pool1);
		//---------------------------------------------------------------------
		[Benchmark]
		public void NoInterface() => this.Core(_pool2);
		//---------------------------------------------------------------------
		[Benchmark]
		public void Expressions() => this.Core(_pool3);
		//---------------------------------------------------------------------
		[Benchmark]
		public void DynamicMethod() => this.Core(_pool4);
		//---------------------------------------------------------------------
		private void Core(ObjectPool<StringBuilder> pool)
		{
			StringBuilder obj = pool.Get();
			pool.Return(obj);
		}
	}
}
