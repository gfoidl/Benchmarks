using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Horology;
using BenchmarkDotNet.Jobs;

namespace QueueBenchmarks
{
	// https://github.com/dotnet/BenchmarkDotNet/issues/257
	public class FastAndDirtyConfig : ManualConfig
	{
		public FastAndDirtyConfig()
		{
			//Add(DefaultConfig.Instance); // *** add default loggers, reporters etc? ***

			Add(Job.Default
				.WithLaunchCount(1)     // benchmark process will be launched only once
				//.WithIterationTime(new TimeInterval(100_000)) // 100ms per iteration
				.WithInvocationCount(32)
				.WithWarmupCount(3)     // 3 warmup iteration
				.WithTargetCount(3)     // 3 target iteration
			);
		}
	}
}