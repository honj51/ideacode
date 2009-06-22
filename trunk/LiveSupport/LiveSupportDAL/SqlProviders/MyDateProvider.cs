using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class MyDateProvider : IMyDateProvider
    {


        #region 获得系统统计信息

        public MyDate GetLiveSupportCount(string beginDate, string endDate)
        {
            MyDate md = new MyDate();
            string sqlAccount = string.Format("select count(*) from LiveSupport_Account where RegisterDate>='{0}' and RegisterDate<='{1}'", beginDate, endDate);
            string sqlVisitorSession = string.Format("select count(*) from LiveChat_VisitSession where  VisitingTime>='{0}' and VisitingTime<='{1}'", beginDate, endDate);
            string sqlChat = string.Format("select count(*) from LiveChat_Chat where  CreateTime>='{0}' and CreateTime<='{1}'", beginDate, endDate);
            List<Account> accounts = new List<Account>();
            md.AccountCount = DBHelper.GetCount(sqlAccount);
            md.VisitorCount = DBHelper.GetCount(sqlVisitorSession);
            md.ChatCount = DBHelper.GetCount(sqlChat);
            return md;
        }

        #endregion
    }
}
