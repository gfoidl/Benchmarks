``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.30GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|       Method | InitialCapacity |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------- |---------------- |----------:|----------:|----------:|-------:|---------:|
| **Push_Default** |               **0** | **0.4763 ns** | **0.0384 ns** | **0.0340 ns** |   **1.00** |     **0.00** |
|     Push_New |               0 | 0.3617 ns | 0.0414 ns | 0.0387 ns |   0.76 |     0.09 |
| **Push_Default** |           **10000** | **0.3995 ns** | **0.0309 ns** | **0.0258 ns** |   **1.00** |     **0.00** |
|     Push_New |           10000 | 0.3577 ns | 0.0199 ns | 0.0186 ns |   0.90 |     0.07 |
