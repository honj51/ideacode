using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using LiveSupport.LiveSupportDAL.Providers;
using System.Data;

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

        public void UpdateVisitor(Visitor model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update LiveChat_Visitor set ");
            strSql.Append("AccountId=@AccountId,");
            strSql.Append("Name=@Name,");
            strSql.Append("Email=@Email,");
            strSql.Append("VisitCount=@VisitCount,");
            strSql.Append("Company=@Company,");
            strSql.Append("Remark=@Remark,");
            strSql.Append("IsVIP=@IsVIP,");
            strSql.Append("CurrentSessionId=@CurrentSessionId");
            strSql.Append(" where VisitorId=@VisitorId ");
            SqlParameter[] parameters = {
					new SqlParameter("@VisitorId", SqlDbType.VarChar,50),
					new SqlParameter("@AccountId", SqlDbType.VarChar,50),
					new SqlParameter("@Name", SqlDbType.VarChar,50),
					new SqlParameter("@Email", SqlDbType.VarChar,50),
					new SqlParameter("@VisitCount", SqlDbType.Int,4),
					new SqlParameter("@Company", SqlDbType.VarChar,50),
					new SqlParameter("@Remark", SqlDbType.VarChar,50),
					new SqlParameter("@IsVIP", SqlDbType.Bit,1),
					new SqlParameter("@CurrentSessionId", SqlDbType.VarChar,50)};
            parameters[0].Value = model.VisitorId;
            parameters[1].Value = model.AccountId;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.Email;
            parameters[4].Value = model.VisitCount;
            parameters[5].Value = model.Company;
            parameters[6].Value = model.Remark;
            parameters[7].Value = model.IsVIP;
            parameters[8].Value = model.CurrentSessionId;

            DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }
    }
}