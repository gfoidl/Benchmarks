using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.ObjectPool;

namespace ObjectPool
{
    public class FullPoolBenchmarks
    {
        public static void Run()
        {
#if !DEBUG
            BenchmarkRunner.Run<FullPoolBenchmarks>();
#else
            var benchs = new FullPoolBenchmarks();

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
        public FullPoolBenchmarks()
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
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void Default()
        {
            object obj = _pool0.Get();
            _pool0.Return(obj);
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public void PR977_Base()
        {
            object obj = _pool1.Get();
            _pool1.Return(obj);
        }
    }
}
