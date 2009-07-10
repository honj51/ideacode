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

using LiveSupport.BLL;
using LiveSupport.LiveSupportDAL.SqlProviders;


public partial class LiveSupportLeaveWord : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Response.Cookies.Add(new HttpCookie("CheckCode",""));
            
            GetList();
        }
        if (Session["nName"] != null)
        {
            Panel1.Visible = false;
        }

        if (Request.QueryString["action"] == "loginout")
        {
            Session["nName"] = null;
            Panel1.Visible = true;

            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('已退出管理模式！'); window.location='LiveSupportLeaveWord.aspx';</script>");
        }

        if (Request.QueryString["action"] == "del")
        {
            //GustBook.Model.Admin mo = new GustBook.Model.Admin();
            //mo.Id =int.Parse( Request.QueryString["id"]);
            int nId = int.Parse(Request.QueryString["id"]);
            ContentManager bll = new ContentManager();
            if (bll.UDel(nId))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('删除成功！'); window.location='LiveSupportLeaveWord.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('出现异常！'); window.location='LiveSupportLeaveWord.aspx';</script>");
            }
        }
    }

    private void GetList()
    {
       

        ContentManager bll = new ContentManager();
        Repeater1.DataSource = bll.GetList();
        Repeater1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (String.Compare(Request.Cookies["CheckCode"].Value, TextBox3.Text.ToString().Trim(), true) != 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('验证码输入有误');</script>");
        }
        else
        {
            if (TextBox1.Text.Trim() == "zxkefu" && TextBox2.Text.Trim() == "zxkefu")
            {
                Panel1.Visible = false;
                //Session.Add("nName", mo.AdminName);
                Session["nName"] = TextBox1.Text.Trim();
                Response.Redirect("LiveSupportLeaveWord.aspx");
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请检查用户名和密码是否正确！！');</script>");
            }
        }
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        GetList();
    }
}
