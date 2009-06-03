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
using System.Text.RegularExpressions;
using System.Collections.Generic;
using LiveSupport.BLL;
using LiveSupport.LiveSupportModel;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //绑定所有省份信息
            DataBindProvince();
            if(this.ddlSheng.SelectedValue!="")
                DataBindCityByPid(Convert.ToInt32(this.ddlSheng.SelectedValue.ToString()));
        }
    }
    //绑定所有身份信息
    public void DataBindProvince()
    {
        List<Province> list = AddressMessager.GetProvinceAll();
        if (list != null)
        {
            this.ddlSheng.DataSource = list;
            this.ddlSheng.DataValueField = "id";
            this.ddlSheng.DataTextField = "name";
            this.ddlSheng.DataBind();
        }
    }
    //通过省份编号获得所有城市
    public void DataBindCityByPid(int pid)
    {
        List<City> list = AddressMessager.GetCityByProvinceId(pid);
        if (list != null)
        {
            this.ddlShi.DataSource = list;
            this.ddlShi.DataValueField = "id";
            this.ddlShi.DataTextField = "name";
            this.ddlShi.DataBind();
        }
    }
    //注册
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["createRandom"] != null)
        {
            if (this.txtValidate.Text == Session["createRandom"].ToString())
            {
                try
                {
                    //添加
                    Account at = new Account();
                    at.AccountId = Guid.NewGuid().ToString();
                    at.CompanyName = this.txtCompanyName.Text;
                    at.Url = this.txtCompanyWebUrl.Text;
                    at.Phone = this.txtCompanyPhone.Text;
                    at.ContactName = this.txtName.Text;
                    at.Email = this.txtMail.Text;
                    at.Province = this.ddlSheng.SelectedItem.Text;
                    at.City = this.ddlShi.SelectedItem.Text;
                    at.Industry = this.ddlVocation.SelectedValue;
                    at.OperatorCount = 1;
                    at.RegisterDate = DateTime.Now;
                    at.LoginName = this.txtLoginId.Text;
                    at.Password = this.txtPwd.Text;
                    at.NickName = this.txtNickname.Text;
                    bool b = AccountsManager.AddAccount(at);
                    if (b)
                    {
                        
                        ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('注册成功'); window.location='Login.aspx';</script>");
                        return;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('客服ID已经存在,请从新注册...');</script>");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('注册失败,请从新注册...');</script>");
                    return;
                }
            }
            else
            {
                this.lblMessage.Text = "验证码错误!";
                return;
            }
        }

    }
    ////省份发生改变的时候
    protected void ddlSheng_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataBindCityByPid(Convert.ToInt32(this.ddlSheng.SelectedValue.ToString()));
    }


}
