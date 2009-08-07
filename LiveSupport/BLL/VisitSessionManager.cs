using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.Providers;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;
using System.Collections;

namespace LiveSupport.BLL
{
    public class VisitSessionManager
    {
        static IVisitSessionProvider vsp = new SqlVisitSessionProvider();

        #region 通过公司编号获取所有访客对话
        public static Dictionary<string, int> GetAllVisitSessionByAccountId(string accountId, string beginDate, string endDate)
        {
            List<VisitSession> list = vsp.GetAllVisitSessionByAccountId(accountId,beginDate,endDate);
            Dictionary<string, int> d = new Dictionary<string, int>();
            d.Add("google", 0);
            d.Add("baidu", 0);
            d.Add("sogou", 0);
            d.Add("soso", 0);
            d.Add("bing", 0);
            d.Add("yahoo", 0);
            d.Add("sina", 0);
            d.Add("sohu", 0);
            d.Add("163", 0);
            int other = 0;
            if (list != null && list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    if (list[i].Referrer != "")
                    {
                        int ii = 0;
                        foreach (string keyName in d.Keys)
                        {
                            int count = 0;
                            if (list[i].Referrer.Contains(keyName))
                            {
                                ii++;
                                count++;
                                d[keyName] = d[keyName] + count;
                                break;
                            }
                        }
                        if (ii == 0)
                        {
                            other++;
                        }
                    }
                    else
                    {
                        other++;
                    }
                }
                d.Add("other", other);
                return d;
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region 通过公司编号获得对话地区以及访问次数 成员
        public static Dictionary<string, int> GetLocationCountByAccountId(string accountId, string beginDate, string endDate)
        {
            Dictionary<string, int> dic = vsp.GetLocationCountByAccountId(accountId, beginDate, endDate);
            return dic;
        }
        #endregion

        #region 通过公司编号统计引用页
        public static Dictionary<string, int> GetReferrerByAccountId(string accountId, string beginDate, string endDate)
        {
            Dictionary<string, int> dic = vsp.GetReferrerByAccountId(accountId, beginDate, endDate);
            return dic;
        }
        #endregion
    }
}
