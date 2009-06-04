using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Data.SqlClient;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlDBProvider : IDBProvider
    {
        /// <summary>
        ///跟据公司Id查询有的快捷回复
        /// </summary>
        /// <param name="accountId"></param>
        /// <returns></returns>
        public List<QuickResponse> GetQuickResponseByAccountId(string accountId)
        {
            string sql = string.Format("select * from dbo.LiveChat_QuickResponse where  accountid='{0}'", accountId);
            SqlDataReader data = null;
            List<QuickResponse> list = new List<QuickResponse>();
            try
            {
                data = DBHelper.GetReader(sql);
                while (data.Read())
                    list.Add(new QuickResponse(data));
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return list;
        }
        /// <summary>
        /// 更新快捷回复跟据 AccountId
        /// </summary>
        /// <param name="qr"></param>
        public void UpdateQuickResponseById(QuickResponse qr)
        {
            string sql = string.Format(
            "UPDATE [LiveSupport].[dbo].[LiveChat_QuickResponse]"
            + " SET [OperatorId] ='{0}'"
            + ",[Submenu] ='{1}'"
            + ",[Node] ='{2}'"
            + ",[AccountId]='{3}'"
            + " WHERE [QuickId]='{4}'", qr.OperatorId, qr.Submenu, qr.Node, qr.AccountId,qr.QuickId);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// 添天节点
        /// </summary>
        /// <param name="qr"></param>
        public void NewQuickResponse(QuickResponse qr)
        {
            string sql = string.Format(
            "INSERT INTO [LiveSupport].[dbo].[LiveChat_QuickResponse]"
            +"([AccountId]"
            +",[OperatorId]"
            +",[Submenu]"
            +",[node])"
            +" VALUES"
            +"( '{0}'"
            +", '{1}'"
            +", '{2}'"
            +", '{3}')",qr.AccountId,qr.OperatorId,qr.Submenu,qr.Node);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// 删除快捷回复
        /// </summary>
        /// <param name="accountId"></param>
        public void DeleteQuickResponseByAccountId(string accountId)
        {
            string sql = string.Format("delete dbo.LiveChat_QuickResponse where accountid='{0}'", accountId);
            DBHelper.ExecuteCommand(sql);
        }
    }
}
