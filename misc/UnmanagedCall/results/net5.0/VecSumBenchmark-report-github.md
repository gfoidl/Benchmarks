``` ini

BenchmarkDotNet=v0.12.1, OS=Windows 10.0.19041.508 (2004/?/20H1)
Intel Core i7-7700HQ CPU 2.80GHz (Kaby Lake), 1 CPU, 8 logical and 4 physical cores
.NET Core SDK=5.0.100-preview.7.20366.6
  [Host]     : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT
  DefaultJob : .NET Core 5.0.0 (CoreCLR 5.0.20.36411, CoreFX 5.0.20.36411), X64 RyuJIT


```
|                 Method |     Mean |     Error |    StdDev | Ratio | Code Size |
|----------------------- |---------:|----------:|----------:|------:|----------:|
|              DllImport | 1.222 μs | 0.0116 μs | 0.0102 μs |  1.00 |     157 B |
| FunctionPointerDefault | 1.218 μs | 0.0183 μs | 0.0172 μs |  1.00 |      25 B |
|   FunctionPointerCdecl | 1.235 μs | 0.0153 μs | 0.0144 μs |  1.01 |     149 B |
