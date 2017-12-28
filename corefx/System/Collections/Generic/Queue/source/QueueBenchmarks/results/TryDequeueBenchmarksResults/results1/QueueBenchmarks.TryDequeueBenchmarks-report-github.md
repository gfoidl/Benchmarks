``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|             Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------------- |---------:|----------:|----------:|-------:|---------:|
| TryDequeue_Default | 3.990 ns | 0.1666 ns | 0.2545 ns |   1.00 |     0.00 |
|     TryDequeue_New | 3.559 ns | 0.1585 ns | 0.2273 ns |   0.90 |     0.08 |
