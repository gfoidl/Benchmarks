``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview8-012950
  [Host]     : .NET Core 3.0.0-preview8-27908-08 (CoreCLR 4.700.19.35801, CoreFX 4.700.19.35806), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview8-27908-08 (CoreCLR 4.700.19.35801, CoreFX 4.700.19.35806), 64bit RyuJIT


```
|   Method |      Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |----------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 196.32 ns | 1.7872 ns | 1.6718 ns |  1.00 | 0.0043 |     - |     - |     128 B |
|       PR |  99.09 ns | 0.4190 ns | 0.3715 ns |  0.51 | 0.0011 |     - |     - |      32 B |
