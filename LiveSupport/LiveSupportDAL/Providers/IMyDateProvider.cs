using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IMyDateProvider
    {
        MyDate GetLiveSupportCount(string beginDate, string endDate);
    }
}
