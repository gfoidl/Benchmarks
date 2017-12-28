``` ini

BenchmarkDotNet=v0.10.11, OS=ubuntu 16.04
Processor=Intel Xeon CPU 2.60GHz, ProcessorCount=2
.NET Core SDK=2.1.3
  [Host]     : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.4 (Framework 4.6.0.0), 64bit RyuJIT


```
|          Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|---------------- |---------:|----------:|----------:|-------:|---------:|
| TryPeek_Default | 4.953 ns | 0.1567 ns | 0.1466 ns |   1.00 |     0.00 |
|     TryPeek_New | 3.710 ns | 0.1789 ns | 0.1758 ns |   0.75 |     0.04 |
