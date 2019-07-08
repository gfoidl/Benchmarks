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
            {
                var toBaseTransformBlockBenchmark = new ToBase64TransformBlockBenchmark();
                int i0 = toBaseTransformBlockBenchmark.Original();
                int i1 = toBaseTransformBlockBenchmark.PR();
                Debug.Assert(i0 == i1);
            }

            {
                var toBase64TransformFinalBlock = new ToBase64TransformFinalBlockBenchmark();
                byte[] b0 = toBase64TransformFinalBlock.Original();
                byte[] b1 = toBase64TransformFinalBlock.PR();
                Debug.Assert(b0.AsSpan().SequenceEqual(b1));
            }

            {
                var fromBase64TransformBlock = new FromBase64TransformBlockBenchmark();
                int i0 = fromBase64TransformBlock.Original();
                int i1 = fromBase64TransformBlock.PR();
                int i2 = fromBase64TransformBlock.PR_4();
                int i3 = fromBase64TransformBlock.PR_32();
                int i4 = fromBase64TransformBlock.PR_64();
                int i5 = fromBase64TransformBlock.PR_128();
                int i6 = fromBase64TransformBlock.PR_4_128();
                Debug.Assert(i0 == i1);
                Debug.Assert(i0 == i2);
                Debug.Assert(i0 == i3);
                Debug.Assert(i0 == i4);
                Debug.Assert(i0 == i5);
                Debug.Assert(i0 == i6);
            }

            {
                var fromBase64TransformFinalBlock = new FromBase64TransformFinalBlockBenchmark();
                byte[] b0 = fromBase64TransformFinalBlock.Original();
                byte[] b1 = fromBase64TransformFinalBlock.PR();
                Debug.Assert(b0.AsSpan().SequenceEqual(b1));
            }
#if !DEBUG
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
