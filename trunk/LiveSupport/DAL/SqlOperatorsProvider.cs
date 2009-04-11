using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using LiveSupport.DAL.Entity;

namespace LiveSupport.DAL
{
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
                    curr.Name = r.GetString(2);
                    curr.Password = r.GetString(3);
                    curr.Email = r.GetString(4);
                    curr.IsOnline = r.GetBoolean(5);
                    list.Add(curr);
                }

                return list;
            }
        }

        public override Operator CreateOperator(int accountId)
        {
            Operator op = null;

            //using (SqlConnection con = new SqlConnection(connectionString()))
            //{
            //    SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Operators_CreateOperator, con);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.Add("@AdminUserName", SqlDbType.NVarChar, 256).Value = user.UserName;

            //    con.Open();
            //    cmd.ExecuteScalar();

            //    account = FindAccountByAdminUserName(user.UserName);

            //    return account;
            //} 
            return op;
        }

        public override void InsertOperator(Operator op)
        {
            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Operators_CreateOperator, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AccountId", SqlDbType.Int).Value = op.AccountId;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar, 100).Value = op.Name;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = op.Password;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 250).Value = op.Email;

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public override Operator GetOperatorById(int operatorId)
        {
            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_Operators_GetOperatorById, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = operatorId; ;

                con.Open();
                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    Operator op = new Operator(r.GetInt32(0), r.GetInt32(1));
                    op.Name = r.GetString(2);
                    op.Password = r.GetString(3);
                    op.Email = r.GetString(4);
                    op.IsOnline = r.GetBoolean(5);
                    return op;
                }
                else
                    return null;
            }

        }

        public override void UpdateOperator(Operator op)
        {
            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                string sqlCmdString = string.Format("update LiveChat_Operators set [Name] = '{0}',[Password] = '{1}', [Email] = '{2}' where Id={3}", op.Name, op.Password, op.Email, op.Id.ToString());
                SqlCommand cmd = new SqlCommand(sqlCmdString, con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public override void DeleteOperator(int operatorId)
        {
            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                string sqlCmdString = string.Format("delete from LiveChat_Operators where Id = {0}", operatorId.ToString());
                SqlCommand cmd = new SqlCommand(sqlCmdString, con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public override Operator LoginOperator(string name, string password, int accountId)
        {
            using (SqlConnection con = new SqlConnection(connectionString()))
            {
                SqlCommand cmd = new SqlCommand(SqlDataAccessConstant.SP_LiveSupport_LiveSupport_Operators_LoginOperator, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar, 100).Value = name;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = password;
                cmd.Parameters.Add("@AccountId", SqlDbType.Int).Value = accountId;

                con.Open();
                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    Operator op = new Operator(r.GetInt32(0), r.GetInt32(1));
                    op.Name = r.GetString(2);
                    op.Password = r.GetString(3);
                    op.Email = r.GetString(4);
                    op.IsOnline = r.GetBoolean(5);
                    return op;
                }
                else
                    return null;

            }
        }



        public override void UpdateStatus(int operatorId, bool isOnline)
        {
            SqlConnection sqlC = new SqlConnection(connectionString());
            SqlCommand cmd = new SqlCommand("LiveChat_OperatorsUpdate", sqlC);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = operatorId;
                cmd.Parameters.Add("@IsOnline", SqlDbType.Bit).Value = isOnline;

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

        public override bool GetOperatorStatus(int accountId)
        {
            SqlConnection sqlC = new SqlConnection(connectionString());
            SqlCommand cmd = new SqlCommand("LiveChat_OperatorsGetStatus", sqlC);
            cmd.CommandType = CommandType.StoredProcedure;
            bool retVal = false;

            try
            {
                cmd.Parameters.Add("@AccountId", SqlDbType.Int).Value = accountId;
                sqlC.Open();
                retVal = Convert.ToBoolean(cmd.ExecuteScalar().ToString());

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
            return retVal;

        }

        public override List<ChatRequestInfo> GetChatRequest(int operatorId)
        {
            throw new NotImplementedException();
        }

        public override List<Operator> GetOnlineOperator()
        {
            SqlConnection sqlC = new SqlConnection(connectionString());
            SqlCommand cmd = new SqlCommand("LiveChat_OperatorsGetAllOnline", sqlC);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader data = null;
            List<Operator> retList = new List<Operator>();

            try
            {
                sqlC.Open();
                data = cmd.ExecuteReader();
                while (data.Read())
                {
                    Operator curr = new Operator(data.GetInt32(0), data.GetInt32(1));
                    curr.Name = data.GetString(2);
                    curr.Password = data.GetString(3);
                    curr.Email = data.GetString(4);
                    curr.IsOnline = data.GetBoolean(5);
                    retList.Add(curr);
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
            return retList;

        }
    }
}