using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlCityProvider : ICityProvider
    {

        #region 跟据省份ID查询城市信息
        public  List<City> GetCityByProvinceId(int provinceId)
        {
            string sql = "select * from dbo.Portal_City where Pid=" + provinceId;
            List<City> city = new List<City>();
            using (SqlDataReader r = DBHelper.GetReader(sql))
            {
                while (r.Read())
                {
                    city.Add(new City(r));
                }
                return city;
            }
        }
        #endregion
    }
}
    
