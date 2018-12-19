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

            benchs.New_wo_ObjectWrapper();
            benchs.New_wo_ObjectWrapper();

            benchs.New_with_ObjectWrapper();
            benchs.New_with_ObjectWrapper();

            benchs.New_with_ObjectWrapper_no_Interface();
            benchs.New_with_ObjectWrapper_no_Interface();
#endif
        }
        //---------------------------------------------------------------------
        private readonly int                         _maximumRetained = Environment.ProcessorCount * 2;
        private readonly DefaultObjectPool0<object>  _pool0;
        private readonly DefaultObjectPool00<object> _pool00;
        private readonly DefaultObjectPool1<object>  _pool1;
        private readonly DefaultObjectPool2<object>  _pool2;
        //---------------------------------------------------------------------
        public HalfFullPoolBenchmarks()
        {
            var policy = new DefaultPooledObjectPolicy<object>();

            _pool0  = new DefaultObjectPool0<object>(policy);
            _pool00 = new DefaultObjectPool00<object>(policy);
            _pool1  = new DefaultObjectPool1<object>(policy);
            _pool2  = new DefaultObjectPool2<object>(new DefaultPooledObjectPolicy2<object>());

            object tmp = null;
            for (int i = 0; i < _maximumRetained; ++i)
            {
                tmp = _pool0 .Get();
                tmp = _pool00.Get();
                tmp = _pool1 .Get();
                tmp = _pool2 .Get();
            }

            for (int i = 0; i < _maximumRetained; ++i)
            {
                _pool0 .Return(tmp);
                _pool00.Return(tmp);
                _pool1 .Return(tmp);
                _pool2 .Return(tmp);
            }

            for (int i = 0; i < _maximumRetained / 2; ++i)
            {
                tmp = _pool0 .Get();
                tmp = _pool00.Get();
                tmp = _pool1 .Get();
                tmp = _pool2 .Get();
            }
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public void Default() => this.Core(_pool0);
        //---------------------------------------------------------------------
        //[Benchmark]
        public void New_wo_ObjectWrapper() => this.Core(_pool00);
        //---------------------------------------------------------------------
        [Benchmark]
        public void New_with_ObjectWrapper() => this.Core(_pool1);
        //---------------------------------------------------------------------
        //[Benchmark]
        public void New_with_ObjectWrapper_no_Interface() => this.Core(_pool2);
        //---------------------------------------------------------------------
        private void Core(ObjectPool<object> pool)
        {
            object tmp = null;

            for (int i = 0; i < _maximumRetained / 2; ++i)
                tmp = pool.Get();

            for (int i = 0; i < _maximumRetained; ++i)
                pool.Return(tmp);

            for (int i = 0; i < _maximumRetained / 2; ++i)
                tmp = pool.Get();
        }
    }
}
