using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace StackBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	public class TryPeekBenchmarks
	{
		public static void Run()
		{
			BenchmarkRunner.Run<TryPeekBenchmarks>();
		}
		//---------------------------------------------------------------------
		private const int N = 10_000;
		private Stack0<object> _stack0;
		private Stack1<object> _stack1;
		private Stack2<object> _stack2;
		//---------------------------------------------------------------------
		[GlobalSetup]
		public void GlobalSetup()
		{
			_stack0 = new Stack0<object>(N);
			_stack1 = new Stack1<object>(N);
			_stack2 = new Stack2<object>(N);

			for (int i = 0; i < N; ++i)
			{
				_stack0.Push(new object());
				_stack1.Push(new object());
				_stack2.Push(new object());
			}
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public object TryPeek_Default()
		{
			object res = default;

			_stack0.TryPeek(out res);

			return res;
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public object TryPeek_New()
		{
			object res = default;

			_stack1.TryPeek(out res);

			return res;
		}
		//---------------------------------------------------------------------
		//[Benchmark]
		public object TryPeek_NewInlining()
		{
			object res = default;

			_stack2.TryPeek(out res);

			return res;
		}
	}
}