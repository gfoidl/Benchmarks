``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|       Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------- |---------:|----------:|----------:|-------:|---------:|
| Peek_Default | 1.974 ns | 0.1229 ns | 0.2020 ns |   1.00 |     0.00 |
|     Peek_New | 1.600 ns | 0.1231 ns | 0.2023 ns |   0.82 |     0.13 |
