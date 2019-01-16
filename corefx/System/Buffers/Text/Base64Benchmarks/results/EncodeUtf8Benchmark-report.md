``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|                                Method | DataLen |      Mean |     Error |    StdDev |    Median | Ratio | RatioSD |
|-------------------------------------- |-------- |----------:|----------:|----------:|----------:|------:|--------:|
| **PR34529_Pointers_GetPinnableReference** |       **5** |  **42.76 ns** | **0.9040 ns** | **1.9069 ns** |  **42.93 ns** |  **1.00** |    **0.00** |
|            PR34529_Pointers_Reference |       5 |  44.09 ns | 0.9211 ns | 1.8816 ns |  44.42 ns |  1.03 |    0.07 |
|                                       |         |           |           |           |           |       |         |
| **PR34529_Pointers_GetPinnableReference** |      **16** |  **49.24 ns** | **0.9714 ns** | **0.9087 ns** |  **49.11 ns** |  **1.00** |    **0.00** |
|            PR34529_Pointers_Reference |      16 |  46.78 ns | 0.9738 ns | 2.2178 ns |  47.33 ns |  0.95 |    0.05 |
|                                       |         |           |           |           |           |       |         |
| **PR34529_Pointers_GetPinnableReference** |    **1000** | **138.29 ns** | **2.8016 ns** | **7.2817 ns** | **140.09 ns** |  **1.00** |    **0.00** |
|            PR34529_Pointers_Reference |    1000 | 141.51 ns | 2.8798 ns | 6.1371 ns | 143.94 ns |  1.02 |    0.07 |
