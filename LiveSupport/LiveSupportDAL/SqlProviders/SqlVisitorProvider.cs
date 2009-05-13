using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlVisitorProvider
    {
        /// <summary>
        /// 跟据访客ID查询一行数据
        /// </summary>
        /// <param name="visitorId">访客ID</param>
        /// <returns>Visitor对象</returns>
        public static Visitor GetVisitorById(string visitorId)
        {
            string sql = "select * from dbo.LiveChat_Visitor where visitorid='" + visitorId+"'";
            SqlDataReader data = null;
            Visitor visitor = null;
            try
            {
                data = DBHelper.GetReader(sql);
                if (data.Read())
                {
                    visitor = new Visitor(data);
                }
                data.Close();
                data.Dispose();
                data = null;
            }
            catch
            {
                throw;
            }
            return visitor;
        }
        /// <summary>
        ///新增一条访客信息
        /// </summary>
        /// <param name="visitor"></param>
        public static void NewVisitor(Visitor visitor)
        {
            string sql = string.Format("INSERT INTO LiveChat_Visitor VALUES('{0}','{1}','{2}','{3}',{4},'{5}','{6}','{7}','{8}')", 
                visitor.VisitorId, visitor.AccountId, visitor.Name, visitor.Email, visitor.VisitCount, visitor.Company, visitor.ReMark, visitor.IsVIP, visitor.CurrentSessionId);
            DBHelper.ExecuteCommand(sql);
        }
    }
}