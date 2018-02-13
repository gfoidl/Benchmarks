``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 17.10
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Scaled |
|----------------------- |---------:|----------:|----------:|-------:|
|                Default | 97.32 ns | 0.1090 ns | 0.1020 ns |   1.00 |
|   New_wo_ObjectWrapper | 95.63 ns | 0.1077 ns | 0.1008 ns |   0.98 |
| New_with_ObjectWrapper | 96.20 ns | 0.2372 ns | 0.2219 ns |   0.99 |
