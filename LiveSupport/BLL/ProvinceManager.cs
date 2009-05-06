using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.DAL;
using LiveSupport.DAL.SqlProviders;

namespace LiveSupport.BLL
{
    public class ProvinceManager
    {
         //获得所有省份
        public static List<Province> GetAllProvince()
        {
            ProvinceProvider pp = new SqlProvinceProvider();
            return pp.GetAllProvince();
        }
    }
}
