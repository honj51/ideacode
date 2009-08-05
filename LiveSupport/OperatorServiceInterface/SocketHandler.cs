using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Diagnostics;
namespace OperatorServiceInterface
{
    public class SocketHandler
    {
        private const int LocalPort = 3333;
        private List<Socket> ConnectedSockets = new List<Socket>();

        public delegate void CallbackHandler(DataPacket cmd, Socket s);
        public CallbackHandler OnDataArrive;

        private void OnAccept(IAsyncResult ar)
        {
            Socket s = (Socket)ar.AsyncState;
            try
            {
                //BeginAccept for next connection
                s.BeginAccept(new AsyncCallback(OnAccept), s);

                Socket t = s.EndAccept(ar);
                t.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.NoDelay, 0);
                ConnectedSockets.Add(t);

                //Begin to receive data
                StateObject so = new StateObject();
                so.workSocket = t;
                t.BeginReceive(so.buffer, 0, 4096, SocketFlags.None, new AsyncCallback(OnReceive), so);
            }
            catch { throw; }
        }
        
        private void OnReceive(IAsyncResult ar)
        {
            StateObject so = (StateObject)ar.AsyncState;
            Socket s = so.workSocket;
            lock (s)
            {
                try
                {
                    int receivedBytes = s.EndReceive(ar);
                    if (receivedBytes == 0) return;
                    int offset = 0;
                    if (so.bytesToReceive == 0 && so.data.Length == 0)
                    {
                        //initialize
                        so.bytesToReceive = BitConverter.ToInt32(so.buffer, 0);
                        offset = 4;
                        //so.data.Append(Encoding.Unicode.GetString(so.buffer, 4, so.offset + receivedBytes - 4));
                        //Debug.Assert(so.bytesToReceive >= so.offset + receivedBytes - 4);
                        //so.bytesToReceive -= so.offset + receivedBytes - 4;
                        //s.BeginReceive(so.buffer, 0, 4096, SocketFlags.None, new AsyncCallback(OnReceive), so);
                    }
                    if (so.bytesToReceive > receivedBytes + so.offset - offset)
                    {
                        so.data.Append(Encoding.Unicode.GetString(so.buffer, offset, receivedBytes + so.offset - offset));
                        Debug.Assert(so.bytesToReceive >= receivedBytes + so.offset - offset);
                        so.bytesToReceive -= receivedBytes + so.offset - offset;
                        so.offset = 0;
                        s.BeginReceive(so.buffer, 0, 4096, SocketFlags.None, new AsyncCallback(OnReceive), so);
                    }
                    else
                    {
                        so.data.Append(Encoding.Unicode.GetString(so.buffer, offset, so.bytesToReceive));
                        //receive finished
                        DataPacket packet = DataPacket.LoadXML(so.data.ToString());
                        if (OnDataArrive != null)
                        {
                            OnDataArrive(packet, so.workSocket);
                        }
                        StateObject so1 = new StateObject();
                        so1.workSocket = s;
                        Array.Copy(so.buffer, offset + so.bytesToReceive, so1.buffer, 0, so.offset + receivedBytes - offset - so.bytesToReceive);
                        so1.offset = so.offset + receivedBytes - offset - so.bytesToReceive;
                        s.BeginReceive(so1.buffer, so1.offset, 4096 - so1.offset, SocketFlags.None, new AsyncCallback(OnReceive), so1);
                    }

                }
                catch (Exception ex) 
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        public Socket Connect(string ipAddress)
        {
            Socket client = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            client.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.NoDelay, 0);
            client.Connect(IPAddress.Parse(ipAddress), LocalPort);
            StateObject so = new StateObject();
            so.workSocket = client;
            client.BeginReceive(so.buffer, 0, 4096, SocketFlags.None, new AsyncCallback(OnReceive), so);
            return client;
        }

        public Socket Listen()
        {
            IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Any, LocalPort);
            Socket listener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            listener.Bind(localEndPoint);
            listener.Listen(10);
            listener.BeginAccept(new AsyncCallback(OnAccept), listener);
            return listener;
        }

        public void SendPacket(Socket s, DataPacket data)
        {
            lock (s)
            {
                string xmlData = DataPacket.SaveXML(data);
                byte[] sendBytes = Encoding.Unicode.GetBytes(xmlData);
                s.Send(BitConverter.GetBytes(sendBytes.Length));
                s.Send(sendBytes);
            }
        }

        public void BroadCastPacket(DataPacket data)
        {
            foreach (Socket t in ConnectedSockets)
            {
                SendPacket(t, data);
            }
        }

        public class StateObject
        {
            // Client socket.
            public Socket workSocket = null;
            // Size of receive buffer.
            public const int BufferSize = 4096;
            // Receive buffer.
            public byte[] buffer = new byte[BufferSize];
            // Raw Data
            public StringBuilder data = new StringBuilder();
            // BytesToReceive
            public int bytesToReceive = 0;
            // offset
            public int offset = 0;
        }
    }
}
