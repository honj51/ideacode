using System;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using LiveSupport.DAL.Entity;


public class SqlVisitorProvider : VisitorProvider
{
    private string connectionString = string.Empty;

    public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
    {
        // check to ensure config is not null
        if (config == null)
            throw new ArgumentNullException("config");

        if (string.IsNullOrEmpty(name))
            name = "SqlVisitorProvider";

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

    public override Visitor GetVisitorById(string visitorId)
    {
        SqlConnection sqlC = new SqlConnection(connectionString);
        string sql = "select * from Visitor where VisitorId=" + visitorId;
        SqlCommand cmd = new SqlCommand(sql, sqlC);
        SqlDataReader data = null;
        Visitor visitor = null;

        try
        {            
            sqlC.Open();
            data = cmd.ExecuteReader();
            if (data.Read())
            {
                visitor = new Visitor(data);
            }
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

        return visitor;
    }
    //保存新的一条Visitor记录
    public  override void NewVisitor(Visitor visitor)
    {
        SqlConnection sqlC = new SqlConnection(connectionString);
        string sql = string.Format("insert into LiveChat_Visitor values('{0}',{1},'{2}','{3}','{4}','{5}','{6}','{7}',{8});",visitor.VisitorId,visitor.AccountId,visitor.Name,visitor.Email,visitor.VisitCount,visitor.Company,visitor.ReMark,visitor.CurrentSessionId,visitor.IsVIP);
        SqlCommand cmd = new SqlCommand(sql, sqlC);
        try
        {
            sqlC.Open();
            cmd.ExecuteNonQuery();
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
    //查询的有在线访客记录跟据所属公司ID
    public override List<Visitor> GetAllOnlineVisitors(int accountId)
    {
       SqlConnection sqlC = new SqlConnection(connectionString);
       string sql = "select * from LiveChat_Visitor where AccountId="+accountId;
        SqlCommand cmd = new SqlCommand("sql", sqlC);
        SqlDataReader data = null;
        List<Visitor> retList = new List<Visitor>();

        try
        {
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
    //public void GetNewVisitors(DateTime lastCheck);
}


