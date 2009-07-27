using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.BLL
{
    public class WebSiteManager
    {
        private static IWebSiteProvider Provider = new SqlWebSiteProvider();
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public static void NewWebSite(WebSite model)
        {
            Provider.Add(model);  
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public static void Update(WebSite model)
        {
            Provider.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public static void Delete(string domainName)
        {
            Provider.Delete(domainName);
        }
        public static WebSite GetWebSiteByDomainName(string domainName)
        {
           return Provider.GetModel(domainName);
        }

        public static List<WebSite> GetAllWebSiteByRegisterId(string accountId)
        {
            return Provider.GetAllWebSiteByRegisterId(accountId);
        }
        public static List<WebSite> GetAllWebSiteByRegisterId(Operator op)
        {
            if (op != null)
            {
                return Provider.GetAllWebSiteByRegisterId(op.Account.AccountId);
            }
            return null;
        }
    }
}
