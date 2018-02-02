``` ini

BenchmarkDotNet=v0.10.12, OS=ubuntu 17.10
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.4
  [Host]     : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT
  DefaultJob : .NET Core 2.0.5 (Framework 4.6.0.0), 64bit RyuJIT


```
| Method |      Mean |     Error |    StdDev | Scaled | ScaledSD |
|------- |----------:|----------:|----------:|-------:|---------:|
|   Max1 | 1.0747 ns | 0.0498 ns | 0.0466 ns |   1.00 |     0.00 |
|   Max2 | 1.0508 ns | 0.0641 ns | 0.0713 ns |   0.98 |     0.08 |
|   Max3 | 1.0533 ns | 0.0115 ns | 0.0102 ns |   0.98 |     0.04 |
|   Max4 | 0.6374 ns | 0.0070 ns | 0.0062 ns |   0.59 |     0.03 |
|   Max5 | 0.6883 ns | 0.0505 ns | 0.0448 ns |   0.64 |     0.05 |
|   Max6 | 0.9781 ns | 0.0418 ns | 0.0370 ns |   0.91 |     0.05 |
|   Max7 | 0.3046 ns | 0.0036 ns | 0.0030 ns |   0.28 |     0.01 |
|   Max8 | 2.1098 ns | 0.0752 ns | 0.0667 ns |   1.97 |     0.10 |
|   Max9 | 0.8377 ns | 0.0634 ns | 0.1518 ns |   0.78 |     0.14 |
