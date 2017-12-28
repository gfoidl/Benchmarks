``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|      Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------ |----------:|----------:|----------:|-------:|---------:|
| Pop_Default | 1.0609 ns | 0.0673 ns | 0.0630 ns |   1.00 |     0.00 |
|     Pop_New | 0.8681 ns | 0.1036 ns | 0.0918 ns |   0.82 |     0.10 |
