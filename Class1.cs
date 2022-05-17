using System.Diagnostics;
using System.Security.Cryptography;

namespace SAST
{
    public class Class1
    {
        //commands in PATH is security-sensitive
        private void CommandsPath()
        {
            Process p = new Process();
            p.StartInfo.FileName = "binary"; // Sensitive
        }

        public void WeekHash()
        {
            var hashProvider1 = new MD5CryptoServiceProvider(); // Sensitive
            var hashProvider2 = (HashAlgorithm)CryptoConfig.CreateFromName("MD5"); // Sensitive
            var hashProvider3 = new SHA1Managed(); // Sensitive
            var hashProvider4 = HashAlgorithm.Create("SHA1"); // Sensitive
        }
    }
}