``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|          Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|---------------- |----------:|----------:|----------:|-------:|---------:|
| Dequeue_Default | 0.7931 ns | 0.0674 ns | 0.0597 ns |   1.00 |     0.00 |
|     Dequeue_New | 0.6929 ns | 0.1021 ns | 0.0905 ns |   0.88 |     0.13 |
