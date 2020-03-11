``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|           Method |     Mean |     Error |    StdDev | Ratio |
|----------------- |---------:|----------:|----------:|------:|
|          Default | 3.167 ns | 0.0348 ns | 0.0325 ns |  1.00 |
| InlinedOptimized | 1.274 ns | 0.0125 ns | 0.0117 ns |  0.40 |
|       Vectorized | 1.798 ns | 0.0102 ns | 0.0095 ns |  0.57 |


``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|                            Method |     Mean |     Error |    StdDev | Ratio | RatioSD |
|---------------------------------- |---------:|----------:|----------:|------:|--------:|
|                  InlinedOptimized | 1.272 ns | 0.0078 ns | 0.0073 ns |  1.00 |    0.00 |
|        DefaultReorderedVectorized | 1.544 ns | 0.0204 ns | 0.0191 ns |  1.21 |    0.02 |
| DefaultReorderedVectorizedHotCold | 1.536 ns | 0.0094 ns | 0.0084 ns |  1.21 |    0.01 |
