using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;
using System.Data.SqlClient;
using System.Data;
using LiveSupport.LiveSupportDAL.Providers;

namespace LiveSupport.LiveSupportDAL.SqlProviders
{
    public class SqlWebSiteProvider : IWebSiteProvider
    {
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public  void Add(WebSite model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into WebSite(");
            strSql.Append("DomainName,RegisterId,IconStyle,InviteStyle,ChatStyle,IcoLocation)");
            strSql.Append(" values (");
            strSql.Append("@DomainName,@RegisterId,@IconStyle,@InviteStyle,@ChatStyle,@IcoLocation)");
            SqlParameter[] parameters = {
					new SqlParameter("@DomainName", SqlDbType.VarChar,50),
					new SqlParameter("@RegisterId", SqlDbType.VarChar,50),
					new SqlParameter("@IconStyle", SqlDbType.VarChar,50),
					new SqlParameter("@InviteStyle", SqlDbType.VarChar,50),
					new SqlParameter("@ChatStyle", SqlDbType.VarChar,50),
					new SqlParameter("@IcoLocation", SqlDbType.VarChar,50)};
            parameters[0].Value = model.DomainName;
            parameters[1].Value = model.RegisterId;
            parameters[2].Value = model.IconStyle;
            parameters[3].Value = model.InviteStyle;
            parameters[4].Value = model.ChatStyle;
            parameters[5].Value = model.IcoLocation;
            DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public  void Update(WebSite model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update WebSite set ");
            strSql.Append("RegisterId=@RegisterId,");
            strSql.Append("IconStyle=@IconStyle,");
            strSql.Append("InviteStyle=@InviteStyle,");
            strSql.Append("ChatStyle=@ChatStyle,");
            strSql.Append("IcoLocation=@IcoLocation");
            strSql.Append(" where DomainName=@DomainName ");
            SqlParameter[] parameters = {
					new SqlParameter("@DomainName", SqlDbType.VarChar,50),
					new SqlParameter("@RegisterId", SqlDbType.VarChar,50),
					new SqlParameter("@IconStyle", SqlDbType.VarChar,50),
					new SqlParameter("@InviteStyle", SqlDbType.VarChar,50),
					new SqlParameter("@ChatStyle", SqlDbType.VarChar,50),
					new SqlParameter("@IcoLocation", SqlDbType.VarChar,50)};
            parameters[0].Value = model.DomainName;
            parameters[1].Value = model.RegisterId;
            parameters[2].Value = model.IconStyle;
            parameters[3].Value = model.InviteStyle;
            parameters[4].Value = model.ChatStyle;
            parameters[5].Value = model.IcoLocation;

            DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public  void Delete(string DomainName)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from WebSite ");
            strSql.Append(" where DomainName=@DomainName ");
            SqlParameter[] parameters = {
					new SqlParameter("@DomainName", SqlDbType.VarChar,50)};
            parameters[0].Value = DomainName;

            DBHelper.ExecuteCommand(strSql.ToString(), parameters);
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public  WebSite GetModel(string DomainName)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 DomainName,RegisterId,IconStyle,InviteStyle,ChatStyle,IcoLocation from WebSite ");
            strSql.Append(" where DomainName=@DomainName ");
            SqlParameter[] parameters = {
					new SqlParameter("@DomainName", SqlDbType.VarChar,50)};
            parameters[0].Value = DomainName;

            WebSite model = new WebSite();
            DataSet ds = DBHelper.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                model.DomainName = ds.Tables[0].Rows[0]["DomainName"].ToString();
                model.RegisterId = ds.Tables[0].Rows[0]["RegisterId"].ToString();
                model.IconStyle = ds.Tables[0].Rows[0]["IconStyle"].ToString();
                model.InviteStyle = ds.Tables[0].Rows[0]["InviteStyle"].ToString();
                model.ChatStyle = ds.Tables[0].Rows[0]["ChatStyle"].ToString();
                model.IcoLocation = ds.Tables[0].Rows[0]["IcoLocation"].ToString();
                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public  DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select DomainName,RegisterId,IconStyle,InviteStyle,ChatStyle,IcoLocation ");
            strSql.Append(" FROM WebSite ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DBHelper.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public  DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" DomainName,RegisterId,IconStyle,InviteStyle,ChatStyle,IcoLocation ");
            strSql.Append(" FROM WebSite ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DBHelper.Query(strSql.ToString());
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="accountId"></param>
        /// <returns></returns>
        public List<WebSite> GetAllWebSiteByRegisterId(string accountId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            strSql.Append(" DomainName,RegisterId,IconStyle,InviteStyle,ChatStyle,IcoLocation ");
            strSql.Append(" FROM WebSite ");
            strSql.Append(" where  RegisterId='" + accountId +"'");
            List<WebSite> modelList = new List<WebSite>();
            using (SqlDataReader r = DBHelper.GetReader(strSql.ToString()))
            {
                while (r.Read())
                {
                    WebSite model =new WebSite();
                    model.DomainName = r["DomainName"].ToString();
                    model.RegisterId = r["RegisterId"].ToString();
                    model.IconStyle = r["IconStyle"].ToString();
                    model.InviteStyle = r["InviteStyle"].ToString();
                    model.ChatStyle = r["ChatStyle"].ToString();
                    model.IcoLocation = r["IcoLocation"].ToString();
                    modelList.Add(model);
                }
                return modelList;
            }
        }
    }
}
