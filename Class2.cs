using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Text.RegularExpressions;

namespace SAST
{
    public class P
    {
        public void C1()
        {
            var r = new Random(1);
        }

        public void C2()
        {
            var r = new Random();
            var randomNumbers = new List<long>();
            for (var i = 0; i < 6; ++i)
            {
                randomNumbers.Add(r.NextInt64());
            }
        }


        public void R1_4()
        {
            var regex = new Regex(
    pattern: "^(a+)+$",
    options: RegexOptions.None
);

            regex.IsMatch("");
        }

        public void S1_3(string url)
        {
            var client = new WebClient();
            var data = client.DownloadDataTaskAsync(url);
        }

        public void S4(string url)
        {
            var client = new HttpClient();
            var d2 = client.GetByteArrayAsync(url);
        }
        public void T1(string filename)
        {
            string baseDirectory = "base";
            var fullPath = baseDirectory + "/" + filename;
            var file = System.IO.File.ReadAllBytesAsync(fullPath);
        }

    }
}
