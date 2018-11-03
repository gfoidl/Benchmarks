using BenchmarkDotNet.Attributes;

#if OS_WIN
using BenchmarkDotNet.Attributes.Jobs;
#endif

namespace WebEncodersBench.Benchmarks
{
#if OS_WIN
    [CoreJob, ClrJob]
#endif
    [MemoryDiagnoser]
    public abstract class BaseBenchmark { }
}
