using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportDAL.SqlProviders;

namespace LiveSupport.BLL
{
    public class PageRequestManager
    {
        private static IPageRequestProvider Provider = new SqlPageRequestProvider();

        #region 通过公司编号 统计访客流量
        public static  Dictionary<string, int> GetPageRequestsStatisticByAccountId(string AccountId, string beginTime, string endTime)
        {
            return Provider.GetPageRequestsStatisticByAccountId(AccountId, beginTime, endTime);
        }
        #endregion
    }
}
