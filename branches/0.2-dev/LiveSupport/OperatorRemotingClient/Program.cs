﻿using System;
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

            OperatorServerEventSink sink = new OperatorServerEventSink();
            sink.Tag = "11111";
            obj2.OperatorStatusChange +=new OperatorStatusChangeEventHandler(sink.OnOperatorStatusChange);
            sink.OperatorStatusChange += new OperatorStatusChangeEventHandler(sink_OperatorStatusChange);

            Console.WriteLine(
                "Client1 HTTP HelloMethod {0}",
                obj2.Hello("aaa"));

            obj2.Login("111", "", "");
            Console.Read();
            obj2.OperatorStatusChange -= new OperatorStatusChangeEventHandler(sink.OnOperatorStatusChange);
        }

        static void sink_OperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {
            System.Console.WriteLine("Operator:" + e.OperatorId + " status change to " + e.Status);
        }
    }
}
