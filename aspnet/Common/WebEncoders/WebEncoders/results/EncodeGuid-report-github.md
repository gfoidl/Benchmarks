``` ini

BenchmarkDotNet=v0.10.13, OS=Windows 10 Redstone 3 [1709, Fall Creators Update] (10.0.16299.371)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical cores and 4 physical cores
Frequency=2742187 Hz, Resolution=364.6724 ns, Timer=TSC
.NET Core SDK=2.1.300-preview3-008618
  [Host] : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.2633.0
  Core   : .NET Core 2.1.0-preview3-26411-06 (CoreCLR 4.6.26411.07, CoreFX 4.6.26411.06), 64bit RyuJIT


```
|  Method |  Job | Runtime |      Mean |     Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|-------- |----- |-------- |----------:|----------:|----------:|-------:|---------:|-------:|----------:|
| Default |  Clr |     Clr | 123.48 ns | 2.4681 ns | 5.2596 ns |   1.00 |     0.00 | 0.0455 |     144 B |
|  PR_334 |  Clr |     Clr | 156.93 ns | 2.3024 ns | 2.0410 ns |   1.27 |     0.06 | 0.0226 |      72 B |
|     New |  Clr |     Clr |  92.41 ns | 1.8525 ns | 1.7329 ns |   0.75 |     0.03 | 0.0228 |      72 B |
|         |      |         |           |           |           |        |          |        |           |
| Default | Core |    Core | 110.69 ns | 2.2966 ns | 3.0659 ns |   1.00 |     0.00 | 0.0457 |     144 B |
|  PR_334 | Core |    Core |  81.40 ns | 0.5706 ns | 0.4455 ns |   0.74 |     0.02 | 0.0228 |      72 B |
|     New | Core |    Core |  63.56 ns | 0.9141 ns | 0.8550 ns |   0.57 |     0.02 | 0.0228 |      72 B |
