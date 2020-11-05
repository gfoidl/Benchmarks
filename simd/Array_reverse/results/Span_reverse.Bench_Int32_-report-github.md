``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|            Method |       N |           Mean |          Error |         StdDev | Ratio | RatioSD |
|------------------ |-------- |---------------:|---------------:|---------------:|------:|--------:|
|           **Default** |       **2** |       **2.636 ns** |      **0.0389 ns** |      **0.0325 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |       2 |       3.033 ns |      0.0568 ns |      0.0531 ns |  1.15 |    0.03 |
|                   |         |                |                |                |       |         |
|           **Default** |      **10** |       **5.663 ns** |      **0.1923 ns** |      **0.1975 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |      10 |       4.021 ns |      0.0331 ns |      0.0310 ns |  0.71 |    0.02 |
|                   |         |                |                |                |       |         |
|           **Default** |     **128** |      **45.169 ns** |      **0.3598 ns** |      **0.3190 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |     128 |      11.147 ns |      0.2576 ns |      0.4511 ns |  0.24 |    0.01 |
|                   |         |                |                |                |       |         |
|           **Default** |    **1000** |     **344.368 ns** |      **6.6383 ns** |      **7.6447 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |    1000 |      82.869 ns |      0.6403 ns |      0.5676 ns |  0.24 |    0.01 |
|                   |         |                |                |                |       |         |
|           **Default** | **1000000** | **489,312.868 ns** | **14,985.7719 ns** | **44,185.8865 ns** |  **1.00** |    **0.00** |
| ReverseVectorized | 1000000 | 152,939.678 ns |  2,911.9813 ns |  3,682.7240 ns |  0.35 |    0.03 |
