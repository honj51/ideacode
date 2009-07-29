﻿using System;
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
        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordByAccountId(string accountId, string beginDate, string endDate)
        {
            return Provider.GetLeaveWordByAccountId(accountId, beginDate, endDate);
        }

        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetAllLeaveWordByAccountId(string accountId)
        {
            return Provider.GetAllLeaveWordByAccountId(accountId);
        }
        #endregion
        
        #region 通过公司编号及域名获得留言信息
        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordByAccountIdAndDomainName(string accountId,string domainName, string beginDate, string endDate)
        {
            return Provider.GetLeaveWordByAccountIdAndDomainName(accountId, domainName, beginDate, endDate);
        }

        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetAllLeaveWordByAccountIdAndDomainName(string accountId,string domainName)
        {
            return Provider.GetAllLeaveWordByAccountIdAndDomainName(accountId,domainName);
        }
        #endregion

        #region 获取未回复留言
        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordNotRepliedByAccountId(string accountId, bool isReplied)
        {
            return Provider.GetLeaveWordNotRepliedByAccountId(accountId, isReplied);
        }
        #endregion

        #region 通过公司编号及域名获取未回复留言
        public static List<LiveSupport.LiveSupportModel.LeaveWord> GetLeaveWordNotRepliedByAccountIdAndDomainName(string accountId,string domainName, bool isReplied)
        {
            return Provider.GetLeaveWordNotRepliedByAccountIdAndDomainName(accountId, domainName, isReplied);
        }
        #endregion

        #region 修改留言 成员
        public static bool UpdateWordProviderById(string sendDate, string name, bool isReplied, string id)
        {
            int i = 0;
            i=Provider.UpdateWordProviderById(sendDate, name,isReplied, id);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 删除留言
        public static bool DelLeaveWordById(string id)
        {
            int i = 0;
            i=Provider.DelLeaveWordById(id);
            if (i != 0)
                return true;
            else
                return false;
        }
        #endregion
    }
}
