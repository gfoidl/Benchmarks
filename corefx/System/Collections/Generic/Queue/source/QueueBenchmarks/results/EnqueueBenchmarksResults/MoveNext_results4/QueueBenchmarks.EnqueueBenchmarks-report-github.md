``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|          Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|---------------- |---------:|----------:|----------:|-------:|---------:|
| Enqueue_Default | 22.36 ns | 0.4125 ns | 0.3859 ns |   1.00 |     0.00 |
|     Enqueue_New | 22.64 ns | 0.4899 ns | 0.8580 ns |   1.01 |     0.04 |
