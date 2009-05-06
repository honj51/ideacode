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

    //跟据状态查询某公司的访客
    //public override List<Visitor> GetVistorsByStatus(int accountId, VisitSessionStatus status)
    //{
    //    SqlConnection sqlC = new SqlConnection(connectionString);
    //    SqlCommand cmd = new SqlCommand("LiveChat_GetVisitorByStatus", sqlC);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    SqlDataReader data = null;
    //    List<Visitor> retList = new List<Visitor>();

    //    try
    //    {
    //        cmd.Parameters.Add("@AccountId", SqlDbType.Int).Value = accountId;
    //        cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = status.ToString();

    //        sqlC.Open();
    //        data = cmd.ExecuteReader();
    //        while (data.Read())
    //            retList.Add(new Visitor(data));

    //        data.Close();
    //        data.Dispose();
    //        data = null;
    //        cmd.Dispose();
    //        sqlC.Close();
    //    }
    //    catch
    //    {
    //        throw;
    //    }
    //    finally
    //    {
    //        if (sqlC != null)
    //        {
    //            if (sqlC.State == ConnectionState.Open)
    //                sqlC.Close();

    //            sqlC.Dispose();
    //            sqlC = null;
    //        }
    //    }
    //    return retList;
    //}


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

    public override void NewVisitor(Visitor visitor)
    {
        // TODO:  没有数据库
        return;
    }

    public override List<Visitor> GetAllOnlineVisitors(int accountId)
    {
        // Test only
		List<Visitor> visitors = new List<Visitor>();
		for (int i = 0; i < 10; i++)
		{
            Visitor v = new Visitor();
            v.AccountId = accountId;
            v.Name = "Test" + i;            
			visitors.Add(v);
		}
		return visitors;
    }
}

