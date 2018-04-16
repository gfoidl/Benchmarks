``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.371)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008618
  [Host] : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT


```
|  Method |  Job | Runtime |      Mean |    Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |----------:|---------:|----------:|-------:|---------:|-------:|----------:|
| Default |  Clr |     Clr | 144.07 ns | 2.426 ns | 2.1510 ns |   1.00 |     0.00 | 0.0355 |     112 B |
|  PR_334 |  Clr |     Clr | 120.28 ns | 1.893 ns | 1.7703 ns |   0.84 |     0.02 | 0.0126 |      40 B |
|     New |  Clr |     Clr |  64.49 ns | 1.004 ns | 0.9390 ns |   0.45 |     0.01 | 0.0126 |      40 B |
|         |      |         |           |          |           |        |          |        |           |
| Default | Core |    Core | 161.53 ns | 1.206 ns | 1.0072 ns |   1.00 |     0.00 | 0.0355 |     112 B |
|  PR_334 | Core |    Core | 104.90 ns | 2.161 ns | 3.6103 ns |   0.65 |     0.02 | 0.0126 |      40 B |
|     New | Core |    Core |  52.92 ns | 1.100 ns | 1.1766 ns |   0.33 |     0.01 | 0.0127 |      40 B |
