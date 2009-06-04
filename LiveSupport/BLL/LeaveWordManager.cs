using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.Providers;
using LiveSupport.SqlProviders;

namespace LiveSupport.BLL
{
    public class LeaveWordManager
    {
        private static ILeaveWordProvider Provider = new SqlLeaveWordProvider();

        #region 添加留言
        public static bool AddWordProvider(LiveSupport.LiveSupportModel.LeaveWord lw)
        {
            int i = 0;
            i=Provider.AddWordProvider(lw);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 通过留言编号获得留言信息
        public static LiveSupport.LiveSupportModel.LeaveWord GetLeaveWordById(string id)
        {
            return Provider.GetLeaveWordById(id);
        }
        #endregion

       
        #region 通过公司编号获得留言信息
        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetGetLeaveWordByAccountId(string accountId, string beginDate, string endDate)
        {
            return Provider.GetGetLeaveWordByAccountId(accountId, beginDate, endDate);
        }
        #endregion

        #region ILeaveWordProvider 成员
        public static bool UpdateWordProviderById(string sendDate, string name, string id)
        {
            int i = 0;
            i=Provider.UpdateWordProviderById(sendDate, name, id);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion
    }
}
