using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlVisitorProvider : IVisitorProvider
    {
        /// <summary>
        /// 跟据访客ID查询一行数据
        /// </summary>
        /// <param name="visitorId">访客ID</param>
        /// <returns>Visitor对象</returns>
        public Visitor GetVisitorById(string visitorId)
        {
            string sql = "select * from dbo.LiveChat_Visitor where visitorid='" + visitorId+"'";
            SqlDataReader data = null;
            Visitor visitor = null;
            try
            {
                using (data = DBHelper.GetReader(sql))
                {
                    if (data.Read())
                    {
                        visitor = new Visitor(data);
                        return visitor;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        ///新增一条访客信息
        /// </summary>
        /// <param name="visitor"></param>
        public void NewVisitor(Visitor visitor)
        {
            int isVIP = 0;
            if (visitor.IsVIP == false)
                isVIP = 0;
            else
                isVIP = 1;
            string sql = string.Format("INSERT INTO LiveChat_Visitor VALUES('{0}','{1}','{2}','{3}',{4},'{5}','{6}','{7}','{8}')",
                visitor.VisitorId, visitor.AccountId, visitor.Name, visitor.Email, visitor.VisitCount, visitor.Company, visitor.Remark, isVIP, visitor.CurrentSessionId);
            DBHelper.ExecuteCommand(sql);
        }
    }
}