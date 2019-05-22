``` ini

BenchmarkDotNet=v0.11.5, OS=ubuntu 18.10
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview6-012027
  [Host]     : .NET Core 3.0.0-preview6-27720-08 (CoreCLR 3.0.19.27071, CoreFX 4.700.19.27011), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview6-27720-08 (CoreCLR 3.0.19.27071, CoreFX 4.700.19.27011), 64bit RyuJIT


```
|          Method |     Mean |     Error |    StdDev | Ratio | Gen 0 | Gen 1 | Gen 2 | Allocated |
|---------------- |---------:|----------:|----------:|------:|------:|------:|------:|----------:|
|         Default | 132.5 us | 0.7602 us | 0.6348 us |  1.00 |     - |     - |     - |      48 B |
|            Simd | 116.0 us | 0.5169 us | 0.4582 us |  0.88 |     - |     - |     - |      48 B |
| Simd_StaticInit | 116.2 us | 0.8551 us | 0.7580 us |  0.88 |     - |     - |     - |      48 B |
|   Simd_ROSTrick | 116.8 us | 1.4949 us | 1.3983 us |  0.88 |     - |     - |     - |      48 B |
