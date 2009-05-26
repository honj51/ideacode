using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlProvinceProvider
    {
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Province> GetAllProvince();
        LiveSupport.LiveSupportModel.Province GetProvinceByProvinceName(string provinceName);
    }
}
