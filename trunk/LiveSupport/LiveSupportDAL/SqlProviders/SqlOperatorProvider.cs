using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlOperatorProvider
    {
        /// <summary>
        /// ȡ���еĿͷ���Ϣ
        /// </summary>
        /// <returns></returns>
        public static List<Operator> GetAllOperators()
        {
            List<Operator> ops = new List<Operator>();
            string sql = "select * from LiveChat_Operator";
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                ops.Add(new Operator(r));

            }
            r.Close();
            r.Dispose();
            r = null;
            return ops;
        }
        /// <summary>
        /// ���¿ͷ���Ϣ
        /// </summary>
        /// <param name="op">Operator����</param>
        public static void UpdateOperator(Operator op)
        {
            string sql = string.Format(
             "UPDATE [LiveSupport].[dbo].[LiveChat_Operator]"
             + " SET [AccountId] = '{0}'"
             + ",[LoginName] = '{1}' "
             + ",[Password] = '{2}'"
             + ",[NickName] = '{3}'"
             + ",[Email] = '{4}'"
             + ",[IsAdmin] = '{4}'"
             + ",[Status] = '{5}'"
             + " ,[AVChatStatus] = {6}"
             + " WHERE OperatorId={7}"
             , op.AccountId, op.LoginName, op.Password, op.NickName, op.Email, op.IsAdmin, op.Status, op.AVChatStatus, op.OperatorId);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// �ж����û����Ƿ����
        /// </summary>
        /// <param name="loginName"></param>
        public static Operator GetOperatorByLoginName(string loginName)
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
        /// <summary>
        /// ���ݿͷ�IDɾ���ͷ���Ϣ
        /// </summary>
        /// <param name="operatorId">�ͷ�ID</param>
        /// <returns>int</returns>
        public static int  DeleteOperatorByid(string operatorId)
        {
            string sql = "delete  dbo.LiveChat_Operator  where OperatorId="+operatorId;
            return  DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// ���һ���ͷ���Ϣ
        /// </summary>
        /// <param name="op"></param>
        public static void NewOperator(Operator op)
        {
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
           + "  ,[AVChatStatus])"
           + "VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')"
           , op.OperatorId,op.AccountId,op.LoginName,op.Password,op.NickName,op.Email,op.IsAdmin,op.Status,op.AVChatStatus);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// ���ݹ�˾ID��ѯ���Ըù�˾���еĿͷ���Ա
        /// </summary>
        /// <param name="accountId">��˾ID</param>
        /// <returns>Operator����</returns>
        public static List<Operator> GetOperatorByAccountId(string accountId)
        {
            string sql = "select * from LiveChat_Operator where AccountId=" + accountId;
            List<Operator> operators = new List<Operator>();
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                operators.Add(new Operator(r));

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
        public static Operator GetOperatorByOperatorId(string operatorId)
        {
            string sql = "select * from  dbo.LiveChat_Operator where OperatorId=" + operatorId;
            SqlDataReader data = null;
            Operator op = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    op = new Operator(data);
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
    }
}
