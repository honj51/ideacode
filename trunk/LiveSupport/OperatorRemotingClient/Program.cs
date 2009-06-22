using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Runtime.Remoting.Channels.Http;
using System.IO;
using OperatorServiceInterface;
using System.Runtime.Remoting.Messaging;
using LiveSupport.LiveSupportModel;
using System.Security;
using System.Security.Permissions;

namespace OperatorRemotingClient
{
    class Program
    {
        [PermissionSet(SecurityAction.LinkDemand)]
        static void Main(string[] args)
        {

            RemotingConfiguration.Configure(
                AppDomain.CurrentDomain.SetupInformation.ConfigurationFile,false
                );

            IOperatorServer obj2 = (IOperatorServer)Activator.GetObject(typeof(IOperatorServer), "http://localhost:3355/livechat/OperatorServer.rem");
            OperatorServerEventSink sink = new OperatorServerEventSink();
            sink.Tag = "11111";
            //obj2.OperatorStatusChange +=new OperatorStatusChangeEventHandler(sink.OnOperatorStatusChange);
            obj2.OperatorStatusChanged += new EventHandler<OperatorStatusChangeEventArgs>(sink.OnOperatorStatusChange);
            //sink.OperatorStatusChange += new OperatorStatusChangeEventHandler(sink_OperatorStatusChange);
            sink.OperatorStatusChanged +=new EventHandler<OperatorStatusChangeEventArgs>(sink_OperatorStatusChange);
            //Console.WriteLine(
            //    "Client1 HTTP HelloMethod {0}",
            //    obj2.Hello("aaa"));

            Operator op = obj2.Login("100000","zxkefu", "zxkefu");
            AuthenticateData ad = new AuthenticateData();
            ad.OperatorId = op.OperatorId;
            ad.OperatorSession = op.OperatorSession;
            CallContext.SetData("AuthenticateData", ad);

            obj2.Logout();
            
            Console.Read();
            //obj2.OperatorStatusChange -= new OperatorStatusChangeEventHandler(sink.OnOperatorStatusChange);
        }

        static void obj2_OperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {
            throw new NotImplementedException();
        }

        static void sink_OperatorStatusChange(object sender, OperatorStatusChangeEventArgs e)
        {
            System.Console.WriteLine("Operator:" + e.OperatorId + " status change to " + e.Status);
        }
    }
}
