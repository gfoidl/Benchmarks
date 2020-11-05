``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|            Method |       N |             Mean |          Error |         StdDev | Ratio | RatioSD |
|------------------ |-------- |-----------------:|---------------:|---------------:|------:|--------:|
|           **Default** |       **2** |         **3.618 ns** |      **0.0774 ns** |      **0.0647 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |       2 |         2.605 ns |      0.0381 ns |      0.0357 ns |  0.72 |    0.01 |
|                   |         |                  |                |                |       |         |
|           **Default** |      **10** |         **8.047 ns** |      **0.1040 ns** |      **0.0973 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |      10 |         5.113 ns |      0.1403 ns |      0.3050 ns |  0.60 |    0.04 |
|                   |         |                  |                |                |       |         |
|           **Default** |     **128** |        **67.897 ns** |      **1.3781 ns** |      **3.1387 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |     128 |        30.986 ns |      0.6380 ns |      0.8732 ns |  0.46 |    0.03 |
|                   |         |                  |                |                |       |         |
|           **Default** |    **1000** |       **493.374 ns** |      **3.9446 ns** |      **3.6898 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |    1000 |       280.290 ns |      2.1701 ns |      2.0299 ns |  0.57 |    0.01 |
|                   |         |                  |                |                |       |         |
|           **Default** | **1000000** | **1,675,257.069 ns** | **23,151.5145 ns** | **19,332.5631 ns** |  **1.00** |    **0.00** |
| ReverseVectorized | 1000000 | 1,601,870.690 ns | 30,032.8501 ns | 28,092.7466 ns |  0.96 |    0.02 |
