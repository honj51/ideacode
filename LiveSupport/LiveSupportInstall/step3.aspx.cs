using System;
using System.IO;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text.RegularExpressions;
using LiveSupportInstall;
using System.Data.SqlClient;
using System.Text;
using System.Web;

namespace LiveSupportInstall
{
    /// <summary>
    /// setup 的摘要说明. 
    /// </summary>
    public class install : SetupPage,IHttpHandler
    {
         
        protected TextBox tableprefix;
        protected TextBox forumpath;
        protected TextBox initialcatalog;
        protected TextBox datasource;
        protected TextBox userid;
        protected TextBox password;

        protected TextBox forumtitle;
        protected TextBox forumurl;
        protected TextBox webtitle;
        protected TextBox weburl;

        protected System.Web.UI.WebControls.Button ClearDBInfo;
        //protected System.Web.UI.WebControls.Button upgrade;
        protected Literal msg;

        protected TextBox systemadminname;
        protected TextBox systemadminpws;
        protected TextBox txtDbFileName;
        protected TextBox adminemail;
        protected DropDownList ddlDbType;
        protected System.Web.UI.HtmlControls.HtmlInputCheckBox sponsercheck;

        private string selectDbType = string.Empty;
        private void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }
        //生成
        protected void ClearDBInfo_Click(object sender, EventArgs e)
        {
            bool i = true;
            //验证数据库名为空
            if (initialcatalog.Text.Length == 0 && ddlDbType.SelectedValue != "Access")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('数据库名不能为空');</script>");
                return;
            }

            //验证必须选择数据库类型
            if (ddlDbType.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请选择数据库类型');</script>");
                return;
            }
            string connectionString = string.Empty;
            //判断数据库类型，填充数据库字符串
            selectDbType = ddlDbType.SelectedValue;
            //access文件路径
            switch (selectDbType)
            {
                case "SqlServer":
                    connectionString =
                        string.Format(@"Data Source={0};User ID={1};Password={2};Initial Catalog={3};Pooling=true",
                                      datasource.Text, userid.Text, password.Text, initialcatalog.Text);
                    break;

                case "MySql":
                    connectionString =
                        string.Format(@"Data Source={0};Port=3306;User ID={1};Password={2};Initial Catalog={3};Pooling=true;Allow Zero Datetime=true", datasource.Text, userid.Text, password.Text, initialcatalog.Text);
                    break;

                case "Access":
                    connectionString =
                        string.Format(@"Provider=Microsoft.Jet.OleDb.4.0;Data Source={0};Persist Security Info=True;", "aa");
                    break;
            }
           #region 写general.config文件
            try
            {
                if (i) {i = LiveSupport.BLL.Util.SetConnectionStrings("SQLConnectionString", connectionString);}
                if (i) {i = LiveSupport.BLL.Util.SetappSettings("UserDefinedPath", "D:\\web\\Images", "add");}
                if (i) {i = LiveSupport.BLL.Util.SetappSettings("FileUploadPath", "D:\\web\\data", "add");}
                if (i) {i = LiveSupport.BLL.Util.SetappSettings("HomeRootUrl", LiveSupport.BLL.Util.GetApplicationPath(Request.UrlReferrer.ToString()), "add"); }
            }
            catch (Exception ex)
            {
                i = false;
            }
            #endregion

            Session["SystemAdminName"] = systemadminname.Text;
            Session["SystemAdminPws"] = systemadminpws.Text;
            Session["dbname"] = initialcatalog.Text;
            Session["Dbconnectstring"] = connectionString;
            Session["SystemAdminEmail"] = adminemail.Text.TrimEnd();
            
            if (i) { CreateSQLServerDB("createDB.sql", "master"); }
            if (i) { CreateSQLServerDB("createTable.sql", "master"); }
            if (i) { CreateSQLServerDB("createhypotaxis.sql", "master"); }
            if (i) { i=CreateSQLServerDB("insertDB.sql", "master");}
            if (i)
            {
                Response.Redirect("succeed.aspx");
            }
            else
            {
                msg.Visible = true;
            }
        }
        /// <summary>
        /// 执行TSQL语句
        /// </summary>
        /// <param name="sqlName"></param>
        /// <param name="database"></param>
        /// <returns></returns>
        public bool CreateSQLServerDB(string sqlName,string database)
        {
            string constring =string.Format(@"Data Source={0};User ID={1};Password={2};Initial Catalog={3};Pooling=true",
                                     datasource.Text, userid.Text, password.Text,database);
            bool i=false;
            SqlConnection myConn = new SqlConnection(constring);
            StringBuilder sb = new StringBuilder();
            using (StreamReader objReader = new StreamReader(Server.MapPath("sqlscript/sqlserver/" + sqlName), Encoding.UTF8))
            {
                sb.Append(objReader.ReadToEnd());
                objReader.Close();
            }

            SqlCommand myCommand = new SqlCommand(sb.ToString(), myConn);
            try
            {
                myConn.Open();
                if (myCommand.ExecuteNonQuery()>0)
                {
                    i = true;
                }
            }
            catch (System.Exception ex)
            {
                i = false;
            }
            finally
            {
                if (myConn.State == ConnectionState.Open)
                {
                    myConn.Close();
                }
            }
            return i;
        }
    }
}