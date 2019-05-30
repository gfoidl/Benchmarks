``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview6-012124
  [Host]     : .NET Core 3.0.0-preview6-27729-07 (CoreCLR 4.700.19.27904, CoreFX 4.700.19.27905), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview6-27729-07 (CoreCLR 4.700.19.27904, CoreFX 4.700.19.27905), 64bit RyuJIT


```
|   Method |      Mean |     Error |    StdDev | Ratio |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|--------- |----------:|----------:|----------:|------:|-------:|------:|------:|----------:|
| Original | 199.08 ns | 1.0918 ns | 1.0212 ns |  1.00 | 0.0203 |     - |     - |     128 B |
|       PR |  83.15 ns | 0.7017 ns | 0.6564 ns |  0.42 |      - |     - |     - |         - |
