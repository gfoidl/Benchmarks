//#define APPEND_CHAR
#define APPEND_STRING
#define APPEND_SINGLECHAR_STRING

using System.Text;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Attributes.Columns;
using BenchmarkDotNet.Configs;

namespace ValueStringBuilderBenchmarks.Benchmarks
{
    // Based on https://github.com/dotnet/corefx/issues/29921#issue-326581891

    [MemoryDiagnoser]
    [GroupBenchmarksBy(BenchmarkLogicalGroupRule.ByCategory), CategoriesColumn]
    public class StringBuilderBench
    {
        private const int N = 100_000;
        private const char CharToAppend = '<';
        private const string StringToAppend = "&lt;";
        private const string SingleCharStringToAppend = "<";

        private char[] _charInitialBuffer = new char[N];
        private char[] _stringInitialBuffer = new char[N * StringToAppend.Length];

#if APPEND_CHAR
        [Benchmark(Baseline = true), BenchmarkCategory("AppendChar")]
        public string StringBuilder_AppendChar()
        {
            var builder = new StringBuilder(_charInitialBuffer.Length);

            for (var i = 0; i < N; i++)
            {
                builder.Append(CharToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendChar")]
        public string ValueStringBuilder0_AppendChar()
        {
            var builder = new ValueStringBuilder0(_charInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(CharToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendChar")]
        public string ValueStringBuilder1_AppendChar()
        {
            var builder = new ValueStringBuilder(_charInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(CharToAppend);
            }

            return builder.ToString();
        }
#endif
#if APPEND_STRING
        [Benchmark(Baseline = true), BenchmarkCategory("AppendString")]
        public string StringBuilder_AppendString()
        {
            var builder = new StringBuilder(_stringInitialBuffer.Length);
            for (var i = 0; i < N; i++)
            {
                builder.Append(StringToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendString")]
        public string ValueStringBuilder0_AppendString()
        {
            var builder = new ValueStringBuilder0(_stringInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(StringToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendString")]
        public string ValueStringBuilder1_AppendString()
        {
            var builder = new ValueStringBuilder1(_stringInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(StringToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendString")]
        public string ValueStringBuilder2_AppendString()
        {
            var builder = new ValueStringBuilder2(_stringInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(StringToAppend);
            }

            return builder.ToString();
        }       
#endif
#if APPEND_SINGLECHAR_STRING
        [Benchmark(Baseline = true), BenchmarkCategory("AppendSingleCharString")]
        public string StringBuilder_AppendSingleCharString()
        {
            var builder = new StringBuilder(_charInitialBuffer.Length);
            for (var i = 0; i < N; i++)
            {
                builder.Append(SingleCharStringToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendSingleCharString")]
        public string ValueStringBuilder0_AppendSingleCharString()
        {
            var builder = new ValueStringBuilder0(_charInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(SingleCharStringToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendSingleCharString")]
        public string ValueStringBuilder1_AppendSingleCharString()
        {
            var builder = new ValueStringBuilder1(_charInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(SingleCharStringToAppend);
            }

            return builder.ToString();
        }

        [Benchmark, BenchmarkCategory("AppendSingleCharString")]
        public string ValueStringBuilder2_AppendSingleCharString()
        {
            var builder = new ValueStringBuilder2(_charInitialBuffer);

            for (var i = 0; i < N; i++)
            {
                builder.Append(SingleCharStringToAppend);
            }

            return builder.ToString();
        }
#endif
    }
}
