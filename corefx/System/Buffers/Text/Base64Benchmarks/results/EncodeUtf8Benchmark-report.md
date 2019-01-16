``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **31.70 ns** | **0.6815 ns** | **1.966 ns** |  **31.48 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  31.90 ns | 0.7659 ns | 2.258 ns |  30.32 ns |  1.01 |    0.08 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **36.46 ns** | **0.7744 ns** | **2.094 ns** |  **37.15 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  36.25 ns | 0.7693 ns | 2.144 ns |  36.37 ns |  1.00 |    0.07 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **136.97 ns** | **2.3754 ns** | **2.222 ns** | **137.68 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 126.44 ns | 2.5704 ns | 6.059 ns | 125.08 ns |  0.92 |    0.04 |
