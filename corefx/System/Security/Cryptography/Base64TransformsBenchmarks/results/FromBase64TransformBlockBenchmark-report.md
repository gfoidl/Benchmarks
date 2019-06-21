``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview7-012550
  [Host]     : .NET Core 3.0.0-preview7-27821-04 (CoreCLR 4.700.19.32101, CoreFX 4.700.19.32001), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview7-27821-04 (CoreCLR 4.700.19.32101, CoreFX 4.700.19.32001), 64bit RyuJIT


```
|   Method |     Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |---------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 197.2 ns | 0.7589 ns | 0.6728 ns |  1.00 | 0.0043 |     - |     - |     128 B |
|       PR | 156.2 ns | 0.7158 ns | 0.6695 ns |  0.79 |      - |     - |     - |         - |
