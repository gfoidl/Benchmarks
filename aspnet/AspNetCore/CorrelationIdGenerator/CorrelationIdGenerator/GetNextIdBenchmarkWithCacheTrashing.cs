using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using BenchmarkDotNet.Attributes;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

namespace CorrelationIdGenerator_Benchmarks
{
    [MemoryDiagnoser]
    public class GetNextIdBenchmarkWithCacheTrashing
    {
        private const int NoOfBytesForData = 100_000;
        private IntPtr _data;
        private bool _isDirty;
        //---------------------------------------------------------------------
        [GlobalSetup]
        public void GlobalSetup()
        {
            _data = Marshal.AllocHGlobal(NoOfBytesForData);
        }
        //---------------------------------------------------------------------
        [GlobalCleanup]
        public void GlobalCleanup()
        {
            Marshal.FreeHGlobal(_data);
            _data = IntPtr.Zero;
        }
        //---------------------------------------------------------------------
        [Benchmark(Baseline = true)]
        public string Default()
        {
            this.UseCache();
            return CorrelationIdGenerator.GetNextId();
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public string Simd()
        {
            this.UseCache();
            return CorrelationIdGenerator5.GetNextId();
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public string Simd_StaticInit()
        {
            this.UseCache();
            return CorrelationIdGenerator6.GetNextId();
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public string Simd_ROSTrick()
        {
            this.UseCache();
            return CorrelationIdGenerator7.GetNextId();
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public string Simd_ROSTrick_ReuseMask()
        {
            this.UseCache();
            return CorrelationIdGenerator8.GetNextId();
        }
        //---------------------------------------------------------------------
        [Benchmark]
        public string Simd_NoStaticData()
        {
            this.UseCache();
            return CorrelationIdGenerator9.GetNextId();
        }
        //---------------------------------------------------------------------
        private unsafe void UseCache()
        {
            Unsafe.InitBlockUnaligned(_data.ToPointer(), 0, NoOfBytesForData);

            bool isDirty = false;

            byte* cur = (byte*)_data.ToPointer();
            byte* end = cur + NoOfBytesForData;

            while (cur < end)
            {
                byte val = *cur;

                if (val != 0) isDirty = true;

                cur++;
            }

            _isDirty = isDirty;
        }
    }
}
