using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class Visitor
    {
        private string visitorId;
         
        public string VisitorId
        {
            get { return visitorId; }
            set { visitorId = value; }
        }

        private int accountId;
         
        public int AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }

        private string name;
         
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string email;
         
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private int visitCount;
         
        public int VisitCount
        {
            get { return visitCount; }
            set { visitCount = value; }
        }

        private string company;
         
        public string Company
        {
            get { return company; }
            set { company = value; }
        }

        private string remark;
         
        public string ReMark
        {
            get { return remark; }
            set { remark = value; }
        }

        private bool isVIP;
         
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
            if (!Convert.IsDBNull(data["Company"])) company = (string)data["Company"];
            if (!Convert.IsDBNull(data["Remark"])) remark = (string)data["Remark"];
            if (!Convert.IsDBNull(data["CurrentSessionId"])) currentSessionId = (string)data["CurrentSessionId"];
            if (!Convert.IsDBNull(data["IsVIP"])) isVIP = (bool)data["IsVIP"];
        }
    }

}