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
           + ",[accountId])"
           + " VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}') ", lw.Id, lw.CallerName, lw.Email, lw.Phone, lw.Subject, lw.Content, lw.Ip, lw.CallerDate, lw.Senddate, lw.OperatorName, lw.Account.AccountId);
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
                SqlDataReader sdr = DBHelper.GetReader(sql);
                if (sdr.Read())
                {
                    LeaveWord lw = new LeaveWord(sdr);
                    lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
                    sdr.Close();
                    return lw;
                }
                else
                {
                    sdr.Close();
                    return null;
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
                SqlDataReader sdr = DBHelper.GetReader(sql);
                List<LeaveWord> list = new List<LeaveWord>();
                while (sdr.Read())
                {
                    LeaveWord lw = new LeaveWord(sdr);
                    lw.Account = new SqlAccountProvider().GetAccountByAccountId(sdr["accountId"].ToString());
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

        public List<LiveSupport.LiveSupportModel.LeaveWord> GetAllLeaveWordByAccountId(string accountId)
        {
            try
            {
                string sql = string.Format("select * from LiveSupport_LeaveWord where accountId='{0}'", accountId);
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
        public int  UpdateWordProviderById(string sendDate,string name,string id)
        {
            string sql = string.Format("update LiveSupport_LeaveWord set Senddate='{0}',OperatorName='{1}' where id='{2}'",sendDate,name,id);
            return DBHelper.ExecuteSql(sql);
        }
        #endregion
}
}
