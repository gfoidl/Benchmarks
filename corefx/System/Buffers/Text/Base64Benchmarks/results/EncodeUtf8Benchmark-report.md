``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **33.74 ns** | **0.7083 ns** | **1.510 ns** |  **34.47 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  43.49 ns | 1.1041 ns | 3.114 ns |  43.84 ns |  1.32 |    0.11 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **37.41 ns** | **0.7929 ns** | **1.853 ns** |  **38.04 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  46.72 ns | 0.9818 ns | 2.534 ns |  47.37 ns |  1.26 |    0.08 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **132.82 ns** | **2.7186 ns** | **4.233 ns** | **133.65 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 136.71 ns | 2.7955 ns | 7.793 ns | 138.00 ns |  1.04 |    0.07 |
