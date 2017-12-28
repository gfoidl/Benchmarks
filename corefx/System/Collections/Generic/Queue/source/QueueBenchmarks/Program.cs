using System;
using System.Diagnostics;

namespace QueueBenchmarks
{
	class Program
	{
		static void Main(string[] args)
		{
			if (args.Length != 1)
			{
				Console.WriteLine("one and only arg has to be name of benchmark");
				Environment.Exit(1);
			}

			string arg = args[0];

			switch (arg)
			{
				case nameof(PeekBenchmarks):
					PeekBenchmarks.Run();
					break;
				case nameof(EnqueueBenchmarks):
					EnqueueBenchmarks.Run();
					break;
				case nameof(DequeueBenchmarks):
					DequeueBenchmarks.Run();
					break;
				case nameof(TryDequeueBenchmarks):
					TryDequeueBenchmarks.Run();
					break;
				default:
					Console.WriteLine($"unknown benchmark '{arg}'");
					break;
			}

			if (Debugger.IsAttached)
			{
				Console.WriteLine("\nEnd.");
				Console.ReadKey();
			}
		}
	}
}