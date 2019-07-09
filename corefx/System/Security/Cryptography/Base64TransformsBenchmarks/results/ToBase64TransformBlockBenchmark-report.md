``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview8-012950
  [Host]     : .NET Core 3.0.0-preview8-27908-08 (CoreCLR 4.700.19.35801, CoreFX 4.700.19.35806), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview8-27908-08 (CoreCLR 4.700.19.35801, CoreFX 4.700.19.35806), 64bit RyuJIT


```
|   Method |     Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |---------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 93.26 ns | 1.7920 ns | 1.7600 ns |  1.00 | 0.0021 |     - |     - |      64 B |
|       PR | 30.05 ns | 0.5449 ns | 0.4830 ns |  0.32 |      - |     - |     - |         - |
