using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Data.SqlClient;
using LiveSupport.DAL.Entity;
using System.Web.Security;

namespace LiveSupport.DAL
{
    /// <summary>
    ///SqlAccountsProvider 的摘要说明
    /// </summary>
    public class SqlAccountsProvider : AccountsProvider
    {
        private string connectionString()
        {
            return WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
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

                    curr = new Account(r.GetInt32(0), r.GetGuid(1));

                    list.Add(curr);
                }
            }
            return list;
        }

        public override Account FindAccountByAdminUserName(string name)
        {
            Account account = null;
            MembershipUser user = Membership.GetUser(name);
            if (user == null)
            {
                return null;
            }

            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Accounts_FindAccountByAdminUserId, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AdminUserId", SqlDbType.UniqueIdentifier).Value = user.ProviderUserKey;

                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    account = new Account(r.GetInt32(0), r.GetGuid(1));
                }

                return account;
            }
        }

        public override Account CreateAccount(string adminUserName)
        {
            Account account = null;
            MembershipUser user = Membership.GetUser(adminUserName);
            if (user == null)
            {
                return null;
            }

            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Accounts_CreateAccount, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AdminUserName", SqlDbType.NVarChar, 256).Value = user.UserName;

                con.Open();
                cmd.ExecuteScalar();

                account = FindAccountByAdminUserName(user.UserName);

                return account;
            }
        }
    }
}