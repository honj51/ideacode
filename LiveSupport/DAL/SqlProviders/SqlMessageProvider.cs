using System;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using LiveSupport.DAL.Entity;


public class SqlMessageProvider : MessageProvider
{
    private string connectionString = string.Empty;

    public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
    {
        // check to ensure config is not null
        if (config == null)
            throw new ArgumentNullException("config");

        if (string.IsNullOrEmpty(name))
            name = "SqlMessageProvider";

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
    //跟对话,和最后一点消息取后面的消息
    public override List<Message> GetMessages(string SessionId, DateTime lastCheck)
    {
        SqlConnection sqlC = new SqlConnection(connectionString);
        string sql = "select * from LiveChat_Message where ChatID="+SessionId+" and SentDate >"+lastCheck;
        SqlCommand cmd = new SqlCommand("sql", sqlC);
        SqlDataReader data = null;
        List<Message> retList = new List<Message>();

        try
        {
            sqlC.Open();
            data = cmd.ExecuteReader();
            while (data.Read())
                retList.Add(new Message(data));

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

