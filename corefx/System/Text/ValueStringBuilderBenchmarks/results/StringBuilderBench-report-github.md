``` ini

BenchmarkDotNet=v0.10.14, OS=ubuntu 16.04
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 4 logical and 4 physical cores
.NET Core SDK=2.1.300
  [Host]     : .NET Core ? (CoreCLR 4.6.26702.0, CoreFX 4.6.26515.06), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0 (CoreCLR 4.6.26515.07, CoreFX 4.6.26515.06), 64bit RyuJIT


```
|                                     Method |             Categories |       Mean |     Error |     StdDev | Scaled | ScaledSD |    Gen 0 |    Gen 1 |    Gen 2 |  Allocated |
|------------------------------------------- |----------------------- |-----------:|----------:|-----------:|-------:|---------:|---------:|---------:|---------:|-----------:|
|                   StringBuilder_AppendChar |             AppendChar |   346.1 us |  4.065 us |  3.6035 us |   1.00 |     0.00 | 111.8164 | 110.8398 | 110.8398 |  391.58 KB |
|             ValueStringBuilder0_AppendChar |             AppendChar |   227.8 us |  2.463 us |  2.3038 us |   0.66 |     0.01 |  59.3262 |  58.5938 |  58.5938 |  195.34 KB |
|             ValueStringBuilder1_AppendChar |             AppendChar |   210.2 us |  1.304 us |  1.2198 us |   0.61 |     0.01 |  58.3496 |  58.3496 |  58.3496 |  195.34 KB |
|                                            |                        |            |           |            |        |          |          |          |          |            |
|                 StringBuilder_AppendString |           AppendString | 1,289.2 us | 13.140 us | 10.9725 us |   1.00 |     0.00 | 332.0313 | 332.0313 | 332.0313 | 1565.16 KB |
|           ValueStringBuilder0_AppendString |           AppendString | 2,944.3 us | 42.710 us | 39.9510 us |   2.28 |     0.04 | 195.3125 | 195.3125 | 195.3125 |  781.28 KB |
|           ValueStringBuilder1_AppendString |           AppendString |   818.8 us |  3.762 us |  3.5190 us |   0.64 |     0.01 | 198.2422 | 198.2422 | 198.2422 |  781.28 KB |
|                                            |                        |            |           |            |        |          |          |          |          |            |
|       StringBuilder_AppendSingleCharString | AppendSingleCharString |   458.2 us |  1.428 us |  1.2658 us |   1.00 |     0.00 | 111.3281 | 110.8398 | 110.8398 |   391.6 KB |
| ValueStringBuilder0_AppendSingleCharString | AppendSingleCharString |   238.1 us |  1.218 us |  0.9512 us |   0.52 |     0.00 |  61.7676 |  58.5938 |  58.5938 |  195.34 KB |
| ValueStringBuilder1_AppendSingleCharString | AppendSingleCharString |   268.1 us |  1.553 us |  1.3771 us |   0.59 |     0.00 |  58.5938 |  58.5938 |  58.5938 |  195.34 KB |
