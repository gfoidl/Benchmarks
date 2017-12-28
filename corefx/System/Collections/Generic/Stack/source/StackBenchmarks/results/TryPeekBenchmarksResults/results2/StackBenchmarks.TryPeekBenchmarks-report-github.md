``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|          Method |     Mean |     Error |    StdDev |   Median | Scaled | ScaledSD |
|---------------- |---------:|----------:|----------:|---------:|-------:|---------:|
| TryPeek_Default | 5.212 ns | 0.1905 ns | 0.3977 ns | 5.178 ns |   1.00 |     0.00 |
|     TryPeek_New | 3.982 ns | 0.1716 ns | 0.4640 ns | 3.798 ns |   0.77 |     0.11 |
