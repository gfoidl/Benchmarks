``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|           Method |     Mean |     Error |    StdDev |   Median | Ratio |
|----------------- |---------:|----------:|----------:|---------:|------:|
|          Default | 6.170 ns | 0.1231 ns | 0.2853 ns | 6.062 ns |  1.00 |
| InlinedOptimized | 2.555 ns | 0.0165 ns | 0.0155 ns | 2.553 ns |  0.39 |
|       Vectorized | 3.018 ns | 0.0239 ns | 0.0224 ns | 3.024 ns |  0.46 |


``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|                            Method |     Mean |     Error |    StdDev | Ratio | RatioSD |
|---------------------------------- |---------:|----------:|----------:|------:|--------:|
|                  InlinedOptimized | 1.299 ns | 0.0105 ns | 0.0088 ns |  1.00 |    0.00 |
|        DefaultReorderedVectorized | 1.311 ns | 0.0247 ns | 0.0275 ns |  1.01 |    0.03 |
| DefaultReorderedVectorizedHotCold | 3.302 ns | 0.0688 ns | 0.1293 ns |  2.57 |    0.13 |
