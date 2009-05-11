using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class Chat
    {
        public enum ChatStatus
        {
            Requested,Accepted,Decline,Closed
        }

        private string chatId;
        public string ChatId
        {
            get { return chatId; }
            set { chatId = value; }
        }
        private string createBy;

        public string CreateBy
        {
            get { return createBy; }
            set { createBy = value; }
        }
        private string closeBy;

        public string CloseBy
        {
            get { return closeBy; }
            set { closeBy = value; }
        }
        private DateTime createTime;

        public DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
        private DateTime acceptTime;

        public DateTime AcceptTime
        {
            get { return acceptTime; }
            set { acceptTime = value; }
        }
        private DateTime closeTime;
         
        public DateTime CloseTime
        {
            get { return closeTime; }
            set { closeTime = value; }
        }
        private string accountId;
         
        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string visitorId;
         
        public string VisitorId
        {
            get { return visitorId; }
            set { visitorId = value; }
        }
        private string operatorId;
         
        public string OperatorId
        {
            get { return operatorId; }
            set { operatorId = value; }
        }
        private ChatStatus status;

        public ChatStatus Status
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
            if (!Convert.IsDBNull(data["AccountId"])) this.accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["VisitorId"])) this.visitorId = (string)data["VisitorId"];
            if (!Convert.IsDBNull(data["OperatorId"])) this.operatorId = (string)data["OperatorId"];
            if (!Convert.IsDBNull(data["Status"])) this.status = (ChatStatus) Enum.Parse(typeof(ChatStatus), data["Status"].ToString());

        }
    }
}
