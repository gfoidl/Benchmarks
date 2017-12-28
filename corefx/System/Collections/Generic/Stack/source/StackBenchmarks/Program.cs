﻿using System;
using System.Diagnostics;

namespace StackBenchmarks
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
				case nameof(PopBenchmarks):
					PopBenchmarks.Run();
					break;
				case nameof(TryPopBenchmarks):
					TryPopBenchmarks.Run();
					break;
				case nameof(PeekBenchmarks):
					PeekBenchmarks.Run();
					break;
				case nameof(TryPeekBenchmarks):
					TryPeekBenchmarks.Run();
					break;
				case nameof(PushBenchmarks):
					PushBenchmarks.Run();
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