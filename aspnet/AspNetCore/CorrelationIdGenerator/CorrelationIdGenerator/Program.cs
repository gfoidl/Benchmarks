using System;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;
using System.Diagnostics;
using System.Runtime.Intrinsics.X86;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace CorrelationIdGenerator_Benchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            Debug.Assert(Ssse3.IsSupported);

            //long lastId = DateTime.UtcNow.Ticks;
            //long lastId = 0x_00_00_00_00_00_00_00_FF - 1;
            //long lastId = 0x_00_00_00_00_00_00_FF_FF - 1;
            //long lastId = 0x_00_00_00_00_00_00_EE_FF - 1;
            //long lastId = 0x_00_00_00_00_FF_FF_FF_FF - 1;
            long lastId = 0x_12_34_56_78_9A_BC_DE_FA - 1;
            //long lastId = unchecked((long)(0x_FF_FF_FF_FF_FF_FF_FF_FF - 1));
            //long lastId = unchecked((long)(0x_AF_FF_FF_FF_FF_FF_FF_FF - 1));
            CorrelationIdGenerator.LastId = lastId;
            CorrelationIdGenerator1.LastId = lastId;
            CorrelationIdGenerator2.LastId = lastId;
            CorrelationIdGenerator3.LastId = lastId;
            CorrelationIdGenerator4.LastId = lastId;
            CorrelationIdGenerator5.LastId = lastId;
            CorrelationIdGenerator6.LastId = lastId;
            CorrelationIdGenerator7.LastId = lastId;
            CorrelationIdGenerator8.LastId = lastId;
            CorrelationIdGenerator9.LastId = lastId;

            gfoidl.Tools.Intrinsics.Printer.EnablePrint = false;
            string id0 = CorrelationIdGenerator.GetNextId();
            string id1 = CorrelationIdGenerator1.GetNextId();
            string id2 = CorrelationIdGenerator2.GetNextId();
            string id3 = CorrelationIdGenerator3.GetNextId();
            string id4 = CorrelationIdGenerator4.GetNextId();
            string id5 = CorrelationIdGenerator5.GetNextId();
            string id6 = CorrelationIdGenerator6.GetNextId();
            string id7 = CorrelationIdGenerator7.GetNextId();
            gfoidl.Tools.Intrinsics.Printer.EnablePrint = true;
            string id8 = CorrelationIdGenerator8.GetNextId();
            Console.WriteLine();
            string id9 = CorrelationIdGenerator9.GetNextId();

            Console.WriteLine();
            Console.WriteLine("value: 0x{0:x2}", lastId + 1);
            Console.WriteLine(id0);
            //Console.WriteLine(id1);
            //Console.WriteLine(id2);
            //Console.WriteLine(id3);
            //Console.WriteLine(id4);
            //Console.WriteLine(id5);
            //Console.WriteLine(id6);
            //Console.WriteLine(id7);
            //Console.WriteLine(id8);
            Console.WriteLine(id9);

            Console.WriteLine();
            Console.WriteLine(CorrelationIdGenerator.GetNextId());
            Console.WriteLine(CorrelationIdGenerator.GetNextId());
            Console.WriteLine(CorrelationIdGenerator.GetNextId());

            Console.WriteLine();
            gfoidl.Tools.Intrinsics.Printer.EnablePrint = false;
            Console.WriteLine(CorrelationIdGenerator9.GetNextId());
            Console.WriteLine(CorrelationIdGenerator9.GetNextId());
            Console.WriteLine(CorrelationIdGenerator9.GetNextId());
            gfoidl.Tools.Intrinsics.Printer.EnablePrint = true;



            if (id0 != id1 || id0 != id2 || id0 != id3 || id0 != id4 || id0 != id5 || id0 != id6 || id0 != id7 || id0 != id8 || id0 != id9)
                Environment.Exit(1);
#if !DEBUG
            //BenchmarkRunner.Run<GetNextIdBenchmark>();
            BenchmarkSwitcher.FromAssembly(typeof(Program).Assembly).Run(args);
#endif
        }
    }
}
