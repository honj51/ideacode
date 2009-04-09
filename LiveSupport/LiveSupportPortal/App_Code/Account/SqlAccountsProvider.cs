using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
///SqlAccountsProvider 的摘要说明
/// </summary>
public class SqlAccountsProvider : AccountsProvider
{
    private string connectionString()
    {
        return WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;

        //SmallBusinessDataProvidersSection sec = (ConfigurationManager.GetSection("SmallBusinessDataProviders")) as SmallBusinessDataProvidersSection;
        //string connectionStringName = sec.CatalogProviders[sec.CatalogProviderName].Parameters["connectionStringName"];
        //return WebConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
    }

	public SqlAccountsProvider()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public override List<Account> GetAllAccounts()
    {
        List<Account> list = new List<Account>();

        // connect to the database
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from LiveSupport_Customers", con);
            cmd.CommandType = CommandType.Text;

            SqlDataReader r = cmd.ExecuteReader();
            Account curr;

            while (r.Read())
            {
                //if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                //    throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);

                curr = new Account(r.GetInt32(0), r.GetGuid(1), r.GetInt32(2));

                list.Add(curr);
            }
        }
        return list;
    }

    public override Account GetAccountByAdminUserName(string name)
    {
        Account account= null;
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Operators_GetOperatorsByAccountId, con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                account = new Account(r.GetInt32(0), r.GetGuid(1), r.GetInt32(2));
            }

            return account;
        }
    }
}
