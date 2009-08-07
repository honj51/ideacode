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
using System.Windows.Forms;
using LiveSupport.BLL.Remoting;
using System.Net.Sockets;
using System.Threading;

namespace OperatorRemotingClient
{
    class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new ClientForm());
            SocketHandler sh = new SocketHandler();
            sh.DataArrive += new EventHandler<DataArriveEventArgs>(sh_DataArrive);
            
            Socket s = sh.Connect("127.0.0.1");
            sh.SendPacket(s, new OperatorServiceInterface.LoginAction("111"));
            while (true)
            {
                Thread.Sleep(1000);
            }
        }

        static void sh_DataArrive(object sender, DataArriveEventArgs e)
        {
            Console.WriteLine("Recv: "+ e.Data.ToString());
        }
    }
}
