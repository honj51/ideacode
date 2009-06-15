using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface ICityProvider
    {
        System.Collections.Generic.List<City> GetCityByProvinceId(int provinceId);
    }
}
