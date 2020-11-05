``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|            Method |       N |           Mean |         Error |        StdDev | Ratio | RatioSD |
|------------------ |-------- |---------------:|--------------:|--------------:|------:|--------:|
|           **Default** |       **2** |       **2.926 ns** |     **0.0917 ns** |     **0.0813 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |       2 |       3.161 ns |     0.0984 ns |     0.1053 ns |  1.09 |    0.05 |
|                   |         |                |               |               |       |         |
|           **Default** |      **10** |       **5.647 ns** |     **0.0283 ns** |     **0.0265 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |      10 |       5.645 ns |     0.0668 ns |     0.0592 ns |  1.00 |    0.01 |
|                   |         |                |               |               |       |         |
|           **Default** |     **128** |      **44.907 ns** |     **0.9623 ns** |     **1.3801 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |     128 |       7.179 ns |     0.1467 ns |     0.1373 ns |  0.16 |    0.01 |
|                   |         |                |               |               |       |         |
|           **Default** |    **1000** |     **335.830 ns** |     **6.8734 ns** |     **7.0584 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |    1000 |      42.780 ns |     0.6537 ns |     0.5458 ns |  0.13 |    0.00 |
|                   |         |                |               |               |       |         |
|           **Default** | **1000000** | **350,087.749 ns** | **6,929.9314 ns** | **6,482.2621 ns** |  **1.00** |    **0.00** |
| ReverseVectorized | 1000000 |  66,234.572 ns | 1,548.6927 ns | 4,517.6092 ns |  0.19 |    0.01 |
