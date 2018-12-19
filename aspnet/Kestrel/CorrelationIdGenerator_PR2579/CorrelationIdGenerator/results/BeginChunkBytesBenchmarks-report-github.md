``` ini

BenchmarkDotNet=v0.10.14, OS=Windows 10.0.17134
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
Frequency=2742192 Hz, Resolution=364.6718 ns, Timer=TSC
.NET Core SDK=2.1.300-rc1-008673
  [Host]     : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0-rc1 (CoreCLR 4.6.26426.02, CoreFX 4.6.26426.04), 64bit RyuJIT


```
|             Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|------------------- |---------:|----------:|----------:|-------:|---------:|-------:|----------:|
|            Default | 17.51 ns | 0.3823 ns | 0.3755 ns |   1.00 |     0.00 | 0.0127 |      40 B |
|             Unsafe | 15.43 ns | 0.1269 ns | 0.1187 ns |   0.88 |     0.02 | 0.0127 |      40 B |
| BytesSafeHexUnsafe | 13.88 ns | 0.1718 ns | 0.1607 ns |   0.79 |     0.02 | 0.0127 |      40 B |
|           NoLookup | 14.28 ns | 0.1124 ns | 0.0938 ns |   0.82 |     0.02 | 0.0127 |      40 B |
| NoLookupBranchless | 16.28 ns | 0.3119 ns | 0.2918 ns |   0.93 |     0.03 | 0.0127 |      40 B |
