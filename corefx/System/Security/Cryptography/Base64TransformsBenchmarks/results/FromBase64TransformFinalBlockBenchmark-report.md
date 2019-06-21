``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview7-012550
  [Host]     : .NET Core 3.0.0-preview7-27821-04 (CoreCLR 4.700.19.32101, CoreFX 4.700.19.32001), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview7-27821-04 (CoreCLR 4.700.19.32101, CoreFX 4.700.19.32001), 64bit RyuJIT


```
|   Method |      Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |----------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 210.18 ns | 1.9161 ns | 1.6985 ns |  1.00 | 0.0043 |     - |     - |     128 B |
|       PR |  94.82 ns | 0.3535 ns | 0.3134 ns |  0.45 | 0.0011 |     - |     - |      32 B |
