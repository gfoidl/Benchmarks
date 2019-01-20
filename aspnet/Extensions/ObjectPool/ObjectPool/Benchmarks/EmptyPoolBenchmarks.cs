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

            benchs.PR977_Base();
            benchs.PR977_Base();

            benchs.PR977_ScanInlined();
            benchs.PR977_ScanInlined();
#endif
        }
        //---------------------------------------------------------------------
        private readonly DefaultObjectPool0<object> _pool0;
        private readonly DefaultObjectPool1<object> _pool1;
        private readonly DefaultObjectPool2<object> _pool2;
        //---------------------------------------------------------------------
        public EmptyPoolBenchmarks()
        {
            var policy = new DefaultPooledObjectPolicy<object>();

            _pool0 = new DefaultObjectPool0<object>(policy);
            _pool1 = new DefaultObjectPool1<object>(policy);
            _pool2 = new DefaultObjectPool2<object>(policy);
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public object Default() => _pool0.Get();
        //---------------------------------------------------------------------
        [Benchmark]
        public void PR977_Base() => _pool1.Get();
        //---------------------------------------------------------------------
        [Benchmark]
        public void PR977_ScanInlined() => _pool2.Get();
    }
}
