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
|   Method |    Job |  EnvironmentVariables | DataLen |        Mean |     Error |    StdDev |      Median | Ratio | RatioSD |
|--------- |------- |---------------------- |-------- |------------:|----------:|----------:|------------:|------:|--------:|
|     **Base** |   **AVX2** |                 **Empty** |       **5** |    **31.42 ns** | **0.1281 ns** | **0.1135 ns** |    **31.41 ns** |  **1.00** |    **0.00** |
| PR_34529 |   AVX2 |                 Empty |       5 |    34.23 ns | 0.1214 ns | 0.1076 ns |    34.21 ns |  1.09 |    0.00 |
|          |        |                       |         |             |           |           |             |       |         |
|     Base |  SSSE3 |  COMPlus_EnableAVX2=0 |       5 |    31.59 ns | 0.1382 ns | 0.1293 ns |    31.58 ns |  1.00 |    0.00 |
| PR_34529 |  SSSE3 |  COMPlus_EnableAVX2=0 |       5 |    32.77 ns | 0.2750 ns | 0.2573 ns |    32.73 ns |  1.04 |    0.01 |
|          |        |                       |         |             |           |           |             |       |         |
|     Base | Scalar | COMPlus_EnableSSSE3=0 |       5 |    29.82 ns | 0.6339 ns | 1.1431 ns |    29.11 ns |  1.00 |    0.00 |
| PR_34529 | Scalar | COMPlus_EnableSSSE3=0 |       5 |    31.69 ns | 0.1361 ns | 0.1206 ns |    31.66 ns |  1.01 |    0.02 |
|          |        |                       |         |             |           |           |             |       |         |
|     **Base** |   **AVX2** |                 **Empty** |      **16** |    **46.15 ns** | **0.4498 ns** | **0.4207 ns** |    **46.38 ns** |  **1.00** |    **0.00** |
| PR_34529 |   AVX2 |                 Empty |      16 |    34.30 ns | 0.0933 ns | 0.0827 ns |    34.29 ns |  0.74 |    0.01 |
|          |        |                       |         |             |           |           |             |       |         |
|     Base |  SSSE3 |  COMPlus_EnableAVX2=0 |      16 |    44.83 ns | 0.4153 ns | 0.3885 ns |    44.69 ns |  1.00 |    0.00 |
| PR_34529 |  SSSE3 |  COMPlus_EnableAVX2=0 |      16 |    34.58 ns | 0.1379 ns | 0.1152 ns |    34.55 ns |  0.77 |    0.01 |
|          |        |                       |         |             |           |           |             |       |         |
|     Base | Scalar | COMPlus_EnableSSSE3=0 |      16 |    45.22 ns | 0.2269 ns | 0.2011 ns |    45.25 ns |  1.00 |    0.00 |
| PR_34529 | Scalar | COMPlus_EnableSSSE3=0 |      16 |    44.25 ns | 0.3352 ns | 0.3136 ns |    44.13 ns |  0.98 |    0.01 |
|          |        |                       |         |             |           |           |             |       |         |
|     **Base** |   **AVX2** |                 **Empty** |    **1000** | **1,139.35 ns** | **2.4402 ns** | **2.0377 ns** | **1,140.13 ns** |  **1.00** |    **0.00** |
| PR_34529 |   AVX2 |                 Empty |    1000 |   149.32 ns | 0.2549 ns | 0.1990 ns |   149.39 ns |  0.13 |    0.00 |
|          |        |                       |         |             |           |           |             |       |         |
|     Base |  SSSE3 |  COMPlus_EnableAVX2=0 |    1000 | 1,141.11 ns | 9.0107 ns | 8.4286 ns | 1,137.35 ns |  1.00 |    0.00 |
| PR_34529 |  SSSE3 |  COMPlus_EnableAVX2=0 |    1000 |   215.75 ns | 0.2760 ns | 0.2305 ns |   215.74 ns |  0.19 |    0.00 |
|          |        |                       |         |             |           |           |             |       |         |
|     Base | Scalar | COMPlus_EnableSSSE3=0 |    1000 | 1,138.11 ns | 4.1470 ns | 3.8791 ns | 1,136.82 ns |  1.00 |    0.00 |
| PR_34529 | Scalar | COMPlus_EnableSSSE3=0 |    1000 | 1,042.58 ns | 2.4061 ns | 2.1330 ns | 1,042.86 ns |  0.92 |    0.00 |
