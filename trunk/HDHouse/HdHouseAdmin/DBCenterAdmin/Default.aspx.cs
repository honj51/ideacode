using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SMO s = new SMO();
            if (s.IsDBExsit())
            {
                Label1.ForeColor = Color.Green;
                Label1.Text = "数据库已存在";
            }
            else
            {
                Label1.ForeColor = Color.Brown;
                Label1.Text = "数据库不存在";
            }

        }
        catch (Exception ex)
        {
            Label1.ForeColor = Color.Brown;
            Label1.Text = "操作异常: " + ex.Message;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SMO s = new SMO();
            s.CreatDB();
            Label2.ForeColor = Color.Green;
            Label2.Text = "操作成功";
        }
        catch (Exception ex)
        {
            Label2.ForeColor = Color.Brown;
            Label2.Text = "操作异常: " + ex.Message;
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            SMO s = new SMO();
            s.DeleteDB();
            Label3.ForeColor = Color.Green;
            Label3.Text = "操作成功";
        }
        catch (Exception ex)
        {
            Label3.ForeColor = Color.Brown;
            Label3.Text = "操作异常: " + ex.Message;
        }
    }
}
