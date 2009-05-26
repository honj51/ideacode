using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlProvinceProvider : ISqlProvinceProvider
    {

        public List<Province> GetAllProvince()
        {
            string sql = "select * from dbo.Portal_Province ";
            List<Province> province = new List<Province>();
            SqlDataReader r = DBHelper.GetReader(sql);
            while (r.Read())
            {
                province.Add(new Province(r));

            }
            r.Close();
            r.Dispose();
            r = null;
            return province;
        }
        /// <summary>
        ///   通过省份名查询城市信息
        /// </summary>
        /// <param name="provinceName">省份名</param>
        /// <returns>Province对象</returns>
        public Province GetProvinceByProvinceName(string provinceName)
        {
            string sql = string.Format("select * from dbo.Portal_Province where name='{0}'", provinceName);
            SqlDataReader data = null;
            Province province = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    province = new Province(data);
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return province;
        }
    }
}
