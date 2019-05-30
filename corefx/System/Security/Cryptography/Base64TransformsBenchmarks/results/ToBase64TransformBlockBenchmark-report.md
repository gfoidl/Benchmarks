``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview6-012124
  [Host]     : .NET Core 3.0.0-preview6-27729-07 (CoreCLR 4.700.19.27904, CoreFX 4.700.19.27905), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview6-27729-07 (CoreCLR 4.700.19.27904, CoreFX 4.700.19.27905), 64bit RyuJIT


```
|   Method |     Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |---------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 85.65 ns | 0.4726 ns | 0.4189 ns |  1.00 | 0.0101 |     - |     - |      64 B |
|       PR | 30.24 ns | 0.3475 ns | 0.3080 ns |  0.35 |      - |     - |     - |         - |
