``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.508 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.7.20366.6
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT


```
|                 Method |      Mean |     Error |    StdDev | Ratio | RatioSD | Code Size |
|----------------------- |----------:|----------:|----------:|------:|--------:|----------:|
|              DllImport | 7.1816 ns | 0.1822 ns | 0.1871 ns |  1.00 |    0.00 |     153 B |
| FunctionPointerDefault | 0.9719 ns | 0.0529 ns | 0.0495 ns |  0.14 |    0.01 |      23 B |
|   FunctinoPointerCdecl | 6.8810 ns | 0.1637 ns | 0.1608 ns |  0.96 |    0.03 |     145 B |
