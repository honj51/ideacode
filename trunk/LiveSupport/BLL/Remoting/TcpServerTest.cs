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
        public static SocketHandler sh;

        public static void Main()
        {
            Thread t = new Thread(new ThreadStart(delegate () {
                sh = new SocketHandler();
                sh.DataArrive += new EventHandler<DataArriveEventArgs>(sh_DataArrive);
                sh.Listen();
                
            }));
            t.Start();
        }

        static void sh_DataArrive(object sender, DataArriveEventArgs e)
        {
            if (e.Data.GetType() == typeof(LoginAction))
            {
                sh.SendPacket(e.Socket,new OperatorStatusChangeEventArgs("123", LiveSupport.LiveSupportModel.OperatorStatus.Idle));
            }
            else if (e.Data.GetType() == typeof(LogoutAction))
            {

            }
        }
    }
}
