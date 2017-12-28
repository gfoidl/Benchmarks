``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|      Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------ |----------:|----------:|----------:|-------:|---------:|
| Pop_Default | 0.9290 ns | 0.1006 ns | 0.1235 ns |   1.00 |     0.00 |
|     Pop_New | 0.7861 ns | 0.1051 ns | 0.1403 ns |   0.86 |     0.18 |
