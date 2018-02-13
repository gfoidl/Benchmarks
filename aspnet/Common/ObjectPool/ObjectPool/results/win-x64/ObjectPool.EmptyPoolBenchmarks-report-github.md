``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.125)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742191 Hz, Resolution=364.6719 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|----------------------- |---------:|----------:|----------:|-------:|---------:|
|                Default | 86.67 ns | 1.7322 ns | 1.8534 ns |   1.00 |     0.00 |
|   New_wo_ObjectWrapper | 81.80 ns | 1.2659 ns | 1.1222 ns |   0.94 |     0.02 |
| New_with_ObjectWrapper | 87.29 ns | 0.6121 ns | 0.5726 ns |   1.01 |     0.02 |
