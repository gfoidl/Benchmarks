``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 17.10
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
| Method |      Mean |     Error |    StdDev |    Median | Scaled | ScaledSD |
|------- |----------:|----------:|----------:|----------:|-------:|---------:|
|   Max1 | 0.3566 ns | 0.0438 ns | 0.0410 ns | 0.3485 ns |  1.000 |     0.00 |
|   Max2 | 0.3561 ns | 0.0675 ns | 0.0750 ns | 0.3361 ns |  1.010 |     0.24 |
|   Max3 | 0.4312 ns | 0.0569 ns | 0.1188 ns | 0.3853 ns |  1.224 |     0.36 |
|   Max4 | 0.1948 ns | 0.0372 ns | 0.0311 ns | 0.1967 ns |  0.553 |     0.10 |
|   Max5 | 0.5689 ns | 0.0550 ns | 0.1276 ns | 0.5527 ns |  1.614 |     0.40 |
|   Max6 | 0.3935 ns | 0.0541 ns | 0.1264 ns | 0.4003 ns |  1.117 |     0.38 |
|   Max7 | 0.1353 ns | 0.0456 ns | 0.0469 ns | 0.1160 ns |  0.384 |     0.14 |
|   Max8 | 1.9174 ns | 0.0330 ns | 0.0276 ns | 1.9111 ns |  5.441 |     0.59 |
|   Max9 | 0.0010 ns | 0.0036 ns | 0.0032 ns | 0.0000 ns |  0.003 |     0.01 |
