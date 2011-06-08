using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.Params["action"];
        if (string.IsNullOrEmpty(action)) return;

        if (action == "login")
        {
            Session.Remove("admin_id");

            string user = Request.Form["user"];
            string password = Request.Form["password"];
            password = Common.MakeMD5(password);            
            SqlParameter[] sps = new SqlParameter[] { new SqlParameter("@admin_id",user),new SqlParameter("@admin_pwd",password) };

            SqlDataReader dr = null;

            String gif = (string)Session["gif"];
            string yanzheng = Request.Form["yanzheng"];
            if (gif != yanzheng)
            {
                Response.Redirect("Login.aspx?error=-2"); 
            }

            try
            {
                dr = DBHelper.ExecuteReader("select * from sq8szxlx.admin_admin where admin_id=@admin_id and admin_pwd=@admin_pwd", sps);
                if (dr.HasRows)
                {
                    dr.Read();
                    Session["admin_id"] = user;                    
                    Response.Redirect("Default.aspx");                    
                }
                else
                {
                    Response.Redirect("Login.aspx?error=-1");                    
                }
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }                
            }            
        }
        else if (action == "md5")
        {
            string md5 = Common.MakeMD5("123");
            Response.Write(md5);

        }
    }



}
