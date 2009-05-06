#region Header Comment
/*
 * Project			: LiveChat Starter Kit
 * Created By		: Dominic St-Pierre
 * Created Date	: 2007/04/02
 * Comment		: Entity representing a chat request
 * 
 * History:
 * 
 */
#endregion
using System;
using System.Xml;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;

namespace LiveSupport.DAL.Entity
{
    public class Visitor
    {
        private string visitorId;
        [XmlElement]
        public string VisitorId
        {
            get { return visitorId; }
            set { visitorId = value; }
        }

        private int accountId;
        [XmlElement]
        public int AccountId
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

        private string email;
        [XmlElement]
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private int visitCount;
        [XmlElement]
        public int VisitCount
        {
            get { return visitCount; }
            set { visitCount = value; }
        }

        private string remark;
        [XmlElement]
        public string ReMark
        {
            get { return remark; }
            set { remark = value; }
        }

        private bool isVIP;
        [XmlElement]
        public bool IsVIP
        {
            get { return isVIP; }
            set { isVIP = value; }
        }

        private VisitSession currentSession;

        public VisitSession CurrentSession
        {
            get { return currentSession; }
            set { currentSession = value; }
        }

        private string currentSessionId;
        [XmlElement]
        public string CurrentSessionId
        {
            get { return currentSessionId; }
            set { currentSessionId = value; }
        }


        public Visitor()
        {
            this.visitorId = Guid.NewGuid().ToString();
        }

        public Visitor(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["VisitorId"])) visitorId = (string)data["VisitorId"];
            if (!Convert.IsDBNull(data["AccountId"])) accountId = (int)data["AccountId"];
            if (!Convert.IsDBNull(data["Name"])) name = (string)data["Name"];
            if (!Convert.IsDBNull(data["Email"])) email = (string)data["Email"];
            if (!Convert.IsDBNull(data["VisitCount"])) visitCount = (int)data["VisitCount"];
            if (!Convert.IsDBNull(data["Remark"])) remark = (string)data["Remark"];
            if (!Convert.IsDBNull(data["IsVIP"])) isVIP = (bool)data["IsVIP"];
            if (!Convert.IsDBNull(data["CurrentSessionId"])) currentSessionId = (string)data["CurrentSessionId"];
        }
    }

}