using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public static class DBHelper
    {

        //private static SqlConnection connection;
        //public static SqlConnection Connection
        //{
        //    get 
        //    {
        //        string connectionString = ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
        //        return connection;
        //    }
        //}


        //public static int ExecuteCommand(string safeSql)
        //{
        //    SqlCommand cmd = new SqlCommand(safeSql, Connection);
        //    int result = cmd.ExecuteNonQuery();
        //    return result;
        //}

        //public static int ExecuteCommand(string sql, params SqlParameter[] values)
        //{
        //    SqlCommand cmd = new SqlCommand(sql, Connection);
        //    cmd.Parameters.AddRange(values);
        //    return cmd.ExecuteNonQuery();
        //}

        //public static int GetScalar(string safeSql)
        //{
        //    SqlCommand cmd = new SqlCommand(safeSql, Connection);
        //    int result = Convert.ToInt32(cmd.ExecuteScalar());
        //    return result;
        //}

        //public static int GetScalar(string sql, params SqlParameter[] values)
        //{
        //    SqlCommand cmd = new SqlCommand(sql, Connection);
        //    cmd.Parameters.AddRange(values);
        //    int result = Convert.ToInt32(cmd.ExecuteScalar());
        //    return result;
        //}

        //public static SqlDataReader GetReader(string safeSql)
        //{
        //    SqlCommand cmd = new SqlCommand(safeSql, Connection);
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    return reader;
        //}

        //public static SqlDataReader GetReader(string sql, params SqlParameter[] values)
        //{
        //    SqlCommand cmd = new SqlCommand(sql, Connection);
        //    cmd.Parameters.AddRange(values);
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    return reader;
        //}

        //public static DataTable GetDataSet(string safeSql)
        //{
        //    DataSet ds = new DataSet();
        //    SqlCommand cmd = new SqlCommand(safeSql, Connection);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    da.Fill(ds);
        //    return ds.Tables[0];
        //}

        //public static DataTable GetDataSet(string sql, params SqlParameter[] values)
        //{
        //    DataSet ds = new DataSet();
        //    SqlCommand cmd = new SqlCommand(sql, Connection);
        //    cmd.Parameters.AddRange(values);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    da.Fill(ds);
        //    return ds.Tables[0];
        //}
        ///获得连接对象
        #region
        public static SqlConnection Getconn()
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            return conn;
        }
        #endregion

        ///执行增，删，改方法
        #region
        public static int ExecuteCommand(String sql)
        {
            SqlConnection conn = DBHelper.Getconn();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            return i;
        }
        public static int ExecuteCommand(string sql, params SqlParameter[] values)
        {
            SqlConnection conn = DBHelper.Getconn();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddRange(values);
            return cmd.ExecuteNonQuery();
        }
        #endregion

        ///执行查询方法
        #region
        public static SqlDataReader GetReader(String sql)
        {

            SqlConnection conn = DBHelper.Getconn();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        #endregion

        ///查询返回Int型 方法
        #region
        public static int GetCount(String sql)
        {
            SqlConnection con = DBHelper.Getconn();
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            int i = Convert.ToInt32(com.ExecuteScalar());
            con.Close();
            return i;
        }
        #endregion

        public static string ConnectionString;

    }
}
