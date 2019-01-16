``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **31.67 ns** | **0.7010 ns** | **1.847 ns** |  **32.64 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  45.27 ns | 0.9369 ns | 1.760 ns |  45.96 ns |  1.43 |    0.10 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **37.35 ns** | **0.7918 ns** | **1.803 ns** |  **37.88 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  46.81 ns | 0.9763 ns | 2.320 ns |  48.26 ns |  1.26 |    0.08 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **136.05 ns** | **1.2064 ns** | **1.069 ns** | **136.30 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 143.71 ns | 2.9009 ns | 5.860 ns | 145.14 ns |  1.05 |    0.04 |
