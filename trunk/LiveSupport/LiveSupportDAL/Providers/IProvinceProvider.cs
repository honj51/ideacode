using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface IProvinceProvider
    {
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.Province> GetAllProvince();
        LiveSupport.LiveSupportModel.Province GetProvinceByProvinceName(string provinceName);
    }
}
