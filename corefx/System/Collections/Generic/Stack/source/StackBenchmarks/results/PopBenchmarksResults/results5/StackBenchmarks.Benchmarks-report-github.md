``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|      Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------ |----------:|----------:|----------:|-------:|---------:|
| Pop_Default | 1.2353 ns | 0.1367 ns | 0.2285 ns |   1.00 |     0.00 |
|     Pop_New | 0.4823 ns | 0.0897 ns | 0.0839 ns |   0.40 |     0.10 |
