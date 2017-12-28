``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.30GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|       Method | InitialCapacity |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------- |---------------- |----------:|----------:|----------:|-------:|---------:|
| **Push_Default** |               **0** | **0.5265 ns** | **0.0484 ns** | **0.0538 ns** |   **1.00** |     **0.00** |
|     Push_New |               0 | 0.3313 ns | 0.0860 ns | 0.0718 ns |   0.64 |     0.15 |
| **Push_Default** |           **10000** | **0.4963 ns** | **0.0483 ns** | **0.0517 ns** |   **1.00** |     **0.00** |
|     Push_New |           10000 | 0.3764 ns | 0.0178 ns | 0.0166 ns |   0.77 |     0.08 |
