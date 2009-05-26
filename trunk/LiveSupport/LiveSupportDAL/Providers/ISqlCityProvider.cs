using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ISqlCityProvider
    {
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.City> GetCityByProvinceId(int provinceId);
    }
}
