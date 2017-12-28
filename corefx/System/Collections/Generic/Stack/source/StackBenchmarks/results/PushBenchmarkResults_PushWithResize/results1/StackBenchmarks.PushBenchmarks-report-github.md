``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.30GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|       Method | InitialCapacity |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------- |---------------- |----------:|----------:|----------:|-------:|---------:|
| **Push_Default** |               **0** | **0.4163 ns** | **0.0180 ns** | **0.0150 ns** |   **1.00** |     **0.00** |
|     Push_New |               0 | 0.3121 ns | 0.0141 ns | 0.0132 ns |   0.75 |     0.04 |
| **Push_Default** |           **10000** | **0.4324 ns** | **0.0209 ns** | **0.0185 ns** |   **1.00** |     **0.00** |
|     Push_New |           10000 | 0.3306 ns | 0.0173 ns | 0.0153 ns |   0.77 |     0.05 |
