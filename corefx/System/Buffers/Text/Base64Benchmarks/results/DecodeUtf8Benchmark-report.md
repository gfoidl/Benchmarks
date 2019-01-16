``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|                                Method | DataLen |      Mean |     Error |    StdDev |    Median | Ratio | RatioSD |
|-------------------------------------- |-------- |----------:|----------:|----------:|----------:|------:|--------:|
| **PR34529_Pointers_GetPinnableReference** |       **5** |  **47.69 ns** | **0.9889 ns** | **0.9712 ns** |  **47.73 ns** |  **1.00** |    **0.00** |
|            PR34529_Pointers_Reference |       5 |  46.48 ns | 0.9671 ns | 1.5889 ns |  46.73 ns |  0.98 |    0.03 |
|                                       |         |           |           |           |           |       |         |
| **PR34529_Pointers_GetPinnableReference** |      **16** |  **51.49 ns** | **0.6306 ns** | **0.5899 ns** |  **51.53 ns** |  **1.00** |    **0.00** |
|            PR34529_Pointers_Reference |      16 |  50.84 ns | 0.9104 ns | 0.8516 ns |  51.15 ns |  0.99 |    0.02 |
|                                       |         |           |           |           |           |       |         |
| **PR34529_Pointers_GetPinnableReference** |    **1000** | **178.89 ns** | **3.6082 ns** | **7.7670 ns** | **181.99 ns** |  **1.00** |    **0.00** |
|            PR34529_Pointers_Reference |    1000 | 181.56 ns | 3.6187 ns | 5.8435 ns | 183.46 ns |  1.01 |    0.05 |
