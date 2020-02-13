``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-alpha1-015774
  [Host]     : .NET Core 3.1.1 (CoreCLR 4.700.19.60701, CoreFX 4.700.19.60801), X64 RyuJIT
  DefaultJob : .NET Core 3.1.1 (CoreCLR 4.700.19.60701, CoreFX 4.700.19.60801), X64 RyuJIT


```
|         Method | BytesLen |      Mean |     Error |    StdDev | Ratio | RatioSD |
|--------------- |--------- |----------:|----------:|----------:|------:|--------:|
| Current_master |        4 |  6.431 ns | 0.1013 ns | 0.0846 ns |  1.00 |    0.00 |
|        This_PR |        4 |  5.083 ns | 0.0531 ns | 0.0471 ns |  0.79 |    0.01 |
|                |          |           |           |           |       |         |
| Current_master |        8 |  5.446 ns | 0.0757 ns | 0.0671 ns |  1.00 |    0.00 |
|        This_PR |        8 |  5.071 ns | 0.0529 ns | 0.0495 ns |  0.93 |    0.01 |
|                |          |           |           |           |       |         |
| Current_master |       16 |  7.341 ns | 0.1798 ns | 0.1766 ns |  1.00 |    0.00 |
|        This_PR |       16 |  6.341 ns | 0.1068 ns | 0.0999 ns |  0.86 |    0.03 |
|                |          |           |           |           |       |         |
| Current_master |       32 | 10.612 ns | 0.0405 ns | 0.0379 ns |  1.00 |    0.00 |
|        This_PR |       32 |  8.439 ns | 0.0964 ns | 0.0902 ns |  0.80 |    0.01 |
|                |          |           |           |           |       |         |
| Current_master |      100 | 26.499 ns | 0.2693 ns | 0.2519 ns |  1.00 |    0.00 |
|        This_PR |      100 | 18.494 ns | 0.1560 ns | 0.1459 ns |  0.70 |    0.01 |
