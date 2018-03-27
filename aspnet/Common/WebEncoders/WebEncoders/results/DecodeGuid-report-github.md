``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.309)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742189 Hz, Resolution=364.6722 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008384
  [Host] : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|  Method |  Job | Runtime |     Mean |    Error |   StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |---------:|---------:|---------:|-------:|---------:|-------:|----------:|
| Default |  Clr |     Clr | 159.8 ns | 3.171 ns | 3.525 ns |   1.00 |     0.00 | 0.0355 |     112 B |
|     New |  Clr |     Clr | 126.4 ns | 2.110 ns | 1.973 ns |   0.79 |     0.02 | 0.0126 |      40 B |
|         |      |         |          |          |          |        |          |        |           |
| Default | Core |    Core | 172.6 ns | 3.249 ns | 2.880 ns |   1.00 |     0.00 | 0.0355 |     112 B |
|     New | Core |    Core | 119.0 ns | 2.292 ns | 2.032 ns |   0.69 |     0.02 | 0.0126 |      40 B |
