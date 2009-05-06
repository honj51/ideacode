using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.DAL;
using LiveSupport.DAL.SqlProviders;

namespace LiveSupport.BLL
{
    public class CityManager
    {
        
        //通过省份编号获得所有城市
        public static List<City> GetCityByPid(int pid)
        {
            CityProvider cp = new SqlCityProvider();
            return cp.GetCityByPid(pid);
        }
    }
}
