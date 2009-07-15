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
using System.Collections.Generic;


public partial class Default2 : System.Web.UI.Page
{
    static int cpageIndex = 0;

    public int CpageIndex
    {
        get { return cpageIndex; }
        set { cpageIndex = value; }
    }
    static int index = 0;

    public int Index
    {
        get { return index; }
        set { index = value; }
    }
    List<LiveSupport.LiveSupportModel.Content> list = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        list = new ContentManager().GetList();
        if (!IsPostBack)
        {
            //Response.Cookies.Add(new HttpCookie("CheckCode",""));

            GetList(list);
        }
        if (Session["nName"] != null)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        if (Request.QueryString["action"] == "loginout")
        {
            Session["nName"] = null;
            Panel1.Visible = true;
            Panel2.Visible = false ;
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

    private void GetList(List<LiveSupport.LiveSupportModel.Content> list)
    {
        PagedDataSource pds = new PagedDataSource();

        if (list != null && list.Count > 0)
        {
            this.lblChatIndex.Text = CpageIndex + 1 + "";
            pds.DataSource = list;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = CpageIndex;
            if (CpageIndex == 0)
                this.ibtnCshang.Enabled = false;
            else
                this.ibtnCshang.Enabled = true;
            if (CpageIndex == pds.PageCount - 1)
                this.ibtnCxia.Enabled = false;
            else
                this.ibtnCxia.Enabled = true;
            this.lblChatIndexCount.Text = pds.PageCount + "";
            this.Repeater1.DataSource = pds;
            this.Repeater1.DataBind();
        }
        else
        {
            this.Repeater1.DataSource = null;
            this.Repeater1.DataBind();
        }
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
                Panel2.Visible = true;
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
        GetList(list);
    }
    protected void ibtnCshang_Click(object sender, ImageClickEventArgs e)
    {
        CpageIndex--;
        GetList(list);
    }
    protected void ibtnCxia_Click(object sender, ImageClickEventArgs e)
    {
        CpageIndex++;
        GetList(list);
    }
}
