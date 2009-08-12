﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;
using InfoSoftGlobal;

public partial class AccountAdmin_Statistic_OperatorStatistic : System.Web.UI.Page
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
    //开始统计
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Hashtable operTable=ChatManager.GetOperatorChatByAccountId(oper.Account.AccountId, this.txtBeginDate.Text.Trim(), this.txtEndDate.Text.Trim());
        if (operTable!=null && operTable.Count > 0)
        {
            string strXML;
            strXML = "<graph caption='客服对话分析' xAxisName='客服名称' baseFontSize='12'  decimalPrecision='0' showNames='1'  pieSliceDepth='30' formatNumberScale='0'>";
            foreach (object x in operTable.Keys)
            {
                strXML += "<set name='" + x.ToString() + "' value='" + operTable[x] + "' hoverText='对话数：" + operTable[x] + "'  />";
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
