``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Scaled |
|----------------------- |---------:|----------:|----------:|-------:|
|                Default | 1.973 us | 0.0135 us | 0.0126 us |   1.00 |
|   New_wo_ObjectWrapper | 1.708 us | 0.0121 us | 0.0113 us |   0.87 |
| New_with_ObjectWrapper | 1.384 us | 0.0228 us | 0.0214 us |   0.70 |
