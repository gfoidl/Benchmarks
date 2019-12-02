``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|           Method | BytesLen |      Mean |     Error |    StdDev | Ratio | RatioSD |
|----------------- |--------- |----------:|----------:|----------:|------:|--------:|
|          Default |        4 |  5.924 ns | 0.1577 ns | 0.2311 ns |  1.00 |    0.00 |
|           ThisPR |        4 |  6.853 ns | 0.1514 ns | 0.1416 ns |  1.14 |    0.05 |
| ThisPR_ExitEarly |        4 |  5.963 ns | 0.0912 ns | 0.0853 ns |  0.99 |    0.03 |
|                  |          |           |           |           |       |         |
|          Default |        8 |  6.913 ns | 0.0548 ns | 0.0512 ns |  1.00 |    0.00 |
|           ThisPR |        8 |  7.557 ns | 0.1806 ns | 0.2008 ns |  1.09 |    0.03 |
| ThisPR_ExitEarly |        8 |  6.055 ns | 0.0645 ns | 0.0603 ns |  0.88 |    0.01 |
|                  |          |           |           |           |       |         |
|          Default |       16 |  9.547 ns | 0.2118 ns | 0.1768 ns |  1.00 |    0.00 |
|           ThisPR |       16 |  5.080 ns | 0.1395 ns | 0.1492 ns |  0.53 |    0.02 |
| ThisPR_ExitEarly |       16 |  4.330 ns | 0.0464 ns | 0.0412 ns |  0.45 |    0.01 |
|                  |          |           |           |           |       |         |
|          Default |       32 |  7.693 ns | 0.1898 ns | 0.2031 ns |  1.00 |    0.00 |
|           ThisPR |       32 |  5.212 ns | 0.1429 ns | 0.1755 ns |  0.68 |    0.03 |
| ThisPR_ExitEarly |       32 |  4.647 ns | 0.1311 ns | 0.1962 ns |  0.60 |    0.03 |
|                  |          |           |           |           |       |         |
|          Default |      100 | 13.635 ns | 0.3478 ns | 0.4875 ns |  1.00 |    0.00 |
|           ThisPR |      100 | 11.991 ns | 0.2784 ns | 0.3419 ns |  0.88 |    0.04 |
| ThisPR_ExitEarly |      100 | 10.712 ns | 0.2825 ns | 0.4228 ns |  0.79 |    0.04 |
