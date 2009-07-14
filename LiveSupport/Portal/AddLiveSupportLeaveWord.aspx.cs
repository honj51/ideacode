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

public partial class AddLiveSupportLeaveWord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetPic();
            Image1.ImageUrl = "Imgs/face/1.gif";
        }
    }

    private void GetPic()
    {
        ListItem li = new ListItem();
        for (int i = 0; i < 20; i++)
        {
            int Num = i + 1;
            ddllPic.Items.Add("头像" + Num.ToString());
            ddllPic.Items[i].Value = "Imgs/face/" + Num.ToString() + ".gif";
        }
    }


    protected void ddllPic_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Image1.ImageUrl = ddllPic.SelectedValue.ToString();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        LiveSupport.LiveSupportModel.Content ad = new LiveSupport.LiveSupportModel.Content();
        ad.UserName = txtName.Text.Trim();
        ad.PicUrl = ddllPic.SelectedValue.ToString();
        ad.UserMail = txtEmail.Text.Trim();
        ad.UserUrl = txtUrl.Text.Trim();
        ad.UserQQ = txtQQ.Text.Trim();

        string faceurl = "";
        if (this.Radio1.Checked) { faceurl = "Imgs/face/face1.gif"; }
        if (this.Radio2.Checked) { faceurl = "Imgs/face/face2.gif"; }
        if (this.Radio3.Checked) { faceurl = "Imgs/face/face3.gif"; }
        if (this.Radio4.Checked) { faceurl = "Imgs/face/face4.gif"; }
        if (this.Radio5.Checked) { faceurl = "Imgs/face/face5.gif"; }
        if (this.Radio6.Checked) { faceurl = "Imgs/face/face6.gif"; }
        if (this.Radio7.Checked) { faceurl = "Imgs/face/face7.gif"; }
        if (this.Radio8.Checked) { faceurl = "Imgs/face/face8.gif"; }
        if (this.Radio9.Checked) { faceurl = "Imgs/face/face9.gif"; }
        if (this.Radio10.Checked) { faceurl = "Imgs/face/face10.gif"; }
        if (this.Radio11.Checked) { faceurl = "Imgs/face/face11.gif"; }
        if (this.Radio12.Checked) { faceurl = "Imgs/face/face12.gif"; }
        if (this.Radio13.Checked) { faceurl = "Imgs/face/face13.gif"; }
        if (this.Radio14.Checked) { faceurl = "Imgs/face/face14.gif"; }
        if (this.Radio15.Checked) { faceurl = "Imgs/face/face15.gif"; }
        if (this.Radio16.Checked) { faceurl = "Imgs/face/face16.gif"; }
        if (this.Radio17.Checked) { faceurl = "Imgs/face/face17.gif"; }
        if (this.Radio18.Checked) { faceurl = "Imgs/face/face18.gif"; }
        if (this.Radio19.Checked) { faceurl = "Imgs/face/face19.gif"; }
        if (this.Radio20.Checked) { faceurl = "Imgs/face/face20.gif"; }
        ad.FaceUrl = faceurl;
        ad.UserIp = HttpContext.Current.Request.UserHostAddress;

        ad.Contents = FCKeditor1.Value;
        ad.AddTime = System.DateTime.Now;
        if (CheckBox1.Checked == true)
            ad.IsHid = 1;
        else
            ad.IsHid = 0;

        ContentManager bll = new ContentManager();
        if (bll.Add(ad))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('留言发表成功！'); window.location='LiveSupportLeaveWord.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('发表失败！');</script>");
        }
    }

}
