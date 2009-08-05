using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Sockets;
using System.Net;
using System.Threading;
using OperatorServiceInterface;

namespace LiveSupport.BLL.Remoting
{
    public class TcpServerTest
    {
        public static void Main()
        {
            Thread t = new Thread(new ThreadStart(delegate () {
                SocketHandler sh = new SocketHandler();
                sh.Listen();
                
            }));
            t.Start();
        }
    }
}
