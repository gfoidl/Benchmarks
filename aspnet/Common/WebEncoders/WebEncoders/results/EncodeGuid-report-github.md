``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.309)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742189 Hz, Resolution=364.6722 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008384
  [Host] : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview2-26313-01 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|  Method |  Job | Runtime |      Mean |    Error |   StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |----------:|---------:|---------:|-------:|---------:|-------:|----------:|
| Default |  Clr |     Clr | 143.72 ns | 2.896 ns | 3.448 ns |   1.00 |     0.00 | 0.0455 |     144 B |
|     New |  Clr |     Clr | 123.75 ns | 2.683 ns | 5.945 ns |   0.86 |     0.05 | 0.0455 |     144 B |
|         |      |         |           |          |          |        |          |        |           |
| Default | Core |    Core | 107.76 ns | 2.183 ns | 2.144 ns |   1.00 |     0.00 | 0.0457 |     144 B |
|     New | Core |    Core |  82.49 ns | 1.721 ns | 2.048 ns |   0.77 |     0.02 | 0.0228 |      72 B |
