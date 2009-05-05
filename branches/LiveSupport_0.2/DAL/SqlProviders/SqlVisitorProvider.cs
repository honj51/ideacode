using System;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using LiveSupport.DAL.Entity;

namespace LiveSupport.DAL.SqlProviders
{
    public class SqlVisitorProvider : VisitorProvider
    {
        private string connectionString = string.Empty;

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            // check to ensure config is not null
            if (config == null)
                throw new ArgumentNullException("config");

            if (string.IsNullOrEmpty(name))
                name = "SqlChatProvider";

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
        //跟据状态查询某公司的访问信息
        public override List<Visitor>  GetVistorByStatus(Visitor visitor)
        {
            SqlConnection sqlC = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("LiveChat_GetVisitorByStatus", sqlC);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader data = null;
            List<Visitor> retList = new List<Visitor>();

            try
            {
                cmd.Parameters.Add("@AccountId", SqlDbType.Int).Value = visitor.AccountId;
                cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = visitor.Status;

                sqlC.Open();
                data = cmd.ExecuteReader();
                while (data.Read())
                    retList.Add(new Visitor(data));

                data.Close();
                data.Dispose();
                data = null;
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
            return retList;
        }
    }
}
