using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace StackBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	public class PopBenchmarks
	{
		public static void Run()
		{
			BenchmarkRunner.Run<PopBenchmarks>();
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
		public object Pop_Default()
		{
			object tmp = default;

			while (_stack0.Count > 0)
				tmp = _stack0.Pop();

			return tmp;
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public object Pop_New()
		{
			object tmp = default;

			while (_stack1.Count > 0)
				tmp = _stack1.Pop();

			return tmp;
		}
		//---------------------------------------------------------------------
		//[Benchmark]
		public object Pop_NewInlining()
		{
			object tmp = default;

			while (_stack2.Count > 0)
				tmp = _stack2.Pop();

			return tmp;
		}
	}
}