using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
   Account account;
   protected void Page_Load(object sender, EventArgs e)
   {
       if (Session["User"] != null)
       {
           account = (Account)Session["User"];
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
           Response.Redirect("../Login.aspx");
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

    }
    //修改
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (this.lwId.Value != null && account.NickName!=null)
        {
            LeaveWordManager.UpdateWordProviderById(DateTime.Now.ToString(), account.NickName, this.lwId.Value);
            DataBindLeaveWord(this.lwId.Value);
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>window.open('mailto:"+this.lblEmail.Text+"?body"+this.lblContent.Text+"');</script>");
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if (this.lwId.Value != null)
        {
            LeaveWordManager.UpdateWordProviderById(null, null, this.lwId.Value);
            DataBindLeaveWord(this.lwId.Value);
        }
    }
}
