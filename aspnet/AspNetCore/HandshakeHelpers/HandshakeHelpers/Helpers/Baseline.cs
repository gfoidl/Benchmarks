using System;

namespace HandshakeHelpers.Helpers
{
    public static class Baseline
    {
        public static bool IsRequestKeyValid(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                return false;
            }
            try
            {
                byte[] data = Convert.FromBase64String(value);
                return data.Length == 16;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
