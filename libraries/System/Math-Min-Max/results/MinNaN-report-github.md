``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.2.20153.5
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.15211, CoreFX 5.0.20.15211), X64 RyuJIT


```
|           Method |     Mean |     Error |    StdDev | Ratio |
|----------------- |---------:|----------:|----------:|------:|
|          Default | 2.325 ns | 0.0249 ns | 0.0221 ns |  1.00 |
| InlinedOptimized | 1.278 ns | 0.0084 ns | 0.0075 ns |  0.55 |
|       Vectorized | 1.914 ns | 0.0239 ns | 0.0224 ns |  0.82 |
