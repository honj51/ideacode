using System;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IDBProvider
    {
        System.Collections.Generic.List<QuickResponse> GetQuickResponseByAccountId(string accountId);
        void UpdateQuickResponseById(QuickResponse qr);
        void DeleteQuickResponseByAccountId(string accountId);
        void NewQuickResponse(QuickResponse qr);
    }
}
