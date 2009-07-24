using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;

namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IDBProvider
    {
        List<QuickResponse> GetQuickResponseByAccountId(string accountId);
        void UpdateQuickResponseById(QuickResponse qr);
        void DeleteQuickResponseByAccountId(string accountId);
        void NewQuickResponse(QuickResponse qr);
        void DeleteQuickResponseByDomainName(string domainName);
        List<QuickResponse> GetQuickResponseByDomainName(string domainName);
    }
}
