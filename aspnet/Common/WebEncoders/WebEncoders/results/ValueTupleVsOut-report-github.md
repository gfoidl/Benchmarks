``` ini

BenchmarkDotNet=v0.10.13, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.300-preview3-008416
  [Host]     : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|     Method |      Mean |     Error |    StdDev | Scaled |
|----------- |----------:|----------:|----------:|-------:|
| ValueTuple | 10.878 ns | 0.0188 ns | 0.0176 ns |   1.00 |
|        Out |  2.387 ns | 0.0192 ns | 0.0180 ns |   0.22 |
