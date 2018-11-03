``` ini

BenchmarkDotNet=v0.10.13, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.300-preview3-008416
  [Host]     : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|              Method | Size |     Mean |     Error |    StdDev | Scaled | ScaledSD | Allocated |
|-------------------- |----- |---------:|----------:|----------:|-------:|---------:|----------:|
|         **BufferBased** |   **32** | **31.62 ns** | **0.0843 ns** | **0.0748 ns** |   **1.00** |     **0.00** |       **0 B** |
|     StackallocBased |   32 | 22.45 ns | 0.0676 ns | 0.0564 ns |   0.71 |     0.00 |       0 B |
| StackallocFixedSize |   32 | 31.84 ns | 0.1207 ns | 0.1129 ns |   1.01 |     0.00 |       0 B |
|                     |      |          |           |           |        |          |           |
|         **BufferBased** | **1000** | **90.50 ns** | **0.2162 ns** | **0.1917 ns** |   **1.00** |     **0.00** |       **0 B** |
|     StackallocBased | 1000 | 80.48 ns | 0.3520 ns | 0.2748 ns |   0.89 |     0.00 |       0 B |
| StackallocFixedSize | 1000 | 89.45 ns | 2.1473 ns | 1.9035 ns |   0.99 |     0.02 |       0 B |
