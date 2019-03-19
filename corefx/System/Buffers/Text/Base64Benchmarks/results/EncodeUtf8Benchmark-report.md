``` ini

BenchmarkDotNet=v0.11.3, OS=ubuntu 16.04
Intel Xeon CPU 2.00GHz, 1 CPU, 2 logical cores and 1 physical core
.NET Core SDK=3.0.100-preview4-010906
  [Host] : .NET Core 3.0.0-preview4-27518-07 (CoreCLR 4.6.27518.72, CoreFX 4.7.19.16310), 64bit RyuJIT
  AVX2   : .NET Core 3.0.0-preview4-27518-07 (CoreCLR 4.6.27518.72, CoreFX 4.7.19.16310), 64bit RyuJIT
  SSSE3  : .NET Core 3.0.0-preview4-27518-07 (CoreCLR 4.6.27518.72, CoreFX 4.7.19.16310), 64bit RyuJIT
  Scalar : .NET Core 3.0.0-preview4-27518-07 (CoreCLR 4.6.27518.72, CoreFX 4.7.19.16310), 64bit RyuJIT

Runtime=Core  

```
|   Method |    Job |  EnvironmentVariables | DataLen |        Mean |     Error |    StdDev | Ratio | RatioSD |
|--------- |------- |---------------------- |-------- |------------:|----------:|----------:|------:|--------:|
|     **Base** |   **AVX2** |                 **Empty** |       **5** |    **29.05 ns** | **0.1698 ns** | **0.1588 ns** |  **1.00** |    **0.00** |
| PR_34529 |   AVX2 |                 Empty |       5 |    29.42 ns | 0.1687 ns | 0.1578 ns |  1.01 |    0.01 |
|          |        |                       |         |             |           |           |       |         |
|     Base |  SSSE3 |  COMPlus_EnableAVX2=0 |       5 |    29.23 ns | 0.2020 ns | 0.1791 ns |  1.00 |    0.00 |
| PR_34529 |  SSSE3 |  COMPlus_EnableAVX2=0 |       5 |    28.96 ns | 0.5272 ns | 0.4673 ns |  0.99 |    0.02 |
|          |        |                       |         |             |           |           |       |         |
|     Base | Scalar | COMPlus_EnableSSSE3=0 |       5 |    28.74 ns | 0.1872 ns | 0.1751 ns |  1.00 |    0.00 |
| PR_34529 | Scalar | COMPlus_EnableSSSE3=0 |       5 |    28.89 ns | 0.2520 ns | 0.2104 ns |  1.00 |    0.01 |
|          |        |                       |         |             |           |           |       |         |
|     **Base** |   **AVX2** |                 **Empty** |      **16** |    **47.59 ns** | **0.3296 ns** | **0.3083 ns** |  **1.00** |    **0.00** |
| PR_34529 |   AVX2 |                 Empty |      16 |    33.37 ns | 0.6593 ns | 0.6167 ns |  0.70 |    0.01 |
|          |        |                       |         |             |           |           |       |         |
|     Base |  SSSE3 |  COMPlus_EnableAVX2=0 |      16 |    47.18 ns | 0.2378 ns | 0.2108 ns |  1.00 |    0.00 |
| PR_34529 |  SSSE3 |  COMPlus_EnableAVX2=0 |      16 |    31.87 ns | 0.1322 ns | 0.1172 ns |  0.68 |    0.00 |
|          |        |                       |         |             |           |           |       |         |
|     Base | Scalar | COMPlus_EnableSSSE3=0 |      16 |    43.79 ns | 0.9232 ns | 1.8438 ns |  1.00 |    0.00 |
| PR_34529 | Scalar | COMPlus_EnableSSSE3=0 |      16 |    44.49 ns | 0.2539 ns | 0.2120 ns |  0.98 |    0.06 |
|          |        |                       |         |             |           |           |       |         |
|     **Base** |   **AVX2** |                 **Empty** |    **1000** | **1,279.46 ns** | **5.7813 ns** | **5.4078 ns** |  **1.00** |    **0.00** |
| PR_34529 |   AVX2 |                 Empty |    1000 |   122.37 ns | 2.3510 ns | 2.4143 ns |  0.10 |    0.00 |
|          |        |                       |         |             |           |           |       |         |
|     Base |  SSSE3 |  COMPlus_EnableAVX2=0 |    1000 | 1,290.14 ns | 6.2599 ns | 5.5492 ns |  1.00 |    0.00 |
| PR_34529 |  SSSE3 |  COMPlus_EnableAVX2=0 |    1000 |   186.86 ns | 0.7510 ns | 0.7025 ns |  0.14 |    0.00 |
|          |        |                       |         |             |           |           |       |         |
|     Base | Scalar | COMPlus_EnableSSSE3=0 |    1000 | 1,279.13 ns | 4.6502 ns | 4.3498 ns |  1.00 |    0.00 |
| PR_34529 | Scalar | COMPlus_EnableSSSE3=0 |    1000 | 1,075.74 ns | 3.7765 ns | 3.5326 ns |  0.84 |    0.00 |
