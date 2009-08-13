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
using LiveSupport.LiveSupportModel;
using InfoSoftGlobal;

public partial class AccountAdmin_Statistic_ChatHourStatistic : System.Web.UI.Page
{

    Operator oper;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {
            oper = (Operator)Session["User"];
            if (!IsPostBack)
            {
                this.txtBeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                this.txtEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
            
        }
        else
        {
            Response.Redirect("../Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
        }

    }
    //开始分析
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int [] hour=ChatManager.GetAllChatByAccountId(oper.Account.AccountId, this.txtBeginDate.Text.Trim(), this.txtEndDate.Text.Trim());
        if (hour!=null && hour.Length>0)
        {
            string strXML;
            strXML = "<graph caption='对话时段分析' xAxisName='小时' baseFontSize='12'  decimalPrecision='0' showNames='1'  pieSliceDepth='30' formatNumberScale='0'>";
            for (int i = 0; i < hour.Length; i++)
            {
                strXML += "<set name='" + i + "' value='" + hour[i] + "' hoverText='对话数：" + hour[i] + "'  />";
            }
            strXML += "</graph>";

            FCLiteral.Text = FusionCharts.RenderChart("../JS/FusionCharts/Column2D.swf", "", strXML, "myNext", "600", "300", false, false);
        }
        else
        {
            FCLiteral.Text = "没有数据";
        }
    }

    //改变时间
    public void radWeek_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton rad = sender as RadioButton;
        if (rad.ID == "radDay")
        {
            this.txtBeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        if (rad.ID == "radWeek")
        {
            this.txtBeginDate.Text = DateTime.Now.AddDays(-(int)DateTime.Now.DayOfWeek).ToString("yyyy-MM-dd"); ;

        }
        if (rad.ID == "radMonth")
        {
            DateTime now = DateTime.Now;
            DateTime nowMonth = new DateTime(now.Year, now.Month, 1);
            this.txtBeginDate.Text = nowMonth.ToString("yyyy-MM-dd");
        }
        if (rad.ID == "radThreeMonth")
        {
            DateTime now = DateTime.Now.AddMonths(-2);
            DateTime nowMonth = new DateTime(now.Year, now.Month, 1);
            this.txtBeginDate.Text = nowMonth.ToString("yyyy-MM-dd");
        }
    }
}
