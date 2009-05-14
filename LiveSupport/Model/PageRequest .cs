using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportModel
{
    public class PageRequest
    {
        private string accountId;

        public string AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private string sessionId;

        public string SessionId
        {
            get { return sessionId; }
            set { sessionId = value; }
        }
        private string page;

        public string Page
        {
            get { return page; }
            set { page = value; }
        }
        private DateTime requestTime;

        public DateTime RequestTime
        {
            get { return requestTime; }
            set { requestTime = value; }
        }
        private string referrer;

        public string Referrer
        {
            get { return referrer; }
            set { referrer = value; }
        }
        public PageRequest()
        {
            accountId = Guid.NewGuid().ToString();
        }
        public PageRequest(SqlDataReader data)
        {
            if (!Convert.IsDBNull(data["AccountId"])) accountId = (string)data["AccountId"];
            if (!Convert.IsDBNull(data["SessionId"])) sessionId = (string)data["SessionId"];
            if (!Convert.IsDBNull(data["Page"])) page = (string)data["Page"];
            if (!Convert.IsDBNull(data["RequestTime"])) requestTime = (string)data["RequestTime"];
            if (!Convert.IsDBNull(data["Referrer"])) referrer = (string)data["Referrer"];

        }
    }
}
