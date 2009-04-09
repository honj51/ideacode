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
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
///SqlOperatorsProvider 的摘要说明
/// </summary>
public class SqlOperatorsProvider : OperatorsProvider
{
    private string connectionString()
    {
        return WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;

    }

    public override List<Operator> GetAllOperators()
    {
        string sqlcmd = "Select * from LiveChat_Operators";
        return getOperators(sqlcmd);
    }

    private List<Operator> getOperators(string sqlcmd)
    {
        List<Operator> list = new List<Operator>();    

        // connect to the database
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sqlcmd, con);
            cmd.CommandType = CommandType.Text;

            SqlDataReader r = cmd.ExecuteReader();
            Operator curr;

            while (r.Read())
            {
                //if (r["id"] is DBNull || r["visible"] is DBNull || r["title"] is DBNull)
                //    throw new InvalidOperationException(Messages.ItemRequiredAttributesMissing);

                curr = new Operator(r.GetInt32(0), r.GetInt32(1));
                curr.Email = r["Email"] as string;
                curr.IsOnline = (Boolean)r["IsOnline"];
                curr.Name = r["Name"] as string;
                curr.Password = r["Password"] as string;

                list.Add(curr);
            }
        }
        return list;
    }

    public override List<Operator> FindOperatorsByAccountId(int accountId)
    {
        List<Operator> list = new List<Operator>();
        using (SqlConnection con = new SqlConnection(connectionString()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Operators_FindOperatorsByAccountId, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AccountId", SqlDbType.Int).Value = accountId;

            SqlDataReader r = cmd.ExecuteReader();
            Operator curr;

            while (r.Read())
            {
                curr = new Operator(r.GetInt32(0), r.GetInt32(1));
                list.Add(curr);
            }

            return list;
        }
    }
}
