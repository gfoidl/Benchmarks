``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |    StdDev |    Median | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|----------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **37.59 ns** | **0.7962 ns** | **0.8176 ns** |  **37.83 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  36.12 ns | 0.7752 ns | 2.2116 ns |  36.80 ns |  1.02 |    0.07 |
|                  |         |           |           |           |           |       |         |
|     **PR34529_Base** |      **16** |  **40.62 ns** | **0.8367 ns** | **0.7417 ns** |  **40.82 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  39.81 ns | 0.5028 ns | 0.4703 ns |  39.98 ns |  0.98 |    0.02 |
|                  |         |           |           |           |           |       |         |
|     **PR34529_Base** |    **1000** | **174.71 ns** | **3.5150 ns** | **9.3212 ns** | **177.70 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 153.53 ns | 3.1238 ns | 6.9869 ns | 157.89 ns |  0.87 |    0.05 |
