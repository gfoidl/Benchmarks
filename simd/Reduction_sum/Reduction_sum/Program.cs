using System;
using System.Numerics;
using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace Reduction_sum
{
	class Program
	{
		static void Main(string[] args)
		{
			var benchs = new Benchmarks();
			Console.WriteLine(benchs.Loop_local());
			Console.WriteLine(benchs.Loop_field());
			Console.WriteLine(benchs.Dot());
#if !DEBUG
			BenchmarkRunner.Run<Benchmarks>();
#endif
		}
	}
	//-------------------------------------------------------------------------
	[DisassemblyDiagnoser(printSource: true)]
	public class Benchmarks
	{
		private readonly Vector<double> _vec;
		//---------------------------------------------------------------------
		public Benchmarks()
		{
			var vec = new double[Vector<double>.Count];
			var rnd = new Random(0);

			for (int i = 0; i < vec.Length; ++i)
				vec[i] = rnd.NextDouble();

			_vec = new Vector<double>(vec);
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		[MethodImpl(MethodImplOptions.NoInlining)]
		public double Loop_local()
		{
			Vector<double> vec = _vec;
			double sum = 0;

			for (int i = 0; i < Vector<double>.Count; ++i)
				sum += vec[i];

			return sum;
		}
		//---------------------------------------------------------------------
		[Benchmark]
		[MethodImpl(MethodImplOptions.NoInlining)]
		public double Loop_field()
		{
			double sum = 0;

			for (int i = 0; i < Vector<double>.Count; ++i)
				sum += _vec[i];

			return sum;
		}
		//---------------------------------------------------------------------
		[Benchmark]
		[MethodImpl(MethodImplOptions.NoInlining)]
		public double Dot()
		{
			return Vector.Dot(_vec, Vector<double>.One);
		}
	}
}
