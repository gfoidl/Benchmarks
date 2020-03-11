``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|           Method |     Mean |     Error |    StdDev | Ratio |
|----------------- |---------:|----------:|----------:|------:|
|          Default | 6.700 ns | 0.0993 ns | 0.0929 ns |  1.00 |
| InlinedOptimized | 2.621 ns | 0.0404 ns | 0.0337 ns |  0.39 |
|       Vectorized | 2.970 ns | 0.0366 ns | 0.0324 ns |  0.44 |


``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|                            Method |     Mean |     Error |    StdDev | Ratio | RatioSD |
|---------------------------------- |---------:|----------:|----------:|------:|--------:|
|                  InlinedOptimized | 1.264 ns | 0.0097 ns | 0.0090 ns |  1.00 |    0.00 |
|        DefaultReorderedVectorized | 1.264 ns | 0.0092 ns | 0.0086 ns |  1.00 |    0.01 |
| DefaultReorderedVectorizedHotCold | 2.860 ns | 0.0155 ns | 0.0129 ns |  2.26 |    0.02 |
