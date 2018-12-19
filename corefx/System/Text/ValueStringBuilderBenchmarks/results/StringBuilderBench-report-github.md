``` ini

BenchmarkDotNet=v0.10.14, OS=ubuntu 16.04
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 4 logical and 4 physical cores
.NET Core SDK=2.1.300
  [Host]     : .NET Core ? (CoreCLR 4.6.26702.0, CoreFX 4.6.26515.06), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0 (CoreCLR 4.6.26515.07, CoreFX 4.6.26515.06), 64bit RyuJIT


```
|                                     Method |             Categories |       Mean |     Error |    StdDev | Scaled | ScaledSD |    Gen 0 |    Gen 1 |    Gen 2 |  Allocated |
|------------------------------------------- |----------------------- |-----------:|----------:|----------:|-------:|---------:|---------:|---------:|---------:|-----------:|
|                 StringBuilder_AppendString |           AppendString | 1,331.0 us | 26.521 us | 33.540 us |   1.00 |     0.00 | 332.0313 | 332.0313 | 332.0313 | 1565.16 KB |
|           ValueStringBuilder0_AppendString |           AppendString | 2,378.5 us | 16.157 us | 14.323 us |   1.79 |     0.04 | 195.3125 | 195.3125 | 195.3125 |  781.28 KB |
|           ValueStringBuilder1_AppendString |           AppendString |   846.3 us | 16.374 us | 19.492 us |   0.64 |     0.02 | 198.2422 | 198.2422 | 198.2422 |  781.28 KB |
|           ValueStringBuilder2_AppendString |           AppendString |   875.6 us | 15.632 us | 19.770 us |   0.66 |     0.02 | 198.2422 | 198.2422 | 198.2422 |  781.28 KB |
|                                            |                        |            |           |           |        |          |          |          |          |            |
|       StringBuilder_AppendSingleCharString | AppendSingleCharString |   472.7 us |  9.280 us |  8.680 us |   1.00 |     0.00 | 111.3281 | 110.8398 | 110.8398 |   391.6 KB |
| ValueStringBuilder0_AppendSingleCharString | AppendSingleCharString |   272.5 us |  5.381 us |  5.285 us |   0.58 |     0.01 |  59.0820 |  58.1055 |  58.1055 |  195.34 KB |
| ValueStringBuilder1_AppendSingleCharString | AppendSingleCharString |   288.4 us |  5.711 us |  8.191 us |   0.61 |     0.02 |  60.5469 |  58.5938 |  58.5938 |  195.34 KB |
| ValueStringBuilder2_AppendSingleCharString | AppendSingleCharString |   251.7 us |  5.021 us |  7.359 us |   0.53 |     0.02 |  60.3027 |  58.5938 |  58.5938 |  195.34 KB |
