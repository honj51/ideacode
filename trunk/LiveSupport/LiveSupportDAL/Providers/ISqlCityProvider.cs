using System;
namespace LiveSupport.LiveSupportDAL.Providers
{
    interface ICityProvider
    {
        System.Collections.Generic.List<LiveSupport.LiveSupportModel.City> GetCityByProvinceId(int provinceId);
    }
}
