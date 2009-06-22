using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
using System.Data;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlOperatorProvider : IOperatorProvider
    {

        #region ȡ���еĿͷ���Ϣ
        public List<Operator> GetAllOperators()
        {
            List<Operator> ops = new List<Operator>();
            string sql = "select * from LiveChat_Operator";
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                Operator op = new Operator(r);
                SqlDepartmentProvider dp = new SqlDepartmentProvider();
                op.Department = dp.GetDepartmentById(r["DepartmentId"].ToString());
                ops.Add(op);

            }
            r.Close();
            r.Dispose();
            r = null;
            return ops;
        }
        #endregion


        #region ���¿ͷ���Ϣ
        public int UpdateOperator(Operator op)
        {
            //int isAdmin = 0;
            //if (op.IsAdmin == false)
            //    isAdmin = 0;
            //else
            //    isAdmin = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update LiveChat_Operator set ");
            strSql.Append("AccountId=@AccountId,");
            strSql.Append("LoginName=@LoginName,");
            strSql.Append("Password=@Password,");
            strSql.Append("NickName=@NickName,");
            strSql.Append("Email=@Email,");
            strSql.Append("IsAdmin=@IsAdmin,");
            strSql.Append("Status=@Status,");
            strSql.Append("AVChatStatus=@AVChatStatus,");
            strSql.Append("DepartmentId=@DepartmentId");
            strSql.Append(" where OperatorId=@OperatorId ");
            SqlParameter[] parameters = {
					new SqlParameter("@OperatorId", SqlDbType.VarChar,50),
					new SqlParameter("@AccountId", SqlDbType.VarChar,50),
					new SqlParameter("@LoginName", SqlDbType.VarChar,30),
					new SqlParameter("@Password", SqlDbType.VarChar,30),
					new SqlParameter("@NickName", SqlDbType.VarChar,30),
					new SqlParameter("@Email", SqlDbType.VarChar,30),
					new SqlParameter("@IsAdmin", SqlDbType.Bit,1),
					new SqlParameter("@Status", SqlDbType.VarChar,30),
					new SqlParameter("@AVChatStatus", SqlDbType.VarChar,30),
					new SqlParameter("@DepartmentId", SqlDbType.VarChar,50)};
            parameters[0].Value = op.OperatorId;
            parameters[1].Value = op.Account.AccountId;
            parameters[2].Value = op.LoginName;
            parameters[3].Value = op.Password;
            parameters[4].Value = op.NickName;
            parameters[5].Value = op.Email;
            parameters[6].Value = op.IsAdmin;
            parameters[7].Value = op.Status;
            parameters[8].Value = op.AVChatStatus;
            parameters[9].Value = op.Department.DepartmentId;

           return DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }
        #endregion

        #region �ж����û����Ƿ����
        public Operator GetOperatorByLoginName(string loginName)
        {
            string sql = "select * from [LiveSupport].[dbo].[LiveChat_Operator] where LoginName='" + loginName+"'";
            SqlDataReader data = null;
            Operator op = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    op = new Operator(data);
                    SqlDepartmentProvider dp = new SqlDepartmentProvider();
                    SqlAccountProvider ap = new SqlAccountProvider();
                    op.Department = dp.GetDepartmentById(data["DepartmentId"].ToString());
                    op.Account = ap.GetAccountByAccountId(data["accountId"].ToString());
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return op;
        }
        #endregion

        #region ���ݿͷ�IDɾ���ͷ���Ϣ
        public int  DeleteOperatorByid(string operatorId)
        {
            string sql = "delete  dbo.LiveChat_Operator  where OperatorId='"+operatorId+"'";
            return  DBHelper.ExecuteCommand(sql);
        }
        #endregion

        #region
        /// <summary>
        /// ����һ���ͷ���Ϣ
        /// </summary>
        /// <param name="op"></param>
        public int  NewOperator(Operator op)
        {
            Operator oper = new SqlOperatorProvider().GetOperatorByAccountIdAndLoginName(op.Account.AccountId, op.LoginName);
            if (oper == null)
            {
                int isAdmin = 0;
                if (op.IsAdmin == false)
                    isAdmin = 0;
                else
                    isAdmin = 1;
                string sql = string.Format(
                "INSERT INTO [LiveSupport].[dbo].[LiveChat_Operator]"
               + "([OperatorId]"
               + " ,[AccountId]"
               + " ,[LoginName]"
               + " ,[Password]"
               + " ,[NickName]"
               + " ,[Email]"
               + " ,[IsAdmin]"
               + " ,[Status]"
               + "  ,[AVChatStatus]"
               + ",[DepartmentId])"
               + "VALUES ('{0}','{1}','{2}','{3}','{4}','{5}',{6},'{7}','{8}','{9}')"
               , op.OperatorId, op.Account.AccountId, op.LoginName, op.Password, op.NickName, op.Email, isAdmin, op.Status, op.AVChatStatus, op.Department.DepartmentId);
                return DBHelper.ExecuteCommand(sql);
            }
            else
            {
                return 0;
            }

        }
        #endregion
        /// <summary>
        /// ���ݹ�˾ID��ѯ���Ըù�˾���еĿͷ���Ա
        /// </summary>
        /// <param name="accountId">��˾ID</param>
        /// <returns>Operator����</returns>
        /// 

        public List<Operator> GetOperatorByAccountId(string accountId)
        {
            string sql = "select * from LiveChat_Operator where AccountId='" + accountId+"'";
            List<Operator> operators = new List<Operator>();
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                Operator op = new Operator(r);
                SqlAccountProvider ap = new SqlAccountProvider();
                SqlDepartmentProvider dp = new SqlDepartmentProvider();
                op.Department = dp.GetDepartmentById(r["DepartmentId"].ToString());
                op.Account = ap.GetAccountByAccountId(r["accountId"].ToString());
                operators.Add(op);

            }
            r.Close();
            r.Dispose();
            r = null;
            return operators;
        }
        /// <summary>
        /// ���ݿͷ�ID��ѯ�ÿͷ���Ϣ
        /// </summary>
        /// <param name="operatorId">�ͷ�ID</param>
        /// <returns>Operator ����</returns>
        public Operator GetOperatorByOperatorId(string operatorId)
        {
            string sql = "select * from  dbo.LiveChat_Operator where OperatorId='" + operatorId+"'";
            SqlDataReader data = null;
            Operator op = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    op = new Operator(data);
                    SqlAccountProvider ap = new SqlAccountProvider();
                    SqlDepartmentProvider dp = new SqlDepartmentProvider();
                    op.Department = dp.GetDepartmentById(data["DepartmentId"].ToString());
                    op.Account = ap.GetAccountByAccountId(data["accountId"].ToString());
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return op;
        }

        #region ��˾�Ƿ���ڴ˿ͷ�
        public Operator GetOperatorByAccountIdAndLoginName(string accountId, string loginName)
        {
            string sql = string.Format("select * from [LiveSupport].[dbo].[LiveChat_Operator] where AccountId='{0}' and LoginName='{1}'", accountId, loginName);
            SqlDataReader data = null;
            Operator op = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    op = new Operator(data);
                    op.Department = new SqlDepartmentProvider().GetDepartmentById(data["DepartmentId"].ToString());
                    SqlAccountProvider ap = new SqlAccountProvider();
                    op.Account = ap.GetAccountByAccountId(data["accountId"].ToString());
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return op;
        }
        #endregion

        #region �һؿͷ�����
        public Operator GetOperatorPassword(string accountNumber, string loginName, string eamil)
        {
            try
            {
                Account ac = SqlAccountProvider.Default.CheckCompanyByaccountNumber(accountNumber);
                if (ac != null)
                {
                    string sql = string.Format("select * from LiveChat_Operator where AccountId='{0}' and LoginName='{1}' and Email='{2}'",ac.AccountId, loginName, eamil);
                    SqlDataReader sdr = DBHelper.GetReader(sql);
                    if (sdr.Read())
                    {
                        Operator oper = new Operator(sdr);
                        oper.Department = new SqlDepartmentProvider().GetDepartmentById(sdr["DepartmentId"].ToString());
                        SqlAccountProvider ap = new SqlAccountProvider();
                        oper.Account = ap.GetAccountByAccountId(sdr["accountId"].ToString());
                        sdr.Close();
                        return oper;
                    }
                    else
                    {
                        sdr.Close();
                        return null;
                    }
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        #endregion


        #region Login

        public Operator Login(string accountId, string loginName, string loginPwd)
        {
            string sql = string.Format("select * from LiveChat_Operator where AccountId='{0}' and LoginName='{1}' and Password='{2}'",accountId,loginName,loginPwd);
            SqlDataReader data = null;
            Operator op = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    op = new Operator(data);
                    SqlDepartmentProvider dp = new SqlDepartmentProvider();
                    op.Department = dp.GetDepartmentById(data["DepartmentId"].ToString());
                    SqlAccountProvider ap = new SqlAccountProvider();
                    op.Account = ap.GetAccountByAccountId(data["accountId"].ToString());
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return op;
        }

        #endregion
    }
}