using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlPageRequestProvider
    {
        int AddPageRequest(LiveSupport.LiveSupportModel.PageRequest pageRequest);
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.PageRequest> GetHistoryPageRequests(string sessionId, DateTime begin, DateTime end);
    }
}
