``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.685 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.101
  [Host]     : .NET Core 5.0.1 (CoreCLR 5.0.120.57516, CoreFX 5.0.120.57516), X64 RyuJIT
  DefaultJob : .NET Core 5.0.1 (CoreCLR 5.0.120.57516, CoreFX 5.0.120.57516), X64 RyuJIT


```
|             Method |      Mean |    Error |   StdDev | Ratio | RatioSD |  Gen 0 | Gen 1 | Gen 2 | Allocated |
|------------------- |----------:|---------:|---------:|------:|--------:|-------:|------:|------:|----------:|
|     LogInfoDefault | 134.01 ns | 2.680 ns | 3.843 ns |  1.00 |    0.00 | 0.0305 |     - |     - |      96 B |
|     LogInfoDefined |  61.53 ns | 1.265 ns | 3.588 ns |  0.45 |    0.02 |      - |     - |     - |         - |
|                    |           |          |          |       |         |        |       |       |           |
| CreateScopeDefault |  78.38 ns | 2.181 ns | 6.363 ns |  1.00 |    0.00 | 0.0178 |     - |     - |      56 B |
| CreateScopeDefined |  18.83 ns | 0.535 ns | 1.553 ns |  0.24 |    0.03 |      - |     - |     - |         - |
