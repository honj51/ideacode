using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Diagnostics;
using OperatorServiceInterface;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
namespace OperatorServiceInterface
{
    public class DataArriveEventArgs : EventArgs
    {
        public object Data;
        public Socket Socket;
        public DataArriveEventArgs(object data, Socket socket)
        {
            Data = data;
            Socket = socket;
        }
    }
    //
    public class SocketHandler
    {
        private const int LocalPort = 3333;
        private List<Socket> ConnectedSockets = new List<Socket>();

        public event EventHandler<DataArriveEventArgs> DataArrive;

        public delegate void CallbackHandler(object cmd, Socket s);//封装命名或匿名方法的引用类型
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
                    if (so.bytesToReceive == 0 && so.data == null)
                    {
                        //initialize
                        so.bytesToReceive = BitConverter.ToInt32(so.buffer, 0);
                        so.data = new MemoryStream();
                        offset = 4;
                    }
                    if (so.bytesToReceive > receivedBytes + so.offset - offset)
                    {
                        //so.data.Append(Encoding.Unicode.GetString(so.buffer, offset, receivedBytes + so.offset - offset));
                        so.data.Write(so.buffer, offset, receivedBytes + so.offset - offset);
                        Debug.Assert(so.bytesToReceive >= receivedBytes + so.offset - offset);
                        so.bytesToReceive -= receivedBytes + so.offset - offset;
                        so.offset = 0;
                        s.BeginReceive(so.buffer, 0, 4096, SocketFlags.None, new AsyncCallback(OnReceive), so);
                    }
                    else
                    {
                        //so.data.Append(Encoding.Unicode.GetString(so.buffer, offset, so.bytesToReceive));
                        //receive finished
                        //DataPacket packet = DataPacket.LoadXML(so.data.ToString());
                        so.data.Write(so.buffer, offset, so.bytesToReceive);

                        BinaryFormatter formatter = new BinaryFormatter();
                        so.data.Position = 0;
                        object obj = formatter.Deserialize(so.data);
                        if (DataArrive != null && obj != null)
                        {
                            DataArrive(this, new DataArriveEventArgs(obj, s));
                        }

                        StateObject so1 = new StateObject();
                        so1.workSocket = s;
                        Array.Copy(so.buffer, offset + so.bytesToReceive, so1.buffer, 0, so.offset + receivedBytes - offset - so.bytesToReceive);
                        so1.offset = so.offset + receivedBytes - offset - so.bytesToReceive;
                        so.data.Close();
                        s.BeginReceive(so1.buffer, so1.offset, 4096 - so1.offset, SocketFlags.None, new AsyncCallback(OnReceive), so1);
                    }

                }
                catch (SocketException socketEx)
                {
                    if (socketEx.SocketErrorCode == SocketError.ConnectionReset)
                    {
                        // TODO: 通知服务层socket连接失效

                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    throw ex;
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
        //发送socket
        public void SendPacket(Socket s, object obj)
        {
            lock (s)
            {
                if (s.Connected)
                {
                    BinaryFormatter fo = new BinaryFormatter();
                    MemoryStream stream = new MemoryStream();
                    fo.Serialize(stream, obj);
                    s.Send(BitConverter.GetBytes(Convert.ToInt32(stream.Length)));
                    s.Send(stream.GetBuffer(), Convert.ToInt32(stream.Length), SocketFlags.None);
                }
            }
        }

        //public void SendPacket(Socket s, DataPacket data)
        //{
        //    lock (s)
        //    {
        //        string xmlData = DataPacket.SaveXML(data);
        //        byte[] sendBytes = Encoding.Unicode.GetBytes(xmlData);
        //        s.Send(BitConverter.GetBytes(sendBytes.Length));
        //        s.Send(sendBytes);
        //    }
        //}

        //public void BroadCastPacket(DataPacket data)
        //{
        //    foreach (Socket t in ConnectedSockets)
        //    {
        //        SendPacket(t, data);
        //    }
        //}

        public class StateObject
        {
            // Client socket.
            public Socket workSocket = null;
            // Size of receive buffer.
            public const int BufferSize = 4096;
            // Receive buffer.
            public byte[] buffer = new byte[BufferSize];
            // Raw Data
            //public StringBuilder data = new StringBuilder();
            public MemoryStream data;
            
            // BytesToReceive
            public int bytesToReceive = 0;
            // offset
            public int offset = 0;

            public string OperatorId;

        }
    }
}
