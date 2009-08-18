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
using LiveSupport.LiveSupportModel;
using LiveSupport.LiveSupportDAL;
using System.Configuration;
using LiveSupport.BLL;
using LiveSupport.BLL.Utils;

namespace LiveSupportInstall
{
    /// <summary>
    /// setup 的摘要说明. 
    /// </summary>
    public class install : SetupPage
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
                if (i) { i = Util.SetConnectionStrings("SQLConnectionString", connectionString); }
                if (i) {i = Util.SetappSettings("UserDefinedPath", "D:\\web\\Images", "add");}
                if (i) {i = Util.SetappSettings("FileUploadPath", "D:\\web\\data", "add");}
                if (i) {i = Util.SetappSettings("HomeRootUrl", Util.GetApplicationPath(Request.UrlReferrer.ToString()), "add"); }
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

            LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ConnectionString = connectionString;
            if (i) { CreateSQLServerDB("createDB.sql", "master"); }
            if (i) { CreateSQLServerDB("livesupport.sql", "master"); }
            //if (i) { CreateSQLServerDB("createTable.sql", "master"); }
            if (i) { CreateSQLServerDB("createhypotaxis.sql", "master"); }
            // if (i) { i = NewDefaultInfo("insertDB.sql"); }
            if (i) { i = NewAccount(); }//创建用户信息livesupport.sql
            if (i)
            {
                Response.Redirect("step4.aspx",false);
                //Page.Server.Transfer(
            }
            else
            {
                msg.Visible = true;
            }
        }
        /// <summary>
        /// 创建管理员信息
        /// </summary>
        /// <returns></returns>
        public bool NewAccount()
        {
            Account account=new Account();
            account.AccountNumber="10000";
            account.CompanyName=forumtitle.Text;
            account.ContactName=systemadminname.Text;
            account.Email=adminemail.Text;
            account.Url=Util.GetApplicationPath(Request.UrlReferrer.ToString());
            account.Province = "其它";
            account.City = "其它";
            account.Industry = "计算机";
            account.Domain = Util.GetDomainName(Request.UrlReferrer.ToString());
            return  AccountsManager.AddAccount(account, systemadminname.Text, systemadminname.Text, systemadminpws.Text);
        }
        /// <summary>
        /// 创建默认信息
        /// </summary>
        /// <returns></returns>
        public bool NewDefaultInfo(string sqlName)
        {
            StringBuilder sb = new StringBuilder();
            using (StreamReader objReader = new StreamReader(Server.MapPath("sqlscript/sqlserver/" + sqlName),Encoding.Default))
            {
                sb.Append(objReader.ReadToEnd());
                objReader.Close();
            }
            if (LiveSupport.LiveSupportDAL.SqlProviders.DBHelper.ExecuteCommand(sb.ToString()) > 0)
            {
                return true;
            }
            else
                return false;
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
            using (StreamReader objReader = new StreamReader(Server.MapPath("sqlscript/sqlserver/" + sqlName), Encoding.Default))
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