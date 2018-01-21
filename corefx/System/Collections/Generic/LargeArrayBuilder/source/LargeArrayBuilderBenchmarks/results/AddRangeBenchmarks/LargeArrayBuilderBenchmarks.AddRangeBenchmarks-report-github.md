``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 4 logical cores and 2 physical cores
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
|  Method |     Mean |    Error |   StdDev | Scaled | ScaledSD |
|-------- |---------:|---------:|---------:|-------:|---------:|
| Default | 973.0 us | 19.21 us | 21.36 us |   1.00 |     0.00 |
|    New1 | 842.1 us | 13.26 us | 12.41 us |   0.87 |     0.02 |
|    New2 | 900.3 us | 16.75 us | 15.67 us |   0.93 |     0.03 |
