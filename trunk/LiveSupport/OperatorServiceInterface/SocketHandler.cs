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
        public OperatorServiceInterface.SocketHandler.StateObject StateObject;
        public DataArriveEventArgs(object data, OperatorServiceInterface.SocketHandler.StateObject stateObject)
        {
            Data = data;
            StateObject = stateObject;
        }
    }
    public class ExceptionEventArgs : EventArgs
    {
        public Exception Exception;
        public ExceptionEventArgs(Exception ex)
        {
            this.Exception = ex;
        }
    }
    //
    public class SocketHandler
    {
        private const int LocalPort = 3333;
        private List<Socket> ConnectedSockets = new List<Socket>();

        public event EventHandler<DataArriveEventArgs> DataArrive;
        public event EventHandler<ExceptionEventArgs> Exception;

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
                t.NoDelay = true;
                t.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.NoDelay, 1);
                ConnectedSockets.Add(t);

                //Begin to receive data
                StateObject so = new StateObject();
                so.workSocket = t;
                t.BeginReceive(so.buffer, 0, 4096, SocketFlags.None, new AsyncCallback(OnReceive), so);
            }
            catch (Exception ex)
            {
                Trace.WriteLine("Error: OnAccept exception " + ex.Message);

                if (Exception != null)
                {
                    Exception(this, new ExceptionEventArgs(ex));
                }
            }
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
                        Trace.Write("Debug: SocketHandler.OnReceive Header, Body Length=" + so.bytesToReceive);
                        offset = 4;
                    }
                    if (so.bytesToReceive > receivedBytes + so.offset - offset)
                    {
                        //so.data.Append(Encoding.Unicode.GetString(so.buffer, offset, receivedBytes + so.offset - offset));
                        so.data.Write(so.buffer, offset, receivedBytes + so.offset - offset);
                        Trace.Write(" receive Body, Length=" + receivedBytes);
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
                        if (obj != null)
                        {
                            Trace.WriteLine(" receive Body Completed, Recv object= " + obj.ToString());

                            if (DataArrive != null)
                            {
                                try
                                {
                                    DataArrive(this, new DataArriveEventArgs(obj, so));
                                }
                                catch (Exception ex)
                                {
                                    Trace.WriteLine("Error: Raise DataArrive event exception " + ex.Message);

                                    if (Exception != null)
                                    {
                                        Exception(this, new ExceptionEventArgs(ex));
                                    }
                                }
                            }
                        }
                        else
                        {
                            Trace.WriteLine(" receive Body Completed, Error: Deserialize failed!");
                        }

                        StateObject so1 = new StateObject();
                        so1.workSocket = s;
                        so1.OperatorId = so.OperatorId;
                        Array.Copy(so.buffer, offset + so.bytesToReceive, so1.buffer, 0, so.offset + receivedBytes - offset - so.bytesToReceive);
                        so1.offset = so.offset + receivedBytes - offset - so.bytesToReceive;
                        so.data.Close();
                        s.BeginReceive(so1.buffer, so1.offset, 4096 - so1.offset, SocketFlags.None, new AsyncCallback(OnReceive), so1);
                    }

                }
                catch (Exception ex)
                {
                    Trace.WriteLine("Error: OnReceive exception " + ex.Message);
                    if (Exception != null)
                    {
                        ex.Data["OperatorId"] = so.OperatorId;
                        Exception(this, new ExceptionEventArgs(ex));
                    }
                }
            }
        }

        public Socket Connect(string ipAddress)
        {
            Socket client = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            client.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.NoDelay, 1);
            client.NoDelay = true;
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
            try
            {
                lock (s)
                {
                    byte[] cs = new byte[0];
                    s.Send(cs);
                    Trace.Write("SendPacket : " + obj.ToString());
                    BinaryFormatter fo = new BinaryFormatter();
                    MemoryStream stream = new MemoryStream();
                    fo.Serialize(stream, obj);
                    int bs = s.Send(BitConverter.GetBytes(Convert.ToInt32(stream.Length)));
                    if (bs != 4)
                    {
                        Trace.Write(" Error: Send(4) return" + bs);
                    }
                    bs = s.Send(stream.GetBuffer(), Convert.ToInt32(stream.Length), SocketFlags.None);
                    if (bs != stream.Length)
                    {
                        Trace.Write(string.Format(" Error: Send({0}) return {1}", stream.Length, bs));
                    }
                    s.Send(cs);
                    Trace.WriteLine("");
                }
            }
            catch (Exception ex)
            {
                Trace.WriteLine("Error: SendPacket exception " + ex.Message);
                if (Exception != null)
                {
                    Exception(this, new ExceptionEventArgs(ex));
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
