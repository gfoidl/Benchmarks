``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **34.98 ns** | **0.7449 ns** | **2.125 ns** |  **35.93 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  37.64 ns | 1.1067 ns | 2.310 ns |  37.16 ns |  1.07 |    0.08 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **39.87 ns** | **0.8329 ns** | **1.720 ns** |  **40.35 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  39.11 ns | 0.8304 ns | 1.580 ns |  39.51 ns |  0.98 |    0.05 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **177.00 ns** | **3.5448 ns** | **8.145 ns** | **178.38 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 152.64 ns | 3.0969 ns | 8.158 ns | 149.81 ns |  0.86 |    0.05 |
