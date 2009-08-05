using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;
using System.IO;

namespace OperatorServiceInterface
{
    public enum CommandCode
    {
        None,
        SendMessage,
        BroadCastMessage,
        PollMessage,
    }

    [XmlRoot()]
    public class DataPacket : ISingleMessage, IPollMessageParams
    {
        [XmlAttribute]
        public CommandCode command;

#region SingleMessage
        [XmlAttribute]
        public string message;
        [XmlAttribute]
        public DateTime time;
        [XmlAttribute]
        public string sender;
        string ISingleMessage.Message
        {
            get { return message; }
            set { message = value; }
        }
        string ISingleMessage.Sender
        {
            get { return sender; }
            set { sender = value; }
        }
        DateTime ISingleMessage.SendTime
        {
            get { return time; }
            set { time = value; }
        }
#endregion

#region PollMessageParams
        [XmlAttribute]
        public DateTime lasttime;
        DateTime IPollMessageParams.LastRetrievedMessageTime
        {
            get { return lasttime; }
            set { lasttime = value; }
        }
#endregion

        public DataPacket()
        {
            command = CommandCode.None;
            message = string.Empty;
            sender = string.Empty;
            time = DateTime.Now;
        }

        static public string SaveXML(DataPacket obj)
        {
            XmlSerializer s = new XmlSerializer(typeof(DataPacket));
            StringBuilder sb = new StringBuilder();
            TextWriter sw = new StringWriter(sb);
            s.Serialize(sw, obj);
            //Console.WriteLine("SaveXML: " + sb.ToString());
            return sb.ToString();
        }
        static public DataPacket LoadXML(string xml)
        {
            //Console.WriteLine("LoadXML: " + xml);
            XmlSerializer s = new XmlSerializer(typeof(DataPacket));
            TextReader sr = new StringReader(xml);
            return (DataPacket)s.Deserialize(sr);
        }
    }

    public interface ISingleMessage
    {
        string Message { get; set;}
        DateTime SendTime { get; set;}
        string Sender { get;set;}
    }

    public interface IPollMessageParams
    {
        DateTime LastRetrievedMessageTime { get; set; }
    }

}
