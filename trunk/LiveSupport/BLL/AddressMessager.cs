using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.BLL
{
    public class AddressMessager
    {
        private static IProvinceProvider ProvinceProvider = new SqlProvinceProvider();
        private static ICityProvider CityProvider = new SqlCityProvider();


        #region 获得所有省份
        public static List<Province> GetProvinceAll()
        {

            return ProvinceProvider.GetAllProvince();
        }
        #endregion

        #region 通过省份编号获得所有城市(int provinceId)
        public static List<City> GetCityByProvinceId(int provinceId)
        {
            return CityProvider.GetCityByProvinceId(provinceId);
        }
        #endregion

        #region 通过省份名查询城市信息(string provinceName)
        public static Province GetProvinceByProvinceName(string provinceName)
        {
            return ProvinceProvider.GetProvinceByProvinceName(provinceName);
        }
        #endregion

        #region 通过省份名字找所有城市(string provinceName)
        public static List<City> GetCityByProvinceName(string provinceName)
        {
            Province p = GetProvinceByProvinceName(provinceName);
            return  CityProvider.GetCityByProvinceId(p.Id);
        }
        #endregion

    }
}
