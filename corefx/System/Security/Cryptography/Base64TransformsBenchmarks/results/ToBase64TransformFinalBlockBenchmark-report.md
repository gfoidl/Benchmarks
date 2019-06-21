``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview7-012550
  [Host]     : .NET Core 3.0.0-preview7-27821-04 (CoreCLR 4.700.19.32101, CoreFX 4.700.19.32001), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview7-27821-04 (CoreCLR 4.700.19.32101, CoreFX 4.700.19.32001), 64bit RyuJIT


```
|   Method |     Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |---------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 71.26 ns | 0.2582 ns | 0.2156 ns |  1.00 | 0.0021 |     - |     - |      64 B |
|       PR | 41.39 ns | 0.2874 ns | 0.2548 ns |  0.58 | 0.0011 |     - |     - |      32 B |
