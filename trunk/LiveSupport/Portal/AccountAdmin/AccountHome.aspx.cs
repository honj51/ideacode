using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
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
            if (!IsPostBack)
            {
                //绑定所有省份信息
                DataBindProvince();
                GetAccount(oper);
            }
           this.TextBox1.Text= "<script src='http://lcs.zxkefu.cn/LSBanner.ashx?aid=" + oper.Account.AccountId + "'></script>";
        }
        else
        {
            Response.Redirect("../Login.aspx");
        }

    }

    //通过Account获得公司信息
    public void GetAccount(Operator oper)
    {
        if (oper != null)
        {
            this.txtId.Text = oper.Account.AccountNumber + "";
            this.txtCompanyName.Text = oper.Account.CompanyName;
            this.txtUrl.Text = oper.Account.Url;
            this.txtCompanyPhone.Text = oper.Account.Phone;
            this.txtName.Text = oper.Account.ContactName;
            this.txtMail.Text = oper.Account.Email;
            this.ddlVocation.SelectedValue = oper.Account.Industry;
            this.ddlSheng.SelectedValue = oper.Account.Province;
            DataBindCityByPName(oper.Account.Province);
            this.ddlShi.SelectedItem.Text = oper.Account.City;
        }
    }
    //绑定所有身份信息
    public void DataBindProvince()
    {
        List<Province> list = AddressMessager.GetProvinceAll();
        if (list != null)
        {
            this.ddlSheng.DataSource = list;
            this.ddlSheng.DataValueField = "name";
            this.ddlSheng.DataTextField = "name";
            this.ddlSheng.DataBind();
        }
    }
    //通过省份编号获得所有城市
    public void DataBindCityByPName(string pName)
    {
        List<City> list = AddressMessager.GetCityByProvinceName(pName);
        if (list != null)
        {
            this.ddlShi.DataSource = list;
            this.ddlShi.DataValueField = "id";
            this.ddlShi.DataTextField = "name";
            this.ddlShi.DataBind();
        }
    }
    //修改
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ////验证
        if (this.txtCompanyName.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入公司名称');</script>");
            return;
        }
        if (this.txtUrl.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入公司网址');</script>");
            return;
        }
        if (this.txtCompanyPhone.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入公司电话');</script>");
            return;
        }
        if (!Regex.IsMatch(this.txtCompanyPhone.Text.Trim(), @"^\d+(\.\d)?$"))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('电话应该是数字、不允许出现其他字符!');</script>");
            return;
        }
        if (this.txtName.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入联系人');</script>");
            return;
        }
        if (this.txtMail.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请输入邮件地址');</script>");
            return;
        }
        if (!Regex.IsMatch(this.txtMail.Text.Trim(), @"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('邮件格式不正确');</script>");
            return;
        }
        if (this.ddlVocation.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('请选择行业类别');</script>");
            return;
        }
        oper.Account.CompanyName = this.txtCompanyName.Text;
        oper.Account.Url = this.txtUrl.Text;
        oper.Account.Phone = this.txtCompanyPhone.Text;
        oper.Account.ContactName = this.txtName.Text;
        oper.Account.Email = this.txtMail.Text;
        oper.Account.Industry = this.ddlVocation.SelectedValue;
        oper.Account.Province = this.ddlSheng.SelectedValue;
        oper.Account.City = this.ddlShi.SelectedItem.Text;
        bool b = AccountsManager.UpdateAccount(oper.Account);
        if (b)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('修改成功!');;</script>");
            return;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "<script>alert('修改失败!');</script>");
            return;
        }
    }
    protected void ddlSheng_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataBindCityByPName(this.ddlSheng.SelectedItem.Text);
    }
}
