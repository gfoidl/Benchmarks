``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|          Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|---------------- |---------:|----------:|----------:|-------:|---------:|
| Enqueue_Default | 19.99 ns | 0.3536 ns | 0.3308 ns |   1.00 |     0.00 |
|     Enqueue_New | 18.97 ns | 0.2955 ns | 0.2764 ns |   0.95 |     0.02 |
