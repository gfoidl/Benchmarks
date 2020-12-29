using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using HillClimbinComplex.Implementations;

namespace HillClimbinComplex
{
    [DisassemblyDiagnoser]
    [CategoriesColumn]
    [GroupBenchmarksBy(BenchmarkLogicalGroupRule.ByCategory)]
    [ShortRunJob]
    public class Benchmarks
    {
        private Complex           _default0    = new(Math.PI, Math.E);
        private Complex           _default1    = new(Math.PI, Math.E);
        private ComplexVectorized _vectorized0 = new(Math.PI, Math.E);
        private ComplexVectorized _vectorized1 = new(Math.PI, Math.E);
        private double            _scalar      = 42d;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true, Description = "Default")]
        [BenchmarkCategory("Subtract")]
        public Complex SubtractDefault() => _default0 - _default1;

        [Benchmark(Description = "Vectorized")]
        [BenchmarkCategory("Subtract")]
        public ComplexVectorized SubtractVectorized() => _vectorized0 - _vectorized1;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true, Description = "Default")]
        [BenchmarkCategory("Multiply")]
        public Complex MultiplyDefault() => _scalar * _default0;

        [Benchmark(Description = "Vectorized")]
        public ComplexVectorized MultiplyVectorized() => _scalar * _vectorized0;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true, Description = "Default")]
        [BenchmarkCategory("Divide by scalar")]
        public Complex DivideByScalarDefault() => _default0 / _scalar;

        [Benchmark(Description = "Vectorized")]
        [BenchmarkCategory("Divide by scalar")]
        public ComplexVectorized DivideByScalarVectorized() => _vectorized0 / _scalar;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true, Description = "Default")]
        [BenchmarkCategory("Divide")]
        public Complex DivideDefault() => _default0 / _default1;

        [Benchmark(Description = "Vectorized")]
        [BenchmarkCategory("Divide")]
        public ComplexVectorized DivideVectorized() => _vectorized0 / _vectorized1;
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true, Description = "Default")]
        [BenchmarkCategory("Abs")]
        public double AbsDefault() => _default0.Abs();

        [Benchmark(Description = "Vectorized")]
        [BenchmarkCategory("Abs")]
        public double AbsVectorized() => _vectorized0.Abs();
    }
}
