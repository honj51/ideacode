using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IPageRequestProvider
    {
        int AddPageRequest(PageRequest pageRequest);
        System.Collections.Generic.List<PageRequest> GetHistoryPageRequests(string sessionId, DateTime begin, DateTime end);
        Dictionary<string, int> GetPageRequestsStatisticByAccountId(string AccountId, string beginTime, string endTime);
    }
}
