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
        ///������Ӷ���
        #region
        public static SqlConnection Getconn()
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            return conn;
        }
        #endregion

        ///ִ������ɾ���ķ���
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

        ///ִ�в�ѯ����
        #region
        public static SqlDataReader GetReader(String sql)
        {

            SqlConnection conn = DBHelper.Getconn();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        #endregion

        ///��ѯ����Int�� ����
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


        #region  �洢����
        /// <summary>
        /// ִ��SQL��䣬����Ӱ��ļ�¼��
        /// </summary>
        /// <param name="SQLString">SQL���</param>
        /// <returns>Ӱ��ļ�¼��</returns>
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
        /// ִ�в�ѯ��䣬����SqlDataReader ( ע�⣺���ø÷�����һ��Ҫ��SqlDataReader����Close )
        /// </summary>
        /// <param name="strSQL">��ѯ���</param>
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
