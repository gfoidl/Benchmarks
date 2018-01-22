``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
|  Method |     Mean |     Error |    StdDev | Scaled |
|-------- |---------:|----------:|----------:|-------:|
| Default | 1.266 ms | 0.0181 ms | 0.0160 ms |   1.00 |
|    New1 | 1.155 ms | 0.0131 ms | 0.0116 ms |   0.91 |
