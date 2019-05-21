``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview6-012027
  [Host]     : .NET Core 3.0.0-preview6-27720-08 (CoreCLR 3.0.19.27071, CoreFX 4.700.19.27011), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview6-27720-08 (CoreCLR 3.0.19.27071, CoreFX 4.700.19.27011), 64bit RyuJIT


```
|          Method |     Mean |     Error |    StdDev | Ratio | RatioSD |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|---------------- |---------:|----------:|----------:|------:|--------:|-------:|------:|------:|----------:|
|         Default | 41.26 ns | 0.5889 ns | 0.5221 ns |  1.00 |    0.00 | 0.0076 |     - |     - |      48 B |
|        ROSTrick | 40.24 ns | 0.5159 ns | 0.4826 ns |  0.98 |    0.02 | 0.0076 |     - |     - |      48 B |
|            Simd | 37.90 ns | 0.4350 ns | 0.4069 ns |  0.92 |    0.01 | 0.0076 |     - |     - |      48 B |
| Simd_StaticInit | 39.47 ns | 0.5977 ns | 0.5299 ns |  0.96 |    0.02 | 0.0076 |     - |     - |      48 B |
|   Simd_ROSTrick | 37.71 ns | 0.6634 ns | 0.6205 ns |  0.91 |    0.02 | 0.0076 |     - |     - |      48 B |
