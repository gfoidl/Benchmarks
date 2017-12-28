using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

namespace StackBenchmarks
{
	[DisassemblyDiagnoser(printSource: true)]
	public class PushBenchmarks
	{
		public static void Run()
		{
			BenchmarkRunner.Run<PushBenchmarks>();
		}
		//---------------------------------------------------------------------
		private const int N = 10_000;
		private Stack0<object> _stack0;
		private Stack1<object> _stack1;
		private Stack2<object> _stack2;
		//---------------------------------------------------------------------
		[Params(0, 10_000)]
		public int InitialCapacity { get; set; }
		//---------------------------------------------------------------------
		[GlobalSetup]
		public void GlobalSetup()
		{
			_stack0 = new Stack0<object>(this.InitialCapacity);
			_stack1 = new Stack1<object>(this.InitialCapacity);
			_stack2 = new Stack2<object>(this.InitialCapacity);
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public void Push_Default()
		{
			if (_stack0.Count < 2 * N)
				_stack0.Push(new object());
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public void Push_New()
		{
			if (_stack1.Count < 2 * N)
				_stack1.Push(new object());
		}
		//---------------------------------------------------------------------
		//[Benchmark]
		public void Push_NewInlining()
		{
			if (_stack2.Count < 2 * N)
				_stack2.Push(new object());
		}
	}
}