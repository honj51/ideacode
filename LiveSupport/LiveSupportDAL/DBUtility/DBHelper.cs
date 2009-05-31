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


        #region  存储过程
        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection =DBHelper.Getconn())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        throw e;
                    }
                    finally
                    {
                        cmd.Dispose();
                        connection.Close();
                    }
                }
            }
        }

        /// <summary>
        /// 执行查询语句，返回SqlDataReader ( 注意：调用该方法后，一定要对SqlDataReader进行Close )
        /// </summary>
        /// <param name="strSQL">查询语句</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader ExecuteReader(string SQLString, params SqlParameter[] cmdParms)
        {
            SqlConnection connection = DBHelper.Getconn();
            SqlCommand cmd = new SqlCommand();
            try
            {
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return myReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw e;
            }

        }

        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;//cmdType;
            if (cmdParms != null)
            {


                foreach (SqlParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }
        #endregion


        public static string ConnectionString;



    }
}
