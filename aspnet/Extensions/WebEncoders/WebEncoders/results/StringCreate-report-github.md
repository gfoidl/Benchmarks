``` ini

BenchmarkDotNet=v0.10.13, OS=ubuntu 16.04
Intel Xeon CPU 2.60GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=2.1.300-preview3-008416
  [Host]     : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT
  DefaultJob : .NET Core 2.1.0-preview2-26314-02 (CoreCLR 4.6.26310.01, CoreFX 4.6.26313.01), 64bit RyuJIT


```
|         Method | Size |      Mean |     Error |    StdDev | Scaled | ScaledSD |  Gen 0 | Allocated |
|--------------- |----- |----------:|----------:|----------:|-------:|---------:|-------:|----------:|
|    **String_Ctor** |   **10** |  **72.16 ns** | **0.1287 ns** | **0.0931 ns** |   **1.00** |     **0.00** | **0.0075** |      **48 B** |
|  String_Create |   10 |  84.41 ns | 0.7099 ns | 0.5928 ns |   1.17 |     0.01 | 0.0176 |     112 B |
| String_Create1 |   10 |  71.90 ns | 0.4653 ns | 0.3885 ns |   1.00 |     0.01 | 0.0075 |      48 B |
|                |      |           |           |           |        |          |        |           |
|    **String_Ctor** |   **50** |  **84.88 ns** | **1.2038 ns** | **1.1261 ns** |   **1.00** |     **0.00** | **0.0201** |     **128 B** |
|  String_Create |   50 |  90.33 ns | 0.8942 ns | 0.6982 ns |   1.06 |     0.02 | 0.0304 |     192 B |
| String_Create1 |   50 |  85.96 ns | 1.4009 ns | 1.3104 ns |   1.01 |     0.02 | 0.0201 |     128 B |
|                |      |           |           |           |        |          |        |           |
|    **String_Ctor** |  **100** | **101.09 ns** | **1.9965 ns** | **1.8675 ns** |   **1.00** |     **0.00** | **0.0367** |     **232 B** |
|  String_Create |  100 | 111.43 ns | 2.0976 ns | 1.9621 ns |   1.10 |     0.03 | 0.0468 |     296 B |
| String_Create1 |  100 |  98.87 ns | 1.9325 ns | 3.1752 ns |   0.98 |     0.04 | 0.0367 |     232 B |
