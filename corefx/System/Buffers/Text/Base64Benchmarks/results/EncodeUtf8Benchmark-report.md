``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **32.90 ns** | **0.7054 ns** | **1.895 ns** |  **33.59 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  34.40 ns | 0.7349 ns | 1.936 ns |  35.22 ns |  1.05 |    0.07 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **36.61 ns** | **0.7762 ns** | **2.072 ns** |  **37.77 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  37.61 ns | 0.8006 ns | 1.504 ns |  37.89 ns |  1.03 |    0.07 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **130.12 ns** | **2.6394 ns** | **7.657 ns** | **134.01 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 134.84 ns | 2.6001 ns | 2.670 ns | 135.58 ns |  0.98 |    0.04 |
