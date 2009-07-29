using System;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;

namespace LiveSupport.LiveSupportDAL.Providers
{
   public  interface IWebSiteProvider
    {
        int Add(LiveSupport.LiveSupportModel.WebSite model);
        void Delete(string DomainName);
        System.Data.DataSet GetList(string strWhere);
        System.Data.DataSet GetList(int Top, string strWhere, string filedOrder);
        LiveSupport.LiveSupportModel.WebSite GetModel(string DomainName);
        void Update(WebSite model);
        List<WebSite> GetAllWebSiteByRegisterId(string accountId);
    }
}
