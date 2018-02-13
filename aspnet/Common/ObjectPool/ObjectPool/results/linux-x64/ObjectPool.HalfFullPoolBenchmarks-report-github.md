``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 17.10
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Scaled |
|----------------------- |---------:|----------:|----------:|-------:|
|                Default | 249.1 ns | 0.4901 ns | 0.4584 ns |   1.00 |
|   New_wo_ObjectWrapper | 197.2 ns | 0.2590 ns | 0.2422 ns |   0.79 |
| New_with_ObjectWrapper | 181.2 ns | 0.2893 ns | 0.2565 ns |   0.73 |
