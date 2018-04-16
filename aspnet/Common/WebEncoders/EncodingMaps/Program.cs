using System;
using System.IO;

namespace EncodingMaps
{
    class Program
    {
        private static readonly string s_base64UrlCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
        //---------------------------------------------------------------------
        static void Main(string[] args)
        {
            using (StreamWriter sw = File.CreateText("encoding-map.txt"))
                WriteEncodingMap(sw);

            using (StreamWriter sw = File.CreateText("decoding-map.txt"))
                WriteDecodingMap(sw);
        }
        //---------------------------------------------------------------------
        private static void WriteEncodingMap(StreamWriter sw)
        {
            for (int i = 0; i < s_base64UrlCharacters.Length; ++i)
            {
                sw.Write($"{(int)s_base64UrlCharacters[i],3}");
                sw.Write($"/*{s_base64UrlCharacters[i]}*/");

                if (i < s_base64UrlCharacters.Length - 1)
                    sw.Write(", ");

                if (i % 8 == 7) sw.WriteLine();
            }
        }
        //---------------------------------------------------------------------
        private static void WriteDecodingMap(StreamWriter sw)
        {
            sbyte[] map = GetDecodingMap();

            for (int i = 0; i < map.Length; ++i)
            {
                sw.Write($"{map[i],2}");

                //if (map[i] != -1)
                //  sw.Write($"/*{s_base64UrlCharacters[map[i]]}*/");

                if (i < map.Length - 1)
                    sw.Write(", ");

                if (i % 16 == 15) sw.WriteLine();
            }

            sbyte[] GetDecodingMap()
            {
                var map1 = new sbyte[256];
                map1.AsSpan().Fill(-1);

                for (int i = 0; i < s_base64UrlCharacters.Length; ++i)
                    map1[s_base64UrlCharacters[i]] = (sbyte)i;

                return map1;
            }
        }
    }
}
