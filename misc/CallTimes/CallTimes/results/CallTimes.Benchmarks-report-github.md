``` ini

BenchmarkDotNet=v0.10.12, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.248)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.26020.03), 64bit RyuJIT


```
|         Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|--------------- |---------:|----------:|----------:|-------:|---------:|
|         Direct | 1.482 ns | 0.0239 ns | 0.0223 ns |   1.00 |     0.00 |
|      Interface | 2.205 ns | 0.0150 ns | 0.0140 ns |   1.49 |     0.02 |
|       Abstract | 1.533 ns | 0.0160 ns | 0.0150 ns |   1.03 |     0.02 |
| AbstractSealed | 1.543 ns | 0.0079 ns | 0.0074 ns |   1.04 |     0.02 |
|       Delegate | 1.853 ns | 0.0088 ns | 0.0082 ns |   1.25 |     0.02 |
|     Expression | 3.918 ns | 0.0275 ns | 0.0243 ns |   2.64 |     0.04 |
|    IlGenSimple | 1.866 ns | 0.0131 ns | 0.0123 ns |   1.26 |     0.02 |
|          IlGen | 1.831 ns | 0.0233 ns | 0.0218 ns |   1.24 |     0.02 |
