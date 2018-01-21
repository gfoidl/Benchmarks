``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 4 logical cores and 2 physical cores
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
|  Method |     Mean |    Error |   StdDev | Scaled | ScaledSD |
|-------- |---------:|---------:|---------:|-------:|---------:|
| Default | 432.3 us | 8.485 us | 19.67 us |   1.00 |     0.00 |
|    New1 | 390.7 us | 7.880 us | 19.77 us |   0.91 |     0.06 |
