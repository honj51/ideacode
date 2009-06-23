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

        #region 取所有的客服信息
        public List<Operator> GetAllOperators()
        {
            List<Operator> ops = new List<Operator>();
            string sql = "select * from LiveChat_Operator order by AccountId desc";
            ops = GetOperatorListBySql(sql);
            return ops;
        }
        #endregion

        #region 取所有在线客服信息
        public List<Operator> GetAllOperatorsByStatus(string Status)
        {
            List<Operator> ops = new List<Operator>();
            string sql = "select * from LiveChat_Operator where Status<>'"+Status+"' order by AccountId desc";
            ops = GetOperatorListBySql(sql);
            return ops;
        }
        #endregion

        #region 更新客服信息
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

        #region 判断用用户名是否存在
        public Operator GetOperatorByLoginName(string loginName)
        {
            string sql = "select * from [LiveSupport].[dbo].[LiveChat_Operator] where LoginName='" + loginName+"'";
            Operator op = null;
            op = GetOperatorBySql(sql);
            return op;
        }
        #endregion

        #region 跟据客服ID删除客服信息
        public int  DeleteOperatorByid(string operatorId)
        {
            string sql = "delete  dbo.LiveChat_Operator  where OperatorId='"+operatorId+"'";
            return  DBHelper.ExecuteCommand(sql);
        }
        #endregion

        #region 添加一条客服信息
        /// <summary>
        /// 添加一条客服信息
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

        #region 根据公司编号查询所以该公司所有的客服人员
        public List<Operator> GetOperatorByAccountId(string accountId)
        {
            string sql = "select * from LiveChat_Operator where AccountId='" + accountId+"'";
            List<Operator> operators = new List<Operator>();
            operators = GetOperatorListBySql(sql);
            return operators;
        }
        #endregion

        #region 跟据客服ID查询该客服信息
        public Operator GetOperatorByOperatorId(string operatorId)
        {
            string sql = "select * from  dbo.LiveChat_Operator where OperatorId='" + operatorId+"'";
            Operator op = new Operator();
            op=GetOperatorBySql(sql);
            return op;
        }
        #endregion

        #region 公司是否存在此客服
        public Operator GetOperatorByAccountIdAndLoginName(string accountId, string loginName)
        {
            string sql = string.Format("select * from [LiveSupport].[dbo].[LiveChat_Operator] where AccountId='{0}' and LoginName='{1}'", accountId, loginName);
            Operator op = new Operator();
            op = GetOperatorBySql(sql);
            return op;
        }
        #endregion

        #region 找回客服密码
        public Operator GetOperatorPassword(string accountNumber, string loginName, string eamil)
        {
            try
            {
                Account ac = SqlAccountProvider.Default.CheckCompanyByaccountNumber(accountNumber);
                if (ac != null)
                {
                    string sql = string.Format("select * from LiveChat_Operator where AccountId='{0}' and LoginName='{1}' and Email='{2}'",ac.AccountId, loginName, eamil);
                    Operator oper = new Operator();
                    oper = GetOperatorBySql(sql);
                    return oper;
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
            Operator op = new Operator();
            op = GetOperatorBySql(sql);
            return op;
        }
        #endregion

        #region  通过公司ID获取客服信息
        public List<Operator> GetOperatorByAccountNumber(string accountNumber)
        {
            Account ac = SqlAccountProvider.Default.CheckCompanyByaccountNumber(accountNumber);
            if (ac != null)
            {
                string sql = "select * from LiveChat_Operator where accountNumber='" + ac.AccountId + "'";
                List<Operator> operators = new List<Operator>();
                operators = GetOperatorListBySql(sql);
                return operators;
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region  通过sql获取客服返回List
        public List<Operator> GetOperatorListBySql(string sql)
        {
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
        #endregion

        #region  通过sql获取客服信息
        public Operator GetOperatorBySql(string sql)
        {
            Operator operators = new Operator();
            SqlDataReader r = DBHelper.GetReader(sql);
            if (r.Read())
            {
                Operator op = new Operator(r);
                SqlAccountProvider ap = new SqlAccountProvider();
                SqlDepartmentProvider dp = new SqlDepartmentProvider();
                op.Department = dp.GetDepartmentById(r["DepartmentId"].ToString());
                op.Account = ap.GetAccountByAccountId(r["accountId"].ToString());
                return op;

            }
            else
            {
                return null;
            }
        }
        #endregion
    }
}
