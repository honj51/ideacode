using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;

namespace LiveSupport.DAL.Entity
{
    public class Chat
    {
        public enum MessageStatus
        {
            Requested,Accepted,Decline
        }
        private string chatId;
        [XmlElement]
        public string ChatId
        {
            get { return chatId; }
            set { chatId = value; }
        }
        private string createBy;
        [XmlElement]
        public string CreateBy
        {
            get { return createBy; }
            set { createBy = value; }
        }
        private string closeBy;
        [XmlElement]
        public string CloseBy
        {
            get { return closeBy; }
            set { closeBy = value; }
        }
        private DateTime createTime;
        [XmlElement]
        public DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
        private DateTime acceptTime;
        [XmlElement]
        public DateTime AcceptTime
        {
            get { return acceptTime; }
            set { acceptTime = value; }
        }
        private DateTime closeTime;
        [XmlElement]
        public DateTime CloseTime
        {
            get { return closeTime; }
            set { closeTime = value; }
        }
        private int accountId;
        [XmlElement]
        public int AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string visitorId;
        [XmlElement]
        public string VisitorId
        {
            get { return visitorId; }
            set { visitorId = value; }
        }
        private string operatorId;
        [XmlElement]
        public string OperatorId
        {
            get { return operatorId; }
            set { operatorId = value; }
        }
        private string status;
        [XmlElement]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        public Chat()
        { 
        }
        public Chat(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["ChatId"])) this.chatId = (string)data["ChatId"];
            if (!Convert.IsDBNull(data["CreateBy"])) this.createBy = (string)data["CreateBy"];
            if (!Convert.IsDBNull(data["CloseBy"])) this.closeBy = (string)data["CloseBy"];
            if (!Convert.IsDBNull(data["CreateTime"])) this.createTime = (DateTime)data["CreateTime"];
            if (!Convert.IsDBNull(data["AcceptTime"])) this.acceptTime = (DateTime)data["AcceptTime"];
            if (!Convert.IsDBNull(data["CloseTime"])) this.closeTime = (DateTime)data["CloseTime"];
            if (!Convert.IsDBNull(data["AccountId"])) this.accountId = (int)data["AccountId"];
            if (!Convert.IsDBNull(data["VisitorId"])) this.visitorId = (string)data["VisitorId"];
            if (!Convert.IsDBNull(data["OperatorId"])) this.operatorId = (string)data["OperatorId"];
            if (!Convert.IsDBNull(data["Status"])) this.status = (string)data["Status"];

        }
    }
}
