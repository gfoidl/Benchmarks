using System;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Infrastructure;

#if !DEBUG
using BenchmarkDotNet.Running;
#endif

namespace CorrelationIdGenerator_Benchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            long lastId = DateTime.UtcNow.Ticks;
            //long lastId = 0x_00_00_00_00_00_00_00_FF - 1;
            //long lastId = 0x_00_00_00_00_00_00_FF_FF - 1;
            //long lastId = 0x_00_00_00_00_00_00_EE_FF - 1;
            //long lastId = 0x_00_00_00_00_FF_FF_FF_FF - 1;
            //long lastId = 0x_12_34_56_78_9A_BC_DE_FA - 1;
            //long lastId = unchecked((long)(0x_FF_FF_FF_FF_FF_FF_FF_FF - 1));
            //long lastId = unchecked((long)(0x_AF_FF_FF_FF_FF_FF_FF_FF - 1));
            CorrelationIdGenerator.LastId = lastId;
            CorrelationIdGenerator1.LastId = lastId;
            CorrelationIdGenerator2.LastId = lastId;
            CorrelationIdGenerator3.LastId = lastId;
            CorrelationIdGenerator4.LastId = lastId;
            CorrelationIdGenerator5.LastId = lastId;

            string id1 = CorrelationIdGenerator.GetNextId();
            string id2 = CorrelationIdGenerator1.GetNextId();
            string id3 = CorrelationIdGenerator2.GetNextId();
            string id4 = CorrelationIdGenerator3.GetNextId();
            string id5 = CorrelationIdGenerator4.GetNextId();
            string id6 = CorrelationIdGenerator5.GetNextId();

            Console.WriteLine();
            Console.WriteLine("value: 0x{0:x2}", lastId + 1);
            Console.WriteLine(id1);
            //Console.WriteLine(id2);
            //Console.WriteLine(id3);
            //Console.WriteLine(id4);
            //Console.WriteLine(id5);
            Console.WriteLine(id6);

            Console.WriteLine();
            Console.WriteLine(CorrelationIdGenerator.GetNextId());
            Console.WriteLine(CorrelationIdGenerator.GetNextId());
            Console.WriteLine(CorrelationIdGenerator.GetNextId());

            Console.WriteLine();
            gfoidl.Tools.Intrinsics.Printer.EnablePrint = false;
            Console.WriteLine(CorrelationIdGenerator5.GetNextId());
            Console.WriteLine(CorrelationIdGenerator5.GetNextId());
            Console.WriteLine(CorrelationIdGenerator5.GetNextId());
            gfoidl.Tools.Intrinsics.Printer.EnablePrint = true;

            if (id1 != id2 || id1 != id3 || id1 != id4 || id1 != id5 || id1 != id6) Environment.Exit(1);
#if !DEBUG
            BenchmarkRunner.Run<GetNextIdBenchmark>();
#endif
        }
    }
}
