using System;
using LiveSupport.LiveSupportModel;
namespace LiveSupport.LiveSupportDAL.Providers
{
    public interface IProvinceProvider
    {
        System.Collections.Generic.List<Province> GetAllProvince();
        Province GetProvinceByProvinceName(string provinceName);
    }
}
