using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlProvinceProvider
    {

        public static List<Province> GetAllProvince()
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
    }
}
