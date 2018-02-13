``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 17.10
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Scaled |
|----------------------- |---------:|----------:|----------:|-------:|
|                Default | 37.98 ns | 0.0677 ns | 0.0633 ns |   1.00 |
|   New_wo_ObjectWrapper | 29.91 ns | 0.0219 ns | 0.0171 ns |   0.79 |
| New_with_ObjectWrapper | 29.94 ns | 0.0648 ns | 0.0606 ns |   0.79 |
