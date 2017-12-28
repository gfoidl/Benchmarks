``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|          Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|---------------- |----------:|----------:|----------:|-------:|---------:|
| Dequeue_Default | 0.9702 ns | 0.1013 ns | 0.1421 ns |   1.00 |     0.00 |
|     Dequeue_New | 0.8880 ns | 0.1042 ns | 0.1770 ns |   0.93 |     0.22 |
