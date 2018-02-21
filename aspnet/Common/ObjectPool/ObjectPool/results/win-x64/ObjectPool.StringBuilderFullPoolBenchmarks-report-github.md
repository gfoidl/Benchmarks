``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|      Method |     Mean |     Error |    StdDev | Scaled |
|------------ |---------:|----------:|----------:|-------:|
|     Default | 27.94 ns | 0.3456 ns | 0.2886 ns |   1.00 |
| NoInterface | 18.87 ns | 0.1387 ns | 0.1158 ns |   0.68 |
