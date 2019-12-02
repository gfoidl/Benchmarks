``` ini

BenchmarkDotNet=v0.12.0, OS=Windows 10.0.18362
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-alpha1-015774
  [Host]     : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT
  DefaultJob : .NET Core 3.0.0 (CoreCLR 4.700.19.46205, CoreFX 4.700.19.46214), X64 RyuJIT


```
|             Method |      Type |      Mean |     Error |    StdDev | Ratio | RatioSD |
|------------------- |---------- |----------:|----------:|----------:|------:|--------:|
| AsciiBytesToString | KeepAlive |  18.22 ns |  0.335 ns |  0.297 ns |  1.00 |    0.00 |
|  Utf8BytesToString | KeepAlive |  76.59 ns |  1.158 ns |  1.027 ns |  4.21 |    0.09 |
|                    |           |           |           |           |       |         |
| AsciiBytesToString |    Accept |  35.56 ns |  0.668 ns |  0.743 ns |  1.00 |    0.00 |
|  Utf8BytesToString |    Accept | 165.42 ns |  1.290 ns |  1.144 ns |  4.64 |    0.12 |
|                    |           |           |           |           |       |         |
| AsciiBytesToString | UserAgent |  35.98 ns |  0.647 ns |  0.573 ns |  1.00 |    0.00 |
|  Utf8BytesToString | UserAgent | 200.06 ns |  3.965 ns |  5.686 ns |  5.52 |    0.14 |
|                    |           |           |           |           |       |         |
| AsciiBytesToString |    Cookie |  63.78 ns |  1.575 ns |  4.618 ns |  1.00 |    0.00 |
|  Utf8BytesToString |    Cookie | 454.94 ns | 10.547 ns | 17.909 ns |  6.82 |    0.56 |
