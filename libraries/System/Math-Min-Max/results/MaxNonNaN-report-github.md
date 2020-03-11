``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|           Method |     Mean |     Error |    StdDev | Ratio | RatioSD |
|----------------- |---------:|----------:|----------:|------:|--------:|
|          Default | 3.244 ns | 0.0634 ns | 0.0529 ns |  1.00 |    0.00 |
| InlinedOptimized | 1.421 ns | 0.0361 ns | 0.0518 ns |  0.44 |    0.02 |
|       Vectorized | 1.925 ns | 0.0198 ns | 0.0176 ns |  0.59 |    0.01 |


``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|                            Method |     Mean |     Error |    StdDev | Ratio | RatioSD |
|---------------------------------- |---------:|----------:|----------:|------:|--------:|
|                  InlinedOptimized | 1.284 ns | 0.0110 ns | 0.0097 ns |  1.00 |    0.00 |
|        DefaultReorderedVectorized | 1.631 ns | 0.0310 ns | 0.0290 ns |  1.27 |    0.03 |
| DefaultReorderedVectorizedHotCold | 1.631 ns | 0.0318 ns | 0.0379 ns |  1.27 |    0.03 |
