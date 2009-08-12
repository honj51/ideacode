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
using System.Collections.Generic;
using InfoSoftGlobal;

public partial class AccountAdmin_Statistic_PageRequestStatistic : System.Web.UI.Page
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
            Response.Redirect("../../Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
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

    //开始统计
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        Dictionary<string, int> dic = PageRequestManager.GetPageRequestsStatisticByAccountId(oper.Account.AccountId, this.txtBeginDate.Text.Trim(), this.txtEndDate.Text.Trim());
        if (dic != null && dic.Count > 0)
        {
            string strXML;
            strXML = "<graph caption='流量统计分析' xAxisName='访问日期' baseFontSize='12'  decimalPrecision='0' showNames='1'  pieSliceDepth='30' formatNumberScale='0'>";
            int sunCount = 0;
            foreach (string keyName in dic.Keys)
            {
                if (keyName!=null && dic[keyName] != null)
                {
                    strXML += "<set name='" + keyName + "' value='" + dic[keyName] + "' hoverText='流量数：" + dic[keyName] + "'/> ";
                }
            }
            strXML += "</graph>";
            FCLiteral.Text = FusionCharts.RenderChart("../JS/FusionCharts/Line.swf", "", strXML, "myNext", "650", "330", false, false);
        }
        else
        {
            FCLiteral.Text = "没有数据";
        }
    }
}
