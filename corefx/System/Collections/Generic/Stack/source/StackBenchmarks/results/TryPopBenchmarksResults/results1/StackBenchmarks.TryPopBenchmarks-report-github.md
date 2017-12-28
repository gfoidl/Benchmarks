``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|         Method |     Mean |     Error |    StdDev |   Median | Scaled | ScaledSD |
|--------------- |---------:|----------:|----------:|---------:|-------:|---------:|
| TryPop_Default | 3.559 ns | 0.2330 ns | 0.6871 ns | 3.331 ns |   1.00 |     0.00 |
|     TryPop_New | 2.715 ns | 0.0785 ns | 0.0734 ns | 2.694 ns |   0.79 |     0.14 |
