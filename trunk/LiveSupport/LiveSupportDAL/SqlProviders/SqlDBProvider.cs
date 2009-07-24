using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Data.SqlClient;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;
using System.Data;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlDBProvider : IDBProvider
    {
        /// <summary>
        /// 跟据公司Id查询有的快捷回复
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
                using (data = DBHelper.GetReader(sql))
                {
                    while (data.Read())
                    {
                        list.Add(new QuickResponse(data));
                    }
                    return list;
                }
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// 跟据域名查询快捷回复
        /// </summary>
        /// <param name="domainName"></param>
        /// <returns></returns>
        public List<QuickResponse> GetQuickResponseByDomainName(string domainName)
        {
            string sql = string.Format("select * from dbo.LiveChat_QuickResponse where  DomainName='{0}'", domainName);
            SqlDataReader data = null;
            List<QuickResponse> list = new List<QuickResponse>();
            try
            {
                using (data = DBHelper.GetReader(sql))
                {
                    while (data.Read())
                    {
                        list.Add(new QuickResponse(data));
                    }
                    return list;
                }
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        ///  更新快捷回复跟据 AccountId
        /// </summary>
        /// <param name="qr"></param>
        public void UpdateQuickResponseById(QuickResponse model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update LiveChat_QuickResponse set ");
            strSql.Append("DomainName=@DomainName,");
            strSql.Append("AccountId=@AccountId,");
            strSql.Append("OperatorId=@OperatorId,");
            strSql.Append("Submenu=@Submenu,");
            strSql.Append("node=@node");
            strSql.Append(" where QuickId=@QuickId ");
            SqlParameter[] parameters = {
					new SqlParameter("@QuickId", SqlDbType.Int,4),
					new SqlParameter("@DomainName", SqlDbType.VarChar,50),
					new SqlParameter("@AccountId", SqlDbType.VarChar,50),
					new SqlParameter("@OperatorId", SqlDbType.VarChar,50),
					new SqlParameter("@Submenu", SqlDbType.VarChar,50),
					new SqlParameter("@node", SqlDbType.Text)};
            parameters[0].Value = model.QuickId;
            parameters[1].Value = model.DomainName;
            parameters[2].Value = model.AccountId;
            parameters[3].Value = model.OperatorId;
            parameters[4].Value = model.Submenu;
            parameters[5].Value = model.Node;

            DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }

        /// <summary>
        ///  添天节点
        /// </summary>
        /// <param name="model"></param>
        public void NewQuickResponse(QuickResponse model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into LiveChat_QuickResponse(");
            strSql.Append("DomainName,AccountId,OperatorId,Submenu,node)");
            strSql.Append(" values (");
            strSql.Append("@DomainName,@AccountId,@OperatorId,@Submenu,@node)");
            SqlParameter[] parameters = {
					new SqlParameter("@DomainName", SqlDbType.VarChar,50),
					new SqlParameter("@AccountId", SqlDbType.VarChar,50),
					new SqlParameter("@OperatorId", SqlDbType.VarChar,50),
					new SqlParameter("@Submenu", SqlDbType.VarChar,50),
					new SqlParameter("@node", SqlDbType.Text)};
            parameters[0].Value = model.DomainName;
            parameters[1].Value = model.AccountId;
            parameters[2].Value = model.OperatorId;
            parameters[3].Value = model.Submenu;
            parameters[4].Value = model.Node;
            DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 跟据公司ID删除快捷回复
        /// </summary>
        /// <param name="accountId"></param>
        public void DeleteQuickResponseByAccountId(string accountId)
        {
            string sql = string.Format("delete dbo.LiveChat_QuickResponse where accountid='{0}'", accountId);
            DBHelper.ExecuteCommand(sql);
        }
        /// <summary>
        /// 跟据域名删除快捷回复
        /// </summary>
        /// <param name="domainName"></param>
        public void DeleteQuickResponseByDomainName(string domainName)
        {
            string sql = string.Format("delete dbo.LiveChat_QuickResponse where DomainName='{0}'", domainName);
            DBHelper.ExecuteCommand(sql);
        }
    }
}
