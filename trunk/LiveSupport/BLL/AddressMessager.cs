using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportDAL.SqlProviders;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.BLL
{
    public class AddressMessager
    {
        /// <summary>
        /// 获得所有省份
        /// </summary>
        /// <returns></returns>
        public static List<Province> GetProvinceAll()
        {
           return SqlProvinceProvider.GetAllProvince();
        }

        /// <summary>
        /// 通过省份编号获得所有城市
        /// </summary>
        /// <param name="provinceId"></param>
        /// <returns></returns>
        public static List<City> GetCityByProvinceId(int provinceId)
        {
           return SqlCityProvider.GetCityByProvinceId(provinceId);
        }
        /// <summary>
        ///   通过省份名查询城市信息
        /// </summary>
        /// <param name="provinceName">省份名</param>
        /// <returns>Province对象</returns>
        public static Province GetProvinceByProvinceName(string provinceName)
        {
            return SqlProvinceProvider.GetProvinceByProvinceName(provinceName);
        }
        /// <summary>
        /// //通过省份名字找所有城市
        /// </summary>
        /// <param name="provinceName"></param>
        /// <returns></returns>
        public List<City> GetCityByProvinceName(string provinceName)
        {
            Province p = GetProvinceByProvinceName(provinceName);
            return  SqlCityProvider.GetCityByProvinceId(p.Id);
        }


    }
}
