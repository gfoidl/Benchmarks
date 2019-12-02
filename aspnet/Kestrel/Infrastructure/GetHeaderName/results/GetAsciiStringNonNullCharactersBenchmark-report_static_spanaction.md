``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-alpha1-015774
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|                        Method | BytesLen |     Mean |    Error |   StdDev | Ratio | RatioSD |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|------------------------------ |--------- |---------:|---------:|---------:|------:|--------:|-------:|------:|------:|----------:|
|                  StringCreate |        4 | 16.98 ns | 0.318 ns | 0.297 ns |  1.00 |    0.00 | 0.0102 |     - |     - |      32 B |
| StringCreate_staticSpanAction |        4 | 14.66 ns | 0.288 ns | 0.256 ns |  0.86 |    0.02 | 0.0102 |     - |     - |      32 B |
|                               |          |          |          |          |       |         |        |       |       |           |
|                  StringCreate |        8 | 19.99 ns | 0.464 ns | 0.848 ns |  1.00 |    0.00 | 0.0127 |     - |     - |      40 B |
| StringCreate_staticSpanAction |        8 | 16.20 ns | 0.424 ns | 1.031 ns |  0.84 |    0.06 | 0.0127 |     - |     - |      40 B |
|                               |          |          |          |          |       |         |        |       |       |           |
|                  StringCreate |       16 | 17.07 ns | 0.435 ns | 0.518 ns |  1.00 |    0.00 | 0.0178 |     - |     - |      56 B |
| StringCreate_staticSpanAction |       16 | 15.04 ns | 0.364 ns | 0.323 ns |  0.88 |    0.03 | 0.0178 |     - |     - |      56 B |
|                               |          |          |          |          |       |         |        |       |       |           |
|                  StringCreate |       32 | 19.39 ns | 0.308 ns | 0.273 ns |  1.00 |    0.00 | 0.0280 |     - |     - |      88 B |
| StringCreate_staticSpanAction |       32 | 17.56 ns | 0.297 ns | 0.248 ns |  0.91 |    0.02 | 0.0280 |     - |     - |      88 B |
|                               |          |          |          |          |       |         |        |       |       |           |
|                  StringCreate |      100 | 33.90 ns | 0.417 ns | 0.348 ns |  1.00 |    0.00 | 0.0714 |     - |     - |     224 B |
| StringCreate_staticSpanAction |      100 | 32.84 ns | 0.849 ns | 1.011 ns |  0.98 |    0.03 | 0.0714 |     - |     - |     224 B |
