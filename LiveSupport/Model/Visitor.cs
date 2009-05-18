using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Diagnostics;

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

        private string accountId = string.Empty;

        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }

        private string name = string.Empty;

        public string Name
        {
            get
            {
                if (string.IsNullOrEmpty(name) && currentSession != null)
                {
                    return currentSession.IP;
                }
                return name;
            }
            set { name = value; }
        }

        private string email = string.Empty;

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

        private string company = string.Empty;

        public string Company
        {
            get { return company; }
            set { company = value; }
        }

        private string remark = string.Empty;

        public string Remark
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
            set 
            {
                //Debug.WriteLine(string.Format("Visitor {0} change session {1} => {2}", this.VisitorId, CurrentSessionId, value.SessionId));
                currentSession = value; 
            }
        }

        public string CurrentSessionId
        {
            get { return currentSession == null? null : currentSession.SessionId; }
        }

        public string ToString() 
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("VisitorId={0} ", VisitorId);
            sb.AppendFormat("AccountId={0} ", AccountId);
            sb.AppendFormat("Name={0} ", Name);
            sb.AppendFormat("Email={0} ", Email);
            sb.AppendFormat("VisitCount={0} ", VisitCount);
            sb.AppendFormat("Company={0} ", Company);
            sb.AppendFormat("Remark={0} ", Remark);
            sb.AppendFormat("IsVIP={0}", IsVIP);
            return sb.ToString();
        } 

        public Visitor()
        {
            this.visitorId = Guid.NewGuid().ToString();
        }

        public Visitor(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["VisitorId"])) visitorId = (string)data["VisitorId"];
            if (!Convert.IsDBNull(data["AccountId"])) accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["Name"])) name = (string)data["Name"];
            if (!Convert.IsDBNull(data["Email"])) email = (string)data["Email"];
            if (!Convert.IsDBNull(data["VisitCount"])) visitCount = (int)data["VisitCount"];
            if (!Convert.IsDBNull(data["Company"])) company = (string)data["Company"];
            if (!Convert.IsDBNull(data["Remark"])) remark = (string)data["Remark"];
            if (!Convert.IsDBNull(data["IsVIP"])) isVIP = (bool)data["IsVIP"];
        }
    }

}