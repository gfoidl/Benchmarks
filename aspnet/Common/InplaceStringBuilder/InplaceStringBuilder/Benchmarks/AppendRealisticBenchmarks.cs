using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.Primitives;

namespace InplaceStringBuilder
{
	[MemoryDiagnoser]
	public class AppendRealisticBenchmarks
	{
		public static void Run()
		{
			var benchs = new AppendRealisticBenchmarks();

			Console.WriteLine(benchs.Default());
			Console.WriteLine(benchs.New_Idea());
			Console.WriteLine(benchs.This_PR());
			Console.WriteLine(benchs.This_PR_wo_pre_init());
			Console.WriteLine(benchs.CharArray());
#if !DEBUG
			BenchmarkRunner.Run<AppendRealisticBenchmarks>();
#endif
		}
		//---------------------------------------------------------------------
		[Benchmark(Baseline = true)]
		public string Default()
		{
			var sb = new InplaceStringBuilder0();

			var s1 = "123";
			var c1 = '4';
			var s2 = "56789";
			var seg = new StringSegment("890123", 2, 2);

			sb.Capacity += s1.Length + 1 + s2.Length + seg.Length;
			sb.Append(s1);
			sb.Append(c1);
			sb.Append(s2, 0, 2);
			sb.Append(s2, 2, 2);
			sb.Append(s2, 4, 1);
			sb.Append(seg);

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string This_PR()
		{
			var sb = new InplaceStringBuilder00();

			var s1 = "123";
			var c1 = '4';
			var s2 = "56789";
			var seg = new StringSegment("890123", 2, 2);

			sb.Capacity += s1.Length + 1 + s2.Length + seg.Length;
			sb.Append(s1);
			sb.Append(c1);
			sb.Append(s2, 0, 2);
			sb.Append(s2, 2, 2);
			sb.Append(s2, 4, 1);
			sb.Append(seg);

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string This_PR_wo_pre_init()
		{
			var sb = new InplaceStringBuilder02();

			var s1 = "123";
			var c1 = '4';
			var s2 = "56789";
			var seg = new StringSegment("890123", 2, 2);

			sb.Capacity += s1.Length + 1 + s2.Length + seg.Length;
			sb.Append(s1);
			sb.Append(c1);
			sb.Append(s2, 0, 2);
			sb.Append(s2, 2, 2);
			sb.Append(s2, 4, 1);
			sb.Append(seg);

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		[Benchmark]
		public string New_Idea()
		{
			var sb = new InplaceStringBuilder01();

			var s1 = "123";
			var c1 = '4';
			var s2 = "56789";
			var seg = new StringSegment("890123", 2, 2);

			sb.Capacity += s1.Length + 1 + s2.Length + seg.Length;
			sb.Append(s1);
			sb.Append(c1);
			sb.Append(s2, 0, 2);
			sb.Append(s2, 2, 2);
			sb.Append(s2, 4, 1);
			sb.Append(seg);

			return sb.ToString();
		}
		//---------------------------------------------------------------------
		//[Benchmark]
		public string CharArray()
		{
			var sb = new InplaceStringBuilder1();

			var s1 = "123";
			var c1 = '4';
			var s2 = "56789";
			var seg = new StringSegment("890123", 2, 2);

			sb.Capacity += s1.Length + 1 + s2.Length + seg.Length;
			sb.Append(s1);
			sb.Append(c1);
			sb.Append(s2, 0, 2);
			sb.Append(s2, 2, 2);
			sb.Append(s2, 4, 1);
			sb.Append(seg);

			return sb.ToString();
		}
	}
}
