using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.ObjectPool;

namespace ObjectPool
{
    public class HalfFullPoolBenchmarks
    {
        public static void Run()
        {
#if !DEBUG
            BenchmarkRunner.Run<HalfFullPoolBenchmarks>();
#else
            var benchs = new HalfFullPoolBenchmarks();

            benchs.Default();
            benchs.Default();

            benchs.PR977_Base();
            benchs.PR977_Base();
#endif
        }
        //---------------------------------------------------------------------
        private readonly int                        _maximumRetained = Environment.ProcessorCount * 2;
        private readonly DefaultObjectPool0<object> _pool0;
        private readonly DefaultObjectPool1<object>     _pool1;
        //---------------------------------------------------------------------
        public HalfFullPoolBenchmarks()
        {
            var policy = new DefaultPooledObjectPolicy<object>();

            _pool0 = new DefaultObjectPool0<object>(policy);
            _pool1 = new DefaultObjectPool1<object>(policy);

            object tmp = null;
            for (int i = 0; i < _maximumRetained; ++i)
            {
                tmp = _pool0.Get();
                tmp = _pool1.Get();
            }

            for (int i = 0; i < _maximumRetained; ++i)
            {
                _pool0.Return(tmp);
                _pool1.Return(tmp);
            }

            for (int i = 0; i < _maximumRetained / 2; ++i)
            {
                tmp = _pool0.Get();
                tmp = _pool1.Get();
            }
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void Default()
        {
            object tmp = null;

            for (int i = 0; i < _maximumRetained / 2; ++i)
                tmp = _pool0.Get();

            for (int i = 0; i < _maximumRetained; ++i)
                _pool0.Return(tmp);

            for (int i = 0; i < _maximumRetained / 2; ++i)
                tmp = _pool0.Get();
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public void PR977_Base()
        {
            object tmp = null;

            for (int i = 0; i < _maximumRetained / 2; ++i)
                tmp = _pool1.Get();

            for (int i = 0; i < _maximumRetained; ++i)
                _pool1.Return(tmp);

            for (int i = 0; i < _maximumRetained / 2; ++i)
                tmp = _pool1.Get();
        }
    }
}
