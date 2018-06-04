``` ini

BenchmarkDotNet=v0.10.14, OS=ubuntu 16.04
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 4 logical and 4 physical cores
.NET Core SDK=2.1.300
  [Host]     : .NET Core ? (CoreCLR 4.6.26702.0, CoreFX 4.6.26515.06), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0 (CoreCLR 4.6.26515.07, CoreFX 4.6.26515.06), 64bit RyuJIT


```
|                           Method |   Categories |       Mean |     Error |    StdDev | Scaled | ScaledSD |    Gen 0 |    Gen 1 |    Gen 2 |  Allocated |
|--------------------------------- |------------- |-----------:|----------:|----------:|-------:|---------:|---------:|---------:|---------:|-----------:|
|         StringBuilder_AppendChar |   AppendChar |   360.0 us |  5.702 us |  5.055 us |   1.00 |     0.00 | 111.3281 | 110.8398 | 110.8398 |   391.6 KB |
|   ValueStringBuilder0_AppendChar |   AppendChar |   230.2 us |  3.250 us |  3.040 us |   0.64 |     0.01 |  61.2793 |  58.5938 |  58.5938 |  195.34 KB |
|   ValueStringBuilder1_AppendChar |   AppendChar |   213.2 us |  4.003 us |  3.932 us |   0.59 |     0.01 |  58.5938 |  58.3496 |  58.3496 |  195.34 KB |
|                                  |              |            |           |           |        |          |          |          |          |            |
|       StringBuilder_AppendString | AppendString | 1,314.9 us | 31.264 us | 30.705 us |   1.00 |     0.00 | 375.0000 | 341.7969 | 248.0469 | 1573.09 KB |
| ValueStringBuilder0_AppendString | AppendString | 2,740.3 us | 22.909 us | 20.309 us |   2.09 |     0.05 | 179.6875 | 179.6875 | 179.6875 |  781.28 KB |
| ValueStringBuilder1_AppendString | AppendString |   877.5 us |  9.289 us |  8.234 us |   0.67 |     0.02 | 185.5469 | 185.5469 | 185.5469 |  781.28 KB |
