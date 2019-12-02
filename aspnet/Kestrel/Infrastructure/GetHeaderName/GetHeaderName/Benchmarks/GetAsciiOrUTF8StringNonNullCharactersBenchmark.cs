using System;
using System.Collections.Generic;
using System.Text;
using BenchmarkDotNet.Attributes;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace GetHeaderName.Benchmarks
{
    [MemoryDiagnoser]
    public class GetAsciiOrUTF8StringNonNullCharactersBenchmark
    {
        private byte[] _bytes;

        private static readonly int[] s_dataLength = { 4, 8, 16, 32, 100 };

        [ParamsSource(nameof(TestDataSource))]
        public (int Length, string String) TestData { get; set; }

        public static IEnumerable<(int Length, string String)> TestDataSource()
        {
            var rnd = new Random(42);
            char[] domain = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRQRSTUVXYZ".ToCharArray();

            for (int i = 0; i < s_dataLength.Length; ++i)
            {
                int stringLength = s_dataLength[i];
                var chars = new char[stringLength];

                for (int j = 0; j < chars.Length; ++j)
                {
                    int idx = rnd.Next(domain.Length);
                    chars[j] = domain[idx];
                }
                yield return (stringLength, new string(chars));

                char currentChar = chars[0];
                chars[0] = 'ü';
                yield return (stringLength, new string(chars));
                chars[0] = currentChar;

                currentChar = chars[^1];
                chars[^1] = 'ü';
                yield return (stringLength, new string(chars));
            }

            //const string s = "abcdef\0123";
            //yield return (s.Length, s);
        }

        public string Expected => this.TestData.String;

        [GlobalSetup]
        public void GlobalSetup()
        {
            _bytes = Encoding.UTF8.GetBytes(this.TestData.String);
        }

        [Benchmark(Baseline = true)]
        public string Default()
        {
            ReadOnlySpan<byte> buffer = _bytes;
            return buffer.GetAsciiOrUTF8StringNonNullCharactersDefault();
        }

        [Benchmark]
        public string StringCreate()
        {
            ReadOnlySpan<byte> buffer = _bytes;
            return buffer.GetAsciiOrUTF8StringNonNullCharacters();
        }
    }
}
