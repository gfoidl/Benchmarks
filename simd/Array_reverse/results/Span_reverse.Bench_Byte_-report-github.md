``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|            Method |       N |           Mean |         Error |        StdDev |         Median | Ratio | RatioSD |
|------------------ |-------- |---------------:|--------------:|--------------:|---------------:|------:|--------:|
|           **Default** |       **2** |       **2.708 ns** |     **0.0906 ns** |     **0.1007 ns** |       **2.689 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |       2 |       5.076 ns |     0.1404 ns |     0.2144 ns |       5.066 ns |  1.90 |    0.11 |
|                   |         |                |               |               |                |       |         |
|           **Default** |      **10** |       **7.300 ns** |     **0.1838 ns** |     **0.4577 ns** |       **7.423 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |      10 |       5.032 ns |     0.1442 ns |     0.2744 ns |       4.896 ns |  0.70 |    0.08 |
|                   |         |                |               |               |                |       |         |
|           **Default** |     **128** |      **44.865 ns** |     **0.4872 ns** |     **0.4068 ns** |      **44.670 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |     128 |       5.777 ns |     0.1565 ns |     0.2700 ns |       5.723 ns |  0.13 |    0.00 |
|                   |         |                |               |               |                |       |         |
|           **Default** |    **1000** |     **336.362 ns** |     **6.6223 ns** |     **8.3751 ns** |     **332.528 ns** |  **1.00** |    **0.00** |
| ReverseVectorized |    1000 |      24.269 ns |     0.5130 ns |     0.7192 ns |      24.392 ns |  0.07 |    0.00 |
|                   |         |                |               |               |                |       |         |
|           **Default** | **1000000** | **354,319.345 ns** | **7,078.0267 ns** | **9,688.4828 ns** | **353,688.867 ns** |  **1.00** |    **0.00** |
| ReverseVectorized | 1000000 |  30,760.677 ns |   609.9575 ns | 1,099.8791 ns |  30,467.542 ns |  0.09 |    0.00 |
