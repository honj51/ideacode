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
        /// 取所有的客服信息
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
        /// 更新客服信息
        /// </summary>
        /// <param name="op">Operator对象</param>
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
        /// 判断用用户名是否存在
        /// </summary>
        /// <param name="loginName"></param>
        public static Operator GetOperatorByLoginName(string loginName)
        {
            string sql = "select * from [LiveSupport].[dbo].[LiveChat_Operator] where LoginName=" + loginName;
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
