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
| Default | 2.013 ns | 0.0359 ns | 0.0318 ns |   1.00 |     0.00 |
|     New | 1.648 ns | 0.0280 ns | 0.0262 ns |   0.82 |     0.02 |
