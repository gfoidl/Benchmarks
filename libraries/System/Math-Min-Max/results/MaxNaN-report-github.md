``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|           Method |     Mean |     Error |    StdDev |   Median | Ratio | RatioSD |
|----------------- |---------:|----------:|----------:|---------:|------:|--------:|
|          Default | 2.359 ns | 0.0469 ns | 0.0796 ns | 2.321 ns |  1.00 |    0.00 |
| InlinedOptimized | 1.280 ns | 0.0084 ns | 0.0079 ns | 1.280 ns |  0.53 |    0.02 |
|       Vectorized | 1.852 ns | 0.0134 ns | 0.0125 ns | 1.853 ns |  0.77 |    0.03 |


``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|                            Method |     Mean |     Error |    StdDev | Ratio | RatioSD |
|---------------------------------- |---------:|----------:|----------:|------:|--------:|
|                  InlinedOptimized | 1.281 ns | 0.0159 ns | 0.0141 ns |  1.00 |    0.00 |
|        DefaultReorderedVectorized | 1.441 ns | 0.0128 ns | 0.0113 ns |  1.12 |    0.02 |
| DefaultReorderedVectorizedHotCold | 2.624 ns | 0.0508 ns | 0.0696 ns |  2.05 |    0.07 |
