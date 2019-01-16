``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **35.04 ns** | **0.7485 ns** | **1.932 ns** |  **35.39 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  45.50 ns | 0.9596 ns | 2.494 ns |  45.60 ns |  1.30 |    0.09 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **37.96 ns** | **0.8068 ns** | **2.209 ns** |  **37.51 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  47.11 ns | 0.9904 ns | 2.392 ns |  47.87 ns |  1.23 |    0.09 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **174.31 ns** | **3.5269 ns** | **9.229 ns** | **175.73 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 163.33 ns | 3.3155 ns | 8.734 ns | 165.09 ns |  0.94 |    0.06 |
