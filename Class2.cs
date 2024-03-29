﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Xml;

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

        public void T2(string filename)
        {
            string baseDirectory = "base";
            var client = new HttpClient();
            var fullPath = baseDirectory + "/" + filename;
            var d2 = client.GetByteArrayAsync(fullPath);
        }
        public void T3(string filename)
        {
            string baseDirectory = "base";
            var fullPath = Path.Combine(baseDirectory ,filename);
            var file = System.IO.File.ReadAllBytesAsync(fullPath);
        }

        public class Smodel
        { }
        public void U2(string json)
        {
            var treasure = JsonConvert.DeserializeObject<Smodel>(
    json,
    new JsonSerializerSettings
    {
        TypeNameHandling = TypeNameHandling.All,
    }
);
        }

        public void X1(string xml)
        {
            var doc = new XmlDocument();
            doc.XmlResolver = new XmlUrlResolver();
            var name = string.Empty;

            doc.LoadXml(xml);
            var elems = doc.GetElementsByTagName("name");
            var texts = elems.Cast<XmlNode>().Select(e => e.InnerText);
            name = string.Join(", ", texts);

        }


    }
}
