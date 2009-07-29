using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.Providers;
using LiveSupport.LiveSupportDAL.SqlProviders;
using System.Data.SqlClient;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.SqlProviders
{
    public class SqlLeaveWordProvider : ILeaveWordProvider
    {
        #region 添加留言
        public int AddWordProvider(LiveSupport.LiveSupportModel.LeaveWord lw)
        {
            try
            {
                string sql = string.Format(
           " INSERT INTO [LiveSupport].[dbo].[LiveSupport_LeaveWord]"
          + " ([Id]" 
          + " ,[CallerName]"
          + " ,[Email]"
          + " ,[Phone]"
           + ",[Subject]"
           + ",[Content]"
           + ",[IP]"
           + ",[CallerDate]"
           + ",[Senddate]"
           + ",[OperatorName]"
           + ",[AccountId]"
           + ",[IsReplied])"
           + ",[DomainName] "
           + " VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}') ", lw.Id, lw.CallerName, lw.Email, lw.Phone, lw.Subject, lw.Content, lw.Ip, lw.CallerDate, lw.Senddate, lw.OperatorName, lw.Account.AccountId,lw.IsReplied,lw.DomainName);
                return DBHelper.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        #endregion

        #region 通过留言编号获得留言信息
        public LiveSupport.LiveSupportModel.LeaveWord GetLeaveWordById(string id)
        {
            try
            {
                string sql = "select * from LiveSupport_LeaveWord where Id='" + id + "'";
                using (SqlDataReader sdr = DBHelper.GetReader(sql))
                {
                    if (sdr.Read())
                    {
                        LeaveWord lw = new LeaveWord(sdr);
                        lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                        return lw;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region 通过公司编号获得留言信息
        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordByAccountId(string accountId, string beginDate, string endDate)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}' and CallerDate>='{1}' and CallerDate<='{2}' order by Senddate", accountId, beginDate, endDate);
                using (SqlDataReader sdr = DBHelper.GetReader(sql))
                {
                    List<LeaveWord> list = new List<LeaveWord>();
                    while (sdr.Read())
                    {
                        LeaveWord lw = new LeaveWord(sdr);
                        lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                        list.Add(lw);
                    }
                    return list;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<LiveSupport.LiveSupportModel.LeaveWord> GetAllLeaveWordByAccountId(string accountId)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}' order by isReplied", accountId);
                SqlDataReader sdr = DBHelper.GetReader(sql);
                List<LeaveWord> list = new List<LeaveWord>();
                while (sdr.Read())
                {
                    LeaveWord lw = new LeaveWord(sdr);
                    // lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                    list.Add(lw);
                }
                sdr.Close();
                return list;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region 通过公司编号及域名获得留言信息
        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordByAccountIdAndDomainName(string accountId,string domainName, string beginDate, string endDate)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}'and domainName='{1}' and CallerDate>='{2}' and CallerDate<='{3}' order by Senddate", accountId,domainName, beginDate, endDate);
                using (SqlDataReader sdr = DBHelper.GetReader(sql))
                {
                    List<LeaveWord> list = new List<LeaveWord>();
                    while (sdr.Read())
                    {
                        LeaveWord lw = new LeaveWord(sdr);
                        lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                        list.Add(lw);
                    }
                    return list;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<LiveSupport.LiveSupportModel.LeaveWord> GetAllLeaveWordByAccountIdAndDomainName(string accountId,string domainName)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}' and domainName='{1}' order by isReplied", accountId,domainName);
                SqlDataReader sdr = DBHelper.GetReader(sql);
                List<LeaveWord> list = new List<LeaveWord>();
                while (sdr.Read())
                {
                    LeaveWord lw = new LeaveWord(sdr);
                    // lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                    list.Add(lw);
                }
                sdr.Close();
                return list;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion
        #region 通过公司编号及域名获得未回复留言
        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordNotRepliedByAccountId(string accountId, bool IsReplied)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}'  and isReplied ='{2}' order by isReplied", accountId, IsReplied);
                SqlDataReader sdr = DBHelper.GetReader(sql);
                List<LeaveWord> list = new List<LeaveWord>();
                while (sdr.Read())
                {
                    LeaveWord lw = new LeaveWord(sdr);
                    // lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                    list.Add(lw);
                }
                sdr.Close();
                return list;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordNotRepliedByAccountIdAndDomainName(string accountId, string domainName, bool IsReplied)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}' and domainName='{1}' and isReplied ='{2}' order by isReplied", accountId, domainName, IsReplied);
                SqlDataReader sdr = DBHelper.GetReader(sql);
                List<LeaveWord> list = new List<LeaveWord>();
                while (sdr.Read())
                {
                    LeaveWord lw = new LeaveWord(sdr);
                    // lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                    list.Add(lw);
                }
                sdr.Close();
                return list;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region 修改留言记录
        public int  UpdateWordProviderById(string sendDate,string name,bool isReplied,string id)
        {
            string sql = string.Format("update LiveSupport_LeaveWord set Senddate='{0}',OperatorName='{1}',IsReplied='{2}' where id='{3}'", sendDate, name, isReplied, id);
            return DBHelper.ExecuteSql(sql);
        }
        #endregion

         #region 删除留言
         public int DelLeaveWordById(string id) 
        {
            string sql = string.Format("delete from LiveSupport_LeaveWord  where Id='{0}'",id);
            return DBHelper.ExecuteSql(sql);
        }
         #endregion
}
}
