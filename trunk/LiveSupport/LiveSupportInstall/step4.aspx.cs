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
    public class step4 : SetupPage
    {
        protected TextBox EmalServerPath;
        protected TextBox SystemMail;
        protected TextBox SystemEmalPwd;
        private void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("step5");
        }
    }
}