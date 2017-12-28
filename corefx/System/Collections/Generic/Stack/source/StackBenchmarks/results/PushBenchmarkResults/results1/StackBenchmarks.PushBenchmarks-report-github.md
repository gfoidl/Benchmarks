``` ini

BenchmarkDotNet=v0.10.11, OS=Windows 7 SP1 (6.1.7601.0)
Processor=Intel Core i7-3610QM CPU 2.30GHz (Ivy Bridge), ProcessorCount=8
Frequency=2241064 Hz, Resolution=446.2166 ns, Timer=TSC
.NET Core SDK=2.1.2
  [Host]     : .NET Core 2.0.3 (Framework 4.6.25815.02), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.3 (Framework 4.6.25815.02), 64bit RyuJIT


```
|       Method |     Mean |     Error |    StdDev | Scaled | ScaledSD |
|------------- |---------:|----------:|----------:|-------:|---------:|
| Push_Default | 1.185 ns | 0.0632 ns | 0.0649 ns |   1.00 |     0.00 |
|     Push_New | 1.079 ns | 0.0610 ns | 0.0653 ns |   0.91 |     0.07 |
