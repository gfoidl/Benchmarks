``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview-010046
  [Host]     : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview-27308-3 (CoreCLR 4.6.27220.01, CoreFX 4.7.19.5401), 64bit RyuJIT


```
|           Method | DataLen |      Mean |     Error |    StdDev | Ratio | RatioSD |
|----------------- |-------- |----------:|----------:|----------:|------:|--------:|
|     **PR34529_Base** |       **5** |  **33.13 ns** | **0.7143 ns** | **1.6837 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |       5 |  37.39 ns | 0.7014 ns | 0.6561 ns |  1.07 |    0.04 |
|                  |         |           |           |           |       |         |
|     **PR34529_Base** |      **16** |  **37.45 ns** | **0.7865 ns** | **1.8692 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |      16 |  37.70 ns | 0.8010 ns | 1.4444 ns |  1.00 |    0.06 |
|                  |         |           |           |           |       |         |
|     **PR34529_Base** |    **1000** | **136.27 ns** | **1.6232 ns** | **1.5184 ns** |  **1.00** |    **0.00** |
| PR34529_Pointers |    1000 | 134.18 ns | 2.0896 ns | 1.8523 ns |  0.99 |    0.02 |
