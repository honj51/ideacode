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

            RemotingConfiguration.Configure(
                AppDomain.CurrentDomain.SetupInformation.ConfigurationFile,false
                );

            IOperatorServer obj2 = (IOperatorServer)Activator.GetObject(typeof(IOperatorServer), "http://localhost:3355/livechat/OperatorServer.rem");

            OperatorStatusChangeEventHandler h = new OperatorStatusChangeEventHandler(obj2_OperatorStatusChange);
            obj2.OperatorStatusChange += h;

            Console.WriteLine(
                "Client1 HTTP HelloMethod {0}",
                obj2.Hello("aaa"));

            obj2.Login("111", "", "");

            Console.Read();
        }

        static void obj2_OperatorStatusChange(OperatorStatusChangeEventArg arg)
        {
            System.Console.WriteLine("Operator:" + arg.OperatorId + " status change to " + arg.Status);
        }

        static void obj2_OperatorStatusChange(object sender, OperatorStatusChangeEventArg e)
        {
        }
    }
}
