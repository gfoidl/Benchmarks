``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-alpha1-015774
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|                              Method | BytesLen |     Mean |    Error |   StdDev | Ratio | RatioSD |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|------------------------------------ |--------- |---------:|---------:|---------:|------:|--------:|-------:|------:|------:|----------:|
|                             Default |        4 | 14.98 ns | 0.376 ns | 0.334 ns |  1.00 |    0.00 | 0.0102 |     - |     - |      32 B |
| Default_withImprovedStringUtitlites |        4 | 14.84 ns | 0.269 ns | 0.252 ns |  0.99 |    0.03 | 0.0102 |     - |     - |      32 B |
|                        StringCreate |        4 | 14.96 ns | 0.360 ns | 0.336 ns |  1.00 |    0.04 | 0.0102 |     - |     - |      32 B |
|                                     |          |          |          |          |       |         |        |       |       |           |
|                             Default |        8 | 16.86 ns | 0.563 ns | 0.860 ns |  1.00 |    0.00 | 0.0127 |     - |     - |      40 B |
| Default_withImprovedStringUtitlites |        8 | 16.12 ns | 0.229 ns | 0.203 ns |  0.94 |    0.05 | 0.0127 |     - |     - |      40 B |
|                        StringCreate |        8 | 15.59 ns | 0.376 ns | 0.369 ns |  0.91 |    0.05 | 0.0127 |     - |     - |      40 B |
|                                     |          |          |          |          |       |         |        |       |       |           |
|                             Default |       16 | 22.27 ns | 0.493 ns | 0.462 ns |  1.00 |    0.00 | 0.0178 |     - |     - |      56 B |
| Default_withImprovedStringUtitlites |       16 | 15.77 ns | 0.222 ns | 0.197 ns |  0.71 |    0.02 | 0.0178 |     - |     - |      56 B |
|                        StringCreate |       16 | 15.39 ns | 0.396 ns | 0.604 ns |  0.70 |    0.03 | 0.0179 |     - |     - |      56 B |
|                                     |          |          |          |          |       |         |        |       |       |           |
|                             Default |       32 | 18.00 ns | 0.449 ns | 0.699 ns |  1.00 |    0.00 | 0.0280 |     - |     - |      88 B |
| Default_withImprovedStringUtitlites |       32 | 18.59 ns | 0.457 ns | 0.813 ns |  1.04 |    0.06 | 0.0280 |     - |     - |      88 B |
|                        StringCreate |       32 | 17.29 ns | 0.232 ns | 0.206 ns |  0.95 |    0.05 | 0.0280 |     - |     - |      88 B |
|                                     |          |          |          |          |       |         |        |       |       |           |
|                             Default |      100 | 36.13 ns | 0.814 ns | 1.058 ns |  1.00 |    0.00 | 0.0714 |     - |     - |     224 B |
| Default_withImprovedStringUtitlites |      100 | 32.14 ns | 0.773 ns | 0.645 ns |  0.89 |    0.03 | 0.0714 |     - |     - |     224 B |
|                        StringCreate |      100 | 32.01 ns | 0.834 ns | 0.739 ns |  0.89 |    0.03 | 0.0714 |     - |     - |     224 B |
