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
        List<LeaveWord> GetAllLeaveWordByAccountId(string accountId);
        List<LeaveWord> GetLeaveWordNotRepliedByAccountId(string accountId, bool IsReplied);
        int DelLeaveWordById(string id);
        int UpdateWordProviderById(string sendDate, string name,bool isReplied, string id);
    }
}
