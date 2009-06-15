using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.Providers;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Data.SqlClient;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.SqlProviders
{
    public class SqlClientGrounpProvider : IClientGrounpProvider
    {
        #region 添加客服分组
        public int AddClientGrounp(ClientGrounp cg)
        {
            string sql = string.Format("insert into LiveSupport_ClientGrounp([Id],[Name],accountId,addDate) values('{0}','{1}','{2}','{3}',)", cg.Id, cg.Name, cg.Account.AccountId,cg.AddDate);
            return DBHelper.ExecuteSql(sql);
        }
        #endregion

        #region 验证公司是否存在此客服分组
        public ClientGrounp CheckClientGrounpByAccountIdAndGrountpName(string accountId, string GrountpName)
        {
            string sql = string.Format("select * from LiveSupport_ClientGrounp where accountId='{0}' and [Name]='{1}' order by addDate", accountId, GrountpName);
            SqlDataReader sdr = DBHelper.GetReader(sql);
            if (sdr.Read())
            {
                ClientGrounp cg = new ClientGrounp(sdr);
                cg.Account = new SqlAccountProvider().GetAccountByAccountId(accountId);
                sdr.Close();
                return cg;
            }
            else
            {
                sdr.Close();
                return null;
            }
        }
        #endregion

        #region 通过分组编号获得分组
        public ClientGrounp GetClientGrounpById(string grounpId)
        {
            string sql = string.Format("select * from LiveSupport_ClientGrounp where Id='{0}' order by addDate", grounpId);
            SqlDataReader sdr = DBHelper.GetReader(sql);
            if (sdr.Read())
            {
                ClientGrounp cg = new ClientGrounp(sdr);
                cg.Account = new SqlAccountProvider().GetAccountByAccountId(grounpId);
                sdr.Close();
                return cg;
            }
            else
            {
                sdr.Close();
                return null;
            }
        }
        #endregion

        #region 通过公司编号获得分组
        public List<ClientGrounp> GetClientGrounpByAccountId(string accountId)
        {
            string sql = string.Format("select * from LiveSupport_ClientGrounp where accountId='{0}' order by addDate", accountId);
            List<ClientGrounp> list = new List<ClientGrounp>();
            SqlDataReader sdr = DBHelper.GetReader(sql);
            while (sdr.Read())
            {
                ClientGrounp cg = new ClientGrounp(sdr);
                cg.Account = new SqlAccountProvider().GetAccountByAccountId(accountId);
                list.Add(cg);
            }
            sdr.Close();
            return list;
        }
        #endregion



        #region 修改客服分组
        public int UpdateClientGrounp(ClientGrounp cg)
        {
            string sql = string.Format("update from LiveSupport_ClientGrounp Name='{0}',accountId='{1}' where Id='{2}'",cg.Name,cg.Account.AccountId,cg.Id);
            return DBHelper.ExecuteSql(sql);
        }
        #endregion

    }
}
