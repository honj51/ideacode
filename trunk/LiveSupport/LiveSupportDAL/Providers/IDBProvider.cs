using System;

namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IDBProvider
    {
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.QuickResponse> GetQuickResponseByAccountId(string accountId);
        void UpdateQuickResponseByAccountId(LiveSupport.LiveSupportModel.QuickResponse qr);
    }
}
