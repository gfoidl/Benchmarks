using System.Runtime.CompilerServices;
using BenchmarkDotNet.Running;
using HillClimbinComplex;

[module: SkipLocalsInit]

BenchmarkRunner.Run<Benchmarks>();
