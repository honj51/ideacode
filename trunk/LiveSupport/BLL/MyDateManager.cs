using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.SqlProviders;

namespace LiveSupport.BLL
{
    public class MyDateManager
    {
        #region 获得系统统计信息

        public static MyDate GetLiveSupportCount(string beginDate, string endDate)
        {
            return new MyDateProvider().GetLiveSupportCount(beginDate, endDate);
        }

        #endregion
    }
}
