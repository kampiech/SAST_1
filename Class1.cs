using System.Diagnostics;

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
    }
}