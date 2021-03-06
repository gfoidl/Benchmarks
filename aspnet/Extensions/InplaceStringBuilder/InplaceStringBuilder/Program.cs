﻿using System;
using System.Diagnostics;

namespace InplaceStringBuilder
{
	static class Program
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
				case nameof(AppendCharBenchmarks):
					AppendCharBenchmarks.Run();
					break;
				case nameof(AppendStringBenchmarks):
					AppendStringBenchmarks.Run();
					break;
				case nameof(AppendRealisticBenchmarks):
					AppendRealisticBenchmarks.Run();
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
