``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|      Method |      Mean |     Error |    StdDev |    Median | Scaled | ScaledSD |
|------------ |----------:|----------:|----------:|----------:|-------:|---------:|
| Pop_Default | 1.2317 ns | 0.1130 ns | 0.2936 ns | 1.1031 ns |   1.00 |     0.00 |
|     Pop_New | 0.6530 ns | 0.1063 ns | 0.2546 ns | 0.5568 ns |   0.55 |     0.24 |
