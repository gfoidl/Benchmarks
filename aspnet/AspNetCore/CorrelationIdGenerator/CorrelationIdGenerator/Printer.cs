using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;

namespace gfoidl.Tools.Intrinsics
{
    public static class Printer
    {
        public static bool EnablePrint { get; set; } = true;
        //---------------------------------------------------------------------
        [DebuggerStepThrough, Conditional("DEBUG")]
        public static void PrintHeader()
        {
            if (!EnablePrint) return;

            Console.Write("{0,-10}: ", "byte-idx");

            Console.ForegroundColor = ConsoleColor.Yellow;
            for (int i = Vector128<sbyte>.Count - 1; i >= 0; --i)
                Console.Write("  {0,2} ", i);

            Console.WriteLine();
            Console.ResetColor();
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough, Conditional("DEBUG")]
        public static void Print(long value, string caption = null)
        {
            if (!EnablePrint) return;

            if (!string.IsNullOrWhiteSpace(caption))
                Console.Write("{0,-10}: ", caption);

            ref sbyte val = ref Unsafe.As<long, sbyte>(ref value);

            for (int i = 0; i < sizeof(long); ++i)
                Console.Write("{0}", new string(' ', 2 + 2 + 1));

            for (int i = sizeof(long) - 1; i >= 0; --i)
            {
                sbyte tmp = Unsafe.Add(ref val, i);

                Console.ForegroundColor = tmp != 0
                    ? ConsoleColor.Green
                    : ConsoleColor.DarkGray;

                Console.Write("0x{0:x2} ", tmp);
            }

            Console.ResetColor();
            Console.WriteLine();
        }
        //---------------------------------------------------------------------
        [DebuggerStepThrough, Conditional("DEBUG")]
        public static void Print(Vector128<sbyte> vec, string caption = null, bool printAsScii = false, bool insertEmptyLineBefore = false, bool insertEmpyLineAfter = false)
        {
            if (!EnablePrint) return;

            if (insertEmptyLineBefore)
                Console.WriteLine();

            if (!string.IsNullOrWhiteSpace(caption))
                Console.Write("{0,-10}: ", caption);

            if (printAsScii)
                PrintAsAscii();
            else
                PrintAsHex();

            Console.ResetColor();
            Console.WriteLine();

            if (insertEmpyLineAfter)
                Console.WriteLine();
            //-----------------------------------------------------------------
            void PrintAsHex()
            {
                for (int i = Vector128<sbyte>.Count - 1; i >= 0; --i)
                {
                    sbyte value = vec.GetElement(i);

                    Console.ForegroundColor = value != 0
                        ? ConsoleColor.Green
                        : ConsoleColor.DarkGray;

                    Console.Write("0x{0:x2} ", value);
                }
            }
            //-----------------------------------------------------------------
            void PrintAsAscii()
            {
                Console.ForegroundColor = ConsoleColor.Cyan;

                for (int i = Vector128<sbyte>.Count - 1; i >= 0; --i)
                    Console.Write("{0,4} ", (char)vec.GetElement(i));
            }
        }
    }
}
