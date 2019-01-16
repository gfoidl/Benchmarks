``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |   StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|---------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **34.87 ns** | **0.7400 ns** | **2.038 ns** |  **35.50 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  34.26 ns | 0.7440 ns | 2.194 ns |  34.24 ns |  0.98 |    0.06 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |      **16** |  **38.90 ns** | **0.8226 ns** | **2.094 ns** |  **39.16 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  38.45 ns | 0.8121 ns | 2.330 ns |  37.90 ns |  1.00 |    0.07 |
|                  |         |           |           |          |           |       |         |
|     **PR34529_Base** |    **1000** | **171.21 ns** | **3.4733 ns** | **9.028 ns** | **168.87 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 158.25 ns | 3.1707 ns | 5.384 ns | 159.49 ns |  0.92 |    0.05 |
