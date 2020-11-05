``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|            Method |       N |            Mean |         Error |        StdDev | Ratio | RatioSD |
|------------------ |-------- |----------------:|--------------:|--------------:|------:|--------:|
|           **Default** |       **2** |        **23.06 ns** |      **0.173 ns** |      **0.162 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |       2 |        21.24 ns |      0.131 ns |      0.122 ns |  0.92 |    0.01 |
|                   |         |                 |               |               |       |         |
|           **Default** |      **10** |        **43.90 ns** |      **0.288 ns** |      **0.269 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |      10 |        25.40 ns |      0.537 ns |      0.995 ns |  0.56 |    0.03 |
|                   |         |                 |               |               |       |         |
|           **Default** |     **128** |       **350.04 ns** |      **1.145 ns** |      **0.956 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |     128 |        37.84 ns |      0.759 ns |      0.903 ns |  0.11 |    0.00 |
|                   |         |                 |               |               |       |         |
|           **Default** |    **1000** |     **2,587.96 ns** |     **19.737 ns** |     **17.496 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |    1000 |       184.46 ns |      1.590 ns |      1.488 ns |  0.07 |    0.00 |
|                   |         |                 |               |               |       |         |
|           **Default** | **1000000** | **2,669,910.51 ns** | **31,643.650 ns** | **29,599.490 ns** |  **1.00** |    **0.00** |
| ReverseVectorized | 1000000 |   624,742.80 ns | 11,806.829 ns | 14,055.190 ns |  0.24 |    0.01 |
