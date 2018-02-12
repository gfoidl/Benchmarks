using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;
using Microsoft.Extensions.Primitives;

namespace InplaceStringBuilder
{
	public class AppendRealisticBenchmarks
	{
		public static void Run()
		{
			var benchs = new AppendRealisticBenchmarks();

			Console.WriteLine(benchs.Default());
			Console.WriteLine(benchs.Default_ThrowHelper());
			Console.WriteLine(benchs.Default_ThrowHelper_AggressiveInlining());
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
		public string Default_ThrowHelper_AggressiveInlining()
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
		public string Default_ThrowHelper()
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
		[Benchmark]
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
