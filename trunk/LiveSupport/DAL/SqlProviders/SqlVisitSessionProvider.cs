using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using LiveSupport.DAL.Entity;

namespace LiveSupport.DAL.SqlProviders
{
    public class SqlVisitSessionProvider : VisitSessionProvider
    {
        private string connectionString = string.Empty;

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            // check to ensure config is not null
            if (config == null)
                throw new ArgumentNullException("config");

            if (string.IsNullOrEmpty(name))
                name = "SqlVisitSessionProvider";

            // Check for the connection string
            if (config["connectionStringName"] != null && !string.IsNullOrEmpty(config["connectionStringName"].ToString()) && !string.IsNullOrEmpty(ConfigurationManager.ConnectionStrings[config["connectionStringName"].ToString()].ToString()))
            {
                connectionString = ConfigurationManager.ConnectionStrings[config["connectionStringName"].ToString()].ToString();
                config.Remove("connectionStringName");
            }
            else
                throw new ArgumentNullException("The ConnectionStringName is not defined");

            base.Initialize(name, config);
        }
        //保存一条新访客会话
        public override void NewSession(VisitSession session)
        {
            string sql = string.Format("insert into LiveChat_VisitSession values('{0}','{1}','{2}','{3}','{4}','{5}',{6},'{7}','{8}','{9}','{10}','{11}',{12},'{13}','{14}','{15}','{16}')", session.SessionId, session.VisitorId, session.IP, session.Browser, session.Status, session.Location, session.Operator, session.VisitingTime, session.LeaveTime, session.ChatRequestTime, session.ChatingTime, session.WaitingDuring, session.ChattingDuring, session.PageRequestCount, session.DomainRequested, session.PageRequested, session.Referrer);
            SqlConnection sqlC = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(sql, sqlC);
            try
            {
                sqlC.Open();
                cmd.ExecuteNonQuery;
                cmd.Dispose();
                sqlC.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                if (sqlC != null)
                {
                    if (sqlC.State == ConnectionState.Open)
                        sqlC.Close();

                    sqlC.Dispose();
                    sqlC = null;
                }
            }
        }
        //跟据访客会话取一行数据
        public override VisitSession GetSessionById(string sessionId) 
        {
            return null;
        }
    }
}

