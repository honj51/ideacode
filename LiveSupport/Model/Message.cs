using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public enum MessageType
    {
        ChatMessage_OperatorToVisitor, ChatMessage_VistorToOperator, SystemMessage_ToOperator, SystemMessage_ToVisitor,
        SystemMessage_ToBoth
    }

    public class Message
    {
        public static bool FromSystem(Message m) { return m.Type == MessageType.SystemMessage_ToBoth || m.Type == MessageType.SystemMessage_ToOperator || m.Type == MessageType.SystemMessage_ToVisitor; }
        public static bool FromVisitor(Message m) { return m.Type == MessageType.ChatMessage_VistorToOperator; }
        public static bool IsChatMessage(Message m) { return m.Type == MessageType.ChatMessage_VistorToOperator || m.Type == MessageType.ChatMessage_OperatorToVisitor; }
        public static bool IsSystemMessage(Message m) { return !IsChatMessage(m); }
        private string messageId;

        public string MessageId
        {
            get { return messageId; }
            set { messageId = value; }
        }
        private string chatId;

        public string ChatId
        {
            get { return chatId; }
            set { chatId = value; }
        }
        private string source;

        public string Source
        {
            get { return source; }
            set { source = value; }
        }
        private string destination;

        public string Destination
        {
            get { return destination; }
            set { destination = value; }
        }
        private string text;

        public string Text
        {
            get { return text; }
            set { text = value; }
        }
        private DateTime sentDate;

        public DateTime SentDate
        {
            get { return sentDate; }
            set { sentDate = value; }
        }
        private MessageType type;

        public MessageType Type
        {
            get { return type; }
            set { type = value; }
        }

        public Message()
        {
            sentDate = DateTime.Now;
            messageId = Guid.NewGuid().ToString();
        }
        public Message(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["MessageId"])) messageId = (string)data["MessageId"];
            if (!Convert.IsDBNull(data["ChatID"])) chatId = (string)data["ChatID"];
            if (!Convert.IsDBNull(data["Source"])) source = (string)data["Source"];
            if (!Convert.IsDBNull(data["Destination"])) destination = (string)data["Destination"];
            if (!Convert.IsDBNull(data["Text"])) text = (string)data["Text"];
            if (!Convert.IsDBNull(data["SentDate"])) sentDate = (DateTime)data["SentDate"];
            if (!Convert.IsDBNull(data["Type"])) type = (MessageType)Enum.Parse(typeof(MessageType), data["Type"].ToString());

        }
    }
}
