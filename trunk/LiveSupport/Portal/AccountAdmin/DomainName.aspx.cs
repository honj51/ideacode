using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    public Operator oper;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            oper =(Operator) Session["User"];
        }
        else
        {
            Response.Redirect("../Index.aspx");
        }
    }
    /// <summary>
    /// 跟据公司ID查询公司名
    /// </summary>
    /// <param name="aid"></param>
    /// <returns></returns>
    public string getAccountName(string aid)
    {
        return AccountService.GetAccountById(aid).CompanyName.ToString();
    }
    public string cutString(string str,int len)
    {
        if (str.Length > len)
        {
            return str.Substring(0, len).ToString();
        }
        else
            return str;
    }
    //显示图片
    public string showImage(int imgType ,string domainName,string imgStyle)
    {
        string [] imaStyles = imgStyle.Split('|');
        if (imgType == 1 && imaStyles.Length == 3)
        {
            if (imaStyles[0] == WebSiteManager.WebSite_UserDefined)
                return GetHomeRootUrl() + "/" + domainName + "/" + imaStyles[1];
            else
                return ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/Default/" + imaStyles[1];
        }
        if (imgType == 2 && imaStyles.Length == 4)
        {
            if (imaStyles[0] == WebSiteManager.WebSite_UserDefined)
                return GetHomeRootUrl() + "/" + domainName + "/" + imaStyles[1];
            else
                return ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/Default/" + imaStyles[1];
        }
        if (imgType == 3 && imaStyles.Length ==4)
        {
            if (imaStyles[0] == WebSiteManager.WebSite_UserDefined)
                return GetHomeRootUrl() + "/" + domainName + "/" + imaStyles[1];
            else
                return ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/Default/" + imaStyles[1];
        }
        else
        {
            return null;
        }
    }
    public string getIcoLocation(string icoLoaction)
    {
        if (icoLoaction == "0") { return "固定图标"; }
        if (icoLoaction == "1") { return "左上角"; }
        if (icoLoaction == "2") { return "右上角"; }
        if (icoLoaction == "3") { return "左中间"; }
        if (icoLoaction == "4") { return "右中间"; }
        if (icoLoaction == "5") { return "左下角"; }
        if (icoLoaction == "6") { return "右下角"; }
        return null;
    }
    //数据绑定义
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[7].Attributes.Add("onclick", "return confirm('你是否真要删除')");
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#E9F4F8'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    public string GetHomeRootUrl()
    {
        if (Session["User"] != null)
        {
            oper = (Operator)Session["User"];
            return ConfigurationManager.AppSettings["HomeRootUrl"] + "/Images/" + oper.Account.AccountNumber;
        }
        else
        {
            return null;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddDomainName.aspx");
    }
}
