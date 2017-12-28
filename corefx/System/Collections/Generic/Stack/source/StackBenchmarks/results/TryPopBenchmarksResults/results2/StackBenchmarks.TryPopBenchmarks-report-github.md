``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|         Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|--------------- |---------:|----------:|----------:|-------:|---------:|
| TryPop_Default | 3.180 ns | 0.0644 ns | 0.0571 ns |   1.00 |     0.00 |
|     TryPop_New | 2.736 ns | 0.1200 ns | 0.1123 ns |   0.86 |     0.04 |
