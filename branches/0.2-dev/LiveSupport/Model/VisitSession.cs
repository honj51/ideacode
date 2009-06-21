using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public enum VisitSessionStatus
    {
        Visiting, ChatRequesting, Chatting, Leave
    }

    [Serializable]
    public class VisitSession
    {
        private string sessionId;

        public string SessionId
        {
            get { return sessionId; }
            set { sessionId = value; }
        }
        private string visitorId;
        public string VisitorId
        {
            get { return visitorId; }
            set { visitorId = value; }
        }

        private string iP;
        public string IP
        {
            get { return iP; }
            set { iP = value; }
        }

        private string browser;

        public string Browser
        {
            get { return browser; }
            set { browser = value; }
        }

        private VisitSessionStatus status;

        public VisitSessionStatus Status
        {
            get { return status; }
            set { status = value; }
        }

        private string location;

        public string Location
        {
            get { return location; }
            set { location = value; }
        }

        private string operatorId;

        public string OperatorId
        {
            get { return operatorId; }
            set { operatorId = value; }
        }

        private DateTime visitingTime;

        public DateTime VisitingTime
        {
            get { return visitingTime; }
            set { visitingTime = value; }
        }

        private DateTime leaveTime;

        public DateTime LeaveTime
        {
            get { return leaveTime; }
            set { leaveTime = value; }
        }

        private DateTime chatRequestTime;

        public DateTime ChatRequestTime
        {
            get { return chatRequestTime; }
            set { chatRequestTime = value; }
        }

        private DateTime chatingTime;

        public DateTime ChatingTime
        {
            get { return chatingTime; }
            set { chatingTime = value; }
        }

        private DateTime waitingDuring;

        public DateTime WaitingDuring
        {
            get { return waitingDuring; }
            set { waitingDuring = value; }
        }

        private DateTime chattingDuring;

        public DateTime ChattingDuring
        {
            get { return chattingDuring; }
            set { chattingDuring = value; }
        }

        private int pageRequestCount;

        public int PageRequestCount
        {
            get { return pageRequestCount; }
            set { pageRequestCount = value; }
        }

        private string domainRequested;

        public string DomainRequested
        {
            get { return domainRequested; }
            set { domainRequested = value; }
        }

        private string pageRequested;

        public string PageRequested
        {
            get { return pageRequested; }
            set { pageRequested = value; }
        }

        private string referrer;

        public string Referrer
        {
            get { return referrer; }
            set { referrer = value; }
        }

        public VisitSession()
        {
            sessionId = Guid.NewGuid().ToString();
            this.ChatingTime = DateTime.MinValue;
            this.ChatRequestTime = DateTime.MinValue;
            this.ChattingDuring = DateTime.MinValue;
            this.LeaveTime = DateTime.MinValue;
            this.VisitingTime = DateTime.MinValue;
            this.browser = string.Empty;
            this.DomainRequested = string.Empty;
            this.IP = string.Empty;
            this.Location = string.Empty;
            this.OperatorId = string.Empty;
            this.Referrer = string.Empty;
            this.Status = VisitSessionStatus.Leave;
            this.VisitorId = string.Empty;
        }

        public string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SessionId={0} ", SessionId);
            sb.AppendFormat("VisitorId={0} ", VisitorId);
            sb.AppendFormat("IP={0} ", IP);
            sb.AppendFormat("Browser={0} ", Browser);
            sb.AppendFormat("Status={0} ", Status);
            sb.AppendFormat("Location={0} ", Location);
            sb.AppendFormat("OperatorId={0} ", OperatorId);
            sb.AppendFormat("VisitingTime={0} ", VisitingTime);
            sb.AppendFormat("LeaveTime={0} ", LeaveTime);
            sb.AppendFormat("RequestTime={0} ", ChatRequestTime);
            sb.AppendFormat("ChatingTime={0} ", ChatingTime);
            sb.AppendFormat("WaitingDuring={0} ", WaitingDuring);
            sb.AppendFormat("ChattingDuring={0} ", ChattingDuring);
            sb.AppendFormat("PageRequestCount={0} ", PageRequestCount);
            sb.AppendFormat("DomainRequested={0} ", DomainRequested);
            //sb.AppendFormat("PageRequested={0} ", PageRequested);
            sb.AppendFormat("Referrer={0}", Referrer);
            return sb.ToString();
        }

        public VisitSession(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["SessionId"])) this.sessionId = (string)data["SessionId"];
            if (!Convert.IsDBNull(data["VisitorId"])) visitorId = (string)data["VisitorId"];
            if (!Convert.IsDBNull(data["IP"])) iP = (string)data["IP"];
            if (!Convert.IsDBNull(data["Browser"])) browser = (string)data["Browser"];
            if (!Convert.IsDBNull(data["Status"])) status = (VisitSessionStatus)Enum.Parse(typeof(VisitSessionStatus), (string)data["Status"]);
            if (!Convert.IsDBNull(data["Location"])) location = (string)data["Location"];
            if (!Convert.IsDBNull(data["OperatorId"])) operatorId = (string)data["OperatorId"];
            if (!Convert.IsDBNull(data["VisitingTime"])) visitingTime = (DateTime)data["VisitingTime"];
            if (!Convert.IsDBNull(data["LeaveTime"])) leaveTime = (DateTime)data["LeaveTime"];
            if (!Convert.IsDBNull(data["ChatRequestTime"])) chatRequestTime = (DateTime)data["ChatRequestTime"];
            if (!Convert.IsDBNull(data["ChatingTime"])) chatingTime = (DateTime)data["ChatingTime"];
            if (!Convert.IsDBNull(data["WaitingDuring"])) waitingDuring = (DateTime)data["WaitingDuring"];
            if (!Convert.IsDBNull(data["ChattingDuring"])) chattingDuring = (DateTime)data["ChattingDuring"];
            if (!Convert.IsDBNull(data["PageRequestCount"])) PageRequestCount = (int)data["PageRequestCount"];
            if (!Convert.IsDBNull(data["DomainRequested"])) this.domainRequested = (string)data["DomainRequested"];
            //if (!Convert.IsDBNull(data["PageRequested"])) this.pageRequested = (string)data["PageRequested"];
            if (!Convert.IsDBNull(data["Referrer"])) this.referrer = (string)data["Referrer"];
        }

    }
}