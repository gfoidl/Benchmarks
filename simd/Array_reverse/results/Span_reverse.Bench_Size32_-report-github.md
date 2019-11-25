``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=3.0.100
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|            Method |       N |             Mean |          Error |         StdDev | Ratio |
|------------------ |-------- |-----------------:|---------------:|---------------:|------:|
|           **Default** |       **2** |         **4.119 ns** |      **0.0319 ns** |      **0.0299 ns** |  **1.00** |
| ReverseVectorized |       2 |         2.698 ns |      0.0346 ns |      0.0289 ns |  0.66 |
|                   |         |                  |                |                |       |
|           **Default** |      **10** |        **14.017 ns** |      **0.3157 ns** |      **0.3992 ns** |  **1.00** |
| ReverseVectorized |      10 |         5.555 ns |      0.0488 ns |      0.0456 ns |  0.40 |
|                   |         |                  |                |                |       |
|           **Default** |     **128** |       **160.542 ns** |      **1.3550 ns** |      **1.2011 ns** |  **1.00** |
| ReverseVectorized |     128 |        68.727 ns |      0.4291 ns |      0.3804 ns |  0.43 |
|                   |         |                  |                |                |       |
|           **Default** |    **1000** |     **1,287.673 ns** |     **16.2655 ns** |     **15.2147 ns** |  **1.00** |
| ReverseVectorized |    1000 |       559.489 ns |      4.3093 ns |      3.8201 ns |  0.43 |
|                   |         |                  |                |                |       |
|           **Default** | **1000000** | **3,536,202.891 ns** | **46,129.8653 ns** | **43,149.9046 ns** |  **1.00** |
| ReverseVectorized | 1000000 | 3,366,960.156 ns | 32,140.7458 ns | 28,491.9340 ns |  0.95 |
