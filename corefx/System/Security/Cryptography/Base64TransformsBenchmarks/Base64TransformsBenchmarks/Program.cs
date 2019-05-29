using System;
using System.Diagnostics;
using Base64TransformsBenchmarks.Benchmarks;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace Base64TransformsBenchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            var toBaseTransformBlockBenchmark = new ToBase64TransformBlockBenchmark();
            int i0 = toBaseTransformBlockBenchmark.Original();
            int i1 = toBaseTransformBlockBenchmark.PR();
            Debug.Assert(i0 == i1);

            var toBase64TransformFinalBlock = new ToBase64TransformFinalBlockBenchmark();
            byte[] b0 = toBase64TransformFinalBlock.Original();
            byte[] b1 = toBase64TransformFinalBlock.PR();
            Debug.Assert(b0.AsSpan().SequenceEqual(b1));

            var fromBase64TransformBlock = new FromBase64TransformBlockBenchmark();
            i0 = toBaseTransformBlockBenchmark.Original();
            i1 = toBaseTransformBlockBenchmark.PR();
            Debug.Assert(i0 == i1);

            var fromBase64TransformFinalBlock = new FromBase64TransformFinalBlockBenchmark();
            b0 = toBase64TransformFinalBlock.Original();
            b1 = toBase64TransformFinalBlock.PR();
            Debug.Assert(b0.AsSpan().SequenceEqual(b1));
#if !DEBUG
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
