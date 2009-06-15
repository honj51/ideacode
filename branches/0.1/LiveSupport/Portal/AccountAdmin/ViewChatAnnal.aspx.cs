using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveSupport.LiveSupportModel;
using LiveSupport.BLL;

public partial class AccountAdmin_Default3 : System.Web.UI.Page
{
    Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            account = (Account)Session["User"];
            if (Request.QueryString["chatId"] != null)
            {
                string chatId = Request.QueryString["chatId"].ToString();
                DataBindChatMessage(chatId);//绑定聊天记录
            }
            else
            {
                Response.Redirect("ChatAnnal.aspx");
            }
        }
        else
        {
            Response.Redirect("../Login.aspx");
        }
    }
    //绑定聊天记录
    public void DataBindChatMessage(string chatId)
    {
        List<Message> list = ChatMessageManager.GetChatMessageByChatId(chatId);
        if (list != null)
        {
            foreach (Message ms in list)
            {

                this.lblMessage.Text += "<a style='font-size:12px; color:#06F;'>[" + ms.Source + "]&nbsp;<a style='color:#999;'>" + ms.SentDate.ToString() + "</a><a style= 'color:#06F;'>说:</a>&nbsp;&nbsp;" + ms.Text + "<br>";
            }
        }
    }
}
