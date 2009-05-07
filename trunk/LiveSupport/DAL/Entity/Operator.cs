using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;

namespace LiveSupport.DAL.Entity
{
    /// <summary>
    ///Operator 的摘要说明
    /// </summary>
    public class Operator
    {

        private string operatorId;
        [XmlElement]
        public string OperatorId
        {
            get { return operatorId; }
            set { operatorId = value; }
        }
        private string accountId;
        [XmlElement]
        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string name;
        [XmlElement]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string password;
        [XmlElement]
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string nickName;
        [XmlElement]
        public string NickName
        {
            get { return nickName; }
            set { nickName = value; }
        }
        private string email;
        [XmlElement]
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string status;
        [XmlElement]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        private string aVChatStatus;
        [XmlElement]
        public string AVChatStatus
        {
            get { return aVChatStatus; }
            set { aVChatStatus = value; }
        }
        public Operator()
        { 
        }
        public Operator(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["OperatorId"])) operatorId = (string)data["OperatorId"];
            if (!Convert.IsDBNull(data["AccountId"])) accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["Name"])) name = (string)data["Name"];
            if (!Convert.IsDBNull(data["Password"])) password = (string)data["Password"];
            if (!Convert.IsDBNull(data["NickName"])) nickName = (string)data["NickName"];
            if (!Convert.IsDBNull(data["Email"])) email = (string)data["Email"];
            if (!Convert.IsDBNull(data["Status"])) status = (string)data["Status"];
            if (!Convert.IsDBNull(data["AVChatStatus"])) aVChatStatus = (string)data["AVChatStatus"];
        }
    }
}