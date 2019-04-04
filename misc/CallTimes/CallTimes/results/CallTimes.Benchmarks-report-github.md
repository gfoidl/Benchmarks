``` ini

BenchmarkDotNet=v0.11.5, OS=Windows 10.0.17134.648 (1803/April2018Update/Redstone4)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742185 Hz, Resolution=364.6727 ns, Timer=TSC
.NET Core SDK=3.0.100-preview4-010389
  [Host]     : .NET Core 3.0.0-preview-27117-01 (CoreCLR 4.6.27116.05, CoreFX 4.7.18.56608), 64bit RyuJIT
  DefaultJob : .NET Core 3.0.0-preview4-27419-7 (CoreCLR 4.6.27418.71, CoreFX 4.7.19.11907), 64bit RyuJIT


```
|             Method |      Mean |     Error |    StdDev |    Median | Ratio | RatioSD |
|------------------- |----------:|----------:|----------:|----------:|------:|--------:|
|             Direct | 2.1561 ns | 0.0242 ns | 0.0202 ns | 2.1521 ns |  1.00 |    0.00 |
|          Interface | 2.0167 ns | 0.0186 ns | 0.0174 ns | 2.0124 ns |  0.94 |    0.01 |
|           Abstract | 1.4420 ns | 0.1940 ns | 0.4832 ns | 1.1736 ns |  1.06 |    0.04 |
| AbstractSealedBase | 2.2050 ns | 0.0205 ns | 0.0192 ns | 2.2079 ns |  1.02 |    0.01 |
|     AbstractSealed | 0.4044 ns | 0.0386 ns | 0.0362 ns | 0.3911 ns |  0.19 |    0.02 |
|           Delegate | 1.9283 ns | 0.0397 ns | 0.0372 ns | 1.9154 ns |  0.90 |    0.02 |
|         Expression | 5.3601 ns | 0.0555 ns | 0.0519 ns | 5.3573 ns |  2.48 |    0.03 |
|        IlGenSimple | 2.1655 ns | 0.0806 ns | 0.0791 ns | 2.1523 ns |  1.00 |    0.03 |
|              IlGen | 2.1003 ns | 0.0330 ns | 0.0276 ns | 2.0972 ns |  0.97 |    0.02 |
|             IlCall | 0.4794 ns | 0.0321 ns | 0.0300 ns | 0.4633 ns |  0.22 |    0.02 |
|            IlCalli | 2.0026 ns | 0.0631 ns | 0.0559 ns | 1.9749 ns |  0.93 |    0.03 |
|        IlCalliTail | 1.0731 ns | 0.0207 ns | 0.0194 ns | 1.0753 ns |  0.50 |    0.01 |
