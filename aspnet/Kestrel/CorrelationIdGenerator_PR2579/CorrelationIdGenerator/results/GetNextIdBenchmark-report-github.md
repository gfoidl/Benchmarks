``` ini

BenchmarkDotNet=v0.10.14, OS=Windows 10.0.17134
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742192 Hz, Resolution=364.6718 ns, Timer=TSC
.NET Core SDK=2.1.300-rc1-008673
  [Host] : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT
  Clr    : .NET Framework 4.7.1 (CLR 4.0.30319.42000), 64bit RyuJIT-v4.7.3101.0
  Core   : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT


```
|                 Method |  Job | Runtime |     Mean |     Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|----------------------- |----- |-------- |---------:|----------:|----------:|-------:|---------:|-------:|----------:|
|                Default |  Clr |     Clr | 32.91 ns | 0.6418 ns | 0.6004 ns |   1.00 |     0.00 | 0.0178 |      56 B |
|           StringCreate |  Clr |     Clr | 31.06 ns | 0.4951 ns | 0.4631 ns |   0.94 |     0.02 | 0.0178 |      56 B |
| StringCreateSpanUnsafe |  Clr |     Clr | 28.88 ns | 0.3857 ns | 0.3608 ns |   0.88 |     0.02 | 0.0178 |      56 B |
|               NoLookup |  Clr |     Clr | 32.77 ns | 0.4607 ns | 0.4309 ns |   1.00 |     0.02 | 0.0178 |      56 B |
|     NoLookupBranchless |  Clr |     Clr | 35.48 ns | 0.1829 ns | 0.1428 ns |   1.08 |     0.02 | 0.0178 |      56 B |
|                        |      |         |          |           |           |        |          |        |           |
|                Default | Core |    Core | 38.00 ns | 0.2891 ns | 0.2705 ns |   1.00 |     0.00 | 0.0178 |      56 B |
|           StringCreate | Core |    Core | 29.55 ns | 0.3055 ns | 0.2858 ns |   0.78 |     0.01 | 0.0178 |      56 B |
| StringCreateSpanUnsafe | Core |    Core | 24.50 ns | 0.2452 ns | 0.2294 ns |   0.64 |     0.01 | 0.0178 |      56 B |
|               NoLookup | Core |    Core | 27.75 ns | 0.4264 ns | 0.3780 ns |   0.73 |     0.01 | 0.0178 |      56 B |
|     NoLookupBranchless | Core |    Core | 28.91 ns | 0.4621 ns | 0.4322 ns |   0.76 |     0.01 | 0.0178 |      56 B |
