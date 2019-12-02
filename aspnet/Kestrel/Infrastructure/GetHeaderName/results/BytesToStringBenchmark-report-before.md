``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-alpha1-015774
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|             Method |      Type |      Mean |    Error |    StdDev | Ratio | RatioSD |
|------------------- |---------- |----------:|---------:|----------:|------:|--------:|
| AsciiBytesToString | KeepAlive |  18.93 ns | 0.373 ns |  0.430 ns |  1.00 |    0.00 |
|  Utf8BytesToString | KeepAlive |  78.53 ns | 1.293 ns |  1.080 ns |  4.11 |    0.11 |
|                    |           |           |          |           |       |         |
| AsciiBytesToString |    Accept |  39.00 ns | 0.614 ns |  0.545 ns |  1.00 |    0.00 |
|  Utf8BytesToString |    Accept | 184.56 ns | 2.830 ns |  2.508 ns |  4.73 |    0.11 |
|                    |           |           |          |           |       |         |
| AsciiBytesToString | UserAgent |  41.99 ns | 0.837 ns |  1.889 ns |  1.00 |    0.00 |
|  Utf8BytesToString | UserAgent | 216.20 ns | 2.758 ns |  2.445 ns |  5.08 |    0.24 |
|                    |           |           |          |           |       |         |
| AsciiBytesToString |    Cookie |  71.71 ns | 1.384 ns |  1.594 ns |  1.00 |    0.00 |
|  Utf8BytesToString |    Cookie | 474.78 ns | 9.311 ns | 16.307 ns |  6.72 |    0.27 |
