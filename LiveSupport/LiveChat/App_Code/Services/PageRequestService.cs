using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;
using System.Collections.Generic;
/// <summary>
///PageRequestService 的摘要说明
/// </summary>
public class PageRequestService
{
    public PageRequestService()
    {

    }
    /// <summary>
    /// 获取网站页面访问历史记录
    /// </summary>
    /// <param name="visitorId">访客ID</param>
    /// <param name="begin">开始时间</param>
    /// <param name="end"> 结束时间</param>
    /// <returns>Pagerequest集合</returns>
    public static List<PageRequest> GetHistoryPageRequests(string visitorId, DateTime begin, DateTime end)
    {
        return SqlPageRequestProvider.GetHistoryPageRequests(visitorId, begin, end);
    }
    /// <summary>
    /// 添加一条页面访问记录
    /// </summary>
    /// <param name="pageRequest"></param>
    public static void AddPageRequest(PageRequest pageRequest)
    {
        SqlPageRequestProvider.AddPageRequest(pageRequest);
    }
}
