``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|  Method |     Mean |     Error |    StdDev | Scaled |
|-------- |---------:|----------:|----------:|-------:|
| Default | 7.097 ns | 0.0796 ns | 0.0744 ns |   1.00 |
|     New | 5.013 ns | 0.0540 ns | 0.0505 ns |   0.71 |
