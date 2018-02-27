``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|  Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|-------- |---------:|----------:|----------:|-------:|---------:|
| Default | 13.91 ns | 0.3772 ns | 0.7532 ns |   1.00 |     0.00 |
|     New | 11.53 ns | 0.3217 ns | 0.4716 ns |   0.83 |     0.06 |
