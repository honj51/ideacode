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

        /// <summary>
        /// 获得所有省份
        /// </summary>
        /// <returns></returns>
        public static List<Province> GetProvinceAll()
        {

            return ProvinceProvider.GetAllProvince();
        }

        /// <summary>
        /// 通过省份编号获得所有城市
        /// </summary>
        /// <param name="provinceId"></param>
        /// <returns></returns>
        public static List<City> GetCityByProvinceId(int provinceId)
        {
            return CityProvider.GetCityByProvinceId(provinceId);
        }
        /// <summary>
        ///   通过省份名查询城市信息
        /// </summary>
        /// <param name="provinceName">省份名</param>
        /// <returns>Province对象</returns>
        public static Province GetProvinceByProvinceName(string provinceName)
        {
            return ProvinceProvider.GetProvinceByProvinceName(provinceName);
        }
        /// <summary>
        /// //通过省份名字找所有城市
        /// </summary>
        /// <param name="provinceName"></param>
        /// <returns></returns>
        public static List<City> GetCityByProvinceName(string provinceName)
        {
            Province p = GetProvinceByProvinceName(provinceName);
            return  CityProvider.GetCityByProvinceId(p.Id);
        }


    }
}
