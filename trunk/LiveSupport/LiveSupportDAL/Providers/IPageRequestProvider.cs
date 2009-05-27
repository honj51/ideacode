using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IPageRequestProvider
    {
        int AddPageRequest(PageRequest pageRequest);
        System.Collections.Generic.List<PageRequest> GetHistoryPageRequests(string sessionId, DateTime begin, DateTime end);
    }
}
