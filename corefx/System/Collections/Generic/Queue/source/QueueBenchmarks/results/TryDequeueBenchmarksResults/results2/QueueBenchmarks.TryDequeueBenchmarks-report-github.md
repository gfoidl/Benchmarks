``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|             Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------------- |---------:|----------:|----------:|-------:|---------:|
| TryDequeue_Default | 3.663 ns | 0.1559 ns | 0.1382 ns |   1.00 |     0.00 |
|     TryDequeue_New | 3.288 ns | 0.1593 ns | 0.2748 ns |   0.90 |     0.08 |
