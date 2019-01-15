``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **34.94 ns** | **0.7413 ns** | **1.979 ns** |  **35.92 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  41.40 ns | 0.8648 ns | 1.727 ns |  42.45 ns |  1.18 |    0.08 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **38.49 ns** | **0.8118 ns** | **2.276 ns** |  **39.88 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  46.67 ns | 0.9792 ns | 2.383 ns |  47.89 ns |  1.22 |    0.11 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **175.68 ns** | **3.5467 ns** | **8.360 ns** | **179.68 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 174.48 ns | 3.5126 ns | 9.004 ns | 180.14 ns |  0.99 |    0.07 |
