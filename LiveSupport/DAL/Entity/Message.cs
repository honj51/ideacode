using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;

namespace LiveSupport.DAL.Entity
{
    public class Message
    {
        public enum MessageType
        {
           ChatMessage,SystemMessage

        }
        private int messageId;
        [XmlElement]
        public int MessageId
        {
            get { return messageId; }
            set { messageId = value; }
        }
        private string chatID;
        [XmlElement]
        public string ChatID
        {
            get { return chatID; }
            set { chatID = value; }
        }
        private string source;
        [XmlElement]
        public string Source
        {
            get { return source; }
            set { source = value; }
        }
        private string destination;
        [XmlElement]
        public string Destination
        {
            get { return destination; }
            set { destination = value; }
        }
        private string text;
        [XmlElement]
        public string Text
        {
            get { return text; }
            set { text = value; }
        }
        private DateTime sentDate;
        [XmlElement]
        public DateTime SentDate
        {
            get { return sentDate; }
            set { sentDate = value; }
        }
        private string type;
        [XmlElement]
        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        public Message()
        { 

        }
        public Message(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["MessageId"])) messageId = (int)data["MessageId"];
            if (!Convert.IsDBNull(data["ChatID"])) chatID = (string)data["ChatID"];
            if (!Convert.IsDBNull(data["Source"])) source = (string)data["Source"];
            if (!Convert.IsDBNull(data["Destination"])) Destination = (string)data["Destination"];
            if (!Convert.IsDBNull(data["Text"])) text = (string)data["Text"];
            if (!Convert.IsDBNull(data["SentDate"])) sentDate = (DateTime)data["SentDate"];
            if (!Convert.IsDBNull(data["Type"])) type = (string)data["Type"];
        }

    }
}
