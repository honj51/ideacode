using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Runtime.Remoting.Channels.Http;
using System.IO;
using OperatorServiceInterface;

namespace OperatorRemotingClient
{
    class Program
    {
        static void Main(string[] args)
        {
            //使用HTTP通道得到远程对象
            HttpChannel chan2 = new HttpChannel();
            ChannelServices.RegisterChannel(chan2,false);
            IOperatorServer obj2 = (IOperatorServer)Activator.GetObject(
                typeof(IOperatorServer),
                "http://localhost:3355/OperatorServer.aspx");
            if (obj2 == null)
            {
                System.Console.WriteLine(
                    "Could not locate HTTP server");
            }

            Console.WriteLine(
                "Client1 HTTP HelloMethod {0}",
                obj2.Hello());
        }
    }
}
