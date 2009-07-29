using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.Providers
{
    public interface ILeaveWordProvider
    {
        int AddWordProvider(LeaveWord lv);
        LeaveWord GetLeaveWordById(string id);
        List<LeaveWord> GetLeaveWordByAccountId(string accountId,string beginDate,string endDate);
        List<LeaveWord> GetLeaveWordByAccountIdAndDomainName(string accountId,string domainName, string beginDate, string endDate);
        List<LeaveWord> GetAllLeaveWordByAccountId(string accountId);
        List<LeaveWord> GetAllLeaveWordByAccountIdAndDomainName(string accountId,string domainName);
        List<LeaveWord> GetLeaveWordNotRepliedByAccountId(string accountId, bool IsReplied);
        List<LeaveWord> GetLeaveWordNotRepliedByAccountIdAndDomainName(string accountId,string domainName, bool IsReplied);
        int DelLeaveWordById(string id);
        int UpdateWordProviderById(string sendDate, string name,bool isReplied, string id);
    }
}
