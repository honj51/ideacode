using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
   Operator oper;
   protected void Page_Load(object sender, EventArgs e)
   {
       if (Session["User"] != null)
       {
           oper = (Operator)Session["User"];
           if (Request.QueryString["id"] != null)
           {
               string id = Request.QueryString["id"].ToString();
               DataBindLeaveWord(id);//绑定聊天记录
           }
           else
           {
               Response.Redirect("CallerLeaveWord.aspx");
           }
       }
       else
       {
           Response.Redirect("../Login.aspx?redirect=" + HttpContext.Current.Request.Url.PathAndQuery);
       }
   }

    public void DataBindLeaveWord(string id)
    {
        LeaveWord lw = LeaveWordManager.GetLeaveWordById(id);
        this.lblCallerName.Text = lw.CallerName;
        this.lblEmail.Text = lw.Email;
        this.lblIP.Text = lw.Ip;
        this.lblPhone.Text = lw.Phone;
        this.lblCallerName.Text = lw.CallerName;
        this.lblCallerDate.Text = lw.CallerDate;
        this.lblContent.Text = lw.Content;
        this.lblSenddate.Text = lw.Senddate;
        this.lblSubject.Text = lw.Subject;
        this.lblIsSend.Text = lw.IsSend;
        this.lblSendName.Text = lw.OperatorName;
        this.lwId.Value = lw.Id;
        this.lblDomainName.Text = lw.DomainName;

    }
    //修改
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (this.lwId.Value != null && oper.NickName!=null)
        {
            LeaveWordManager.UpdateWordProviderById(DateTime.Now.ToString(), oper.NickName,true,this.lwId.Value);
            DataBindLeaveWord(this.lwId.Value);
            string msg = "mailto:"+this.lblEmail.Text+"?subject=LiveSupport";
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>window.open('"+msg+"');</script>");
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if (this.lwId.Value != null)
        {
            LeaveWordManager.UpdateWordProviderById(null, null,false, this.lwId.Value);
            DataBindLeaveWord(this.lwId.Value);
        }
    }
}
