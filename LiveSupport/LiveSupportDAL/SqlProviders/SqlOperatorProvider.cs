using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.SqlProviders;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlOperatorProvider
    {

        #region ȡ���еĿͷ���Ϣ
        public static List<Operator> GetAllOperators()
        {
            List<Operator> ops = new List<Operator>();
            string sql = "select * from LiveChat_Operator";
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                Operator op = new Operator(r);
                op.Department = SqlDepartmentProvider.GetDepartmentById(r["DepartmentId"].ToString());
                ops.Add(op);

            }
            r.Close();
            r.Dispose();
            r = null;
            return ops;
        }
        #endregion

        #region ���¿ͷ���Ϣ
        public static int UpdateOperator(Operator op)
        {
            int isAdmin = 0;
            if (op.IsAdmin == false)
                isAdmin = 0;
            else
                isAdmin = 1;

            string sql = string.Format(
             "UPDATE [LiveSupport].[dbo].[LiveChat_Operator]"
             + " SET [AccountId] = '{0}'"
             + ",[LoginName] = '{1}' "
             + ",[Password] = '{2}'"
             + ",[NickName] = '{3}'"
             + ",[Email] = '{4}'"
             + ",[IsAdmin] = '{5}'"
             + ",[Status] = '{6}'"
             + " ,[AVChatStatus] = '{7}'"
             + " ,[DepartmentId] = '{8}'"
             + " WHERE OperatorId='{9}'"
             , op.AccountId, op.LoginName, op.Password, op.NickName, op.Email, isAdmin, op.Status, op.AVChatStatus, op.Department.DepartmentId, op.OperatorId);
            return DBHelper.ExecuteCommand(sql);
        }
        #endregion

        #region �ж����û����Ƿ����
        public static Operator GetOperatorByAccountIdAndLoginName(string accountId,string loginName)
        {
            //string sql = "select * from [LiveSupport].[dbo].[LiveChat_Operator] where LoginName='" + loginName+"'";
            string sql = string.Format("select * from [LiveSupport].[dbo].[LiveChat_Operator] where AccountId='{0}' and LoginName='{1}'", accountId, loginName);
            SqlDataReader data = null;
            Operator op = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    op = new Operator(data);
                    op.Department = SqlDepartmentProvider.GetDepartmentById(data["DepartmentId"].ToString());
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
        public static int  DeleteOperatorByid(string operatorId)
        {
            string sql = "delete  dbo.LiveChat_Operator  where OperatorId='"+operatorId+"'";
            return  DBHelper.ExecuteCommand(sql);
        }
        #endregion

        #region ���һ���ͷ���Ϣ
        public static int NewOperator(Operator op)
        {
            Operator oper = GetOperatorByAccountIdAndLoginName(op.AccountId, op.LoginName);
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
               , op.OperatorId, op.AccountId, op.LoginName, op.Password, op.NickName, op.Email, isAdmin, op.Status, op.AVChatStatus, op.Department.DepartmentId);
                return DBHelper.ExecuteCommand(sql);
            }
            else
            {
                return 0;
            }
        }
        #endregion

        #region ���ݹ�˾ID��ѯ���Ըù�˾���еĿͷ���Ա
        public static List<Operator> GetOperatorByAccountId(string accountId)
        {
            string sql = "select * from LiveChat_Operator where AccountId='" + accountId+"'";
            List<Operator> operators = new List<Operator>();
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                Operator op = new Operator(r);
                op.Department = SqlDepartmentProvider.GetDepartmentById(r["DepartmentId"].ToString());
                operators.Add(op);

            }
            r.Close();
            r.Dispose();
            r = null;
            return operators;
        }
        #endregion

        #region ���ݿͷ�ID��ѯ�ÿͷ���Ϣ
        public static Operator GetOperatorByOperatorId(string operatorId)
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
                    op.Department = SqlDepartmentProvider.GetDepartmentById(data["DepartmentId"].ToString());
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
