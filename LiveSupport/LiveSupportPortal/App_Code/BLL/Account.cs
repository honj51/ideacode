using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;

/// <summary>
///Account 的摘要说明
/// </summary>
public class Account
{
    private int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    private Guid userId;

    public Guid UserId
    {
        get { return userId; }
        set { userId = value; }
    }
    private int paymentId;

    public int PaymentId
    {
        get { return paymentId; }
        set { paymentId = value; }
    }
    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private DateTime registerData;

    public DateTime RegisterData
    {
        get { return registerData; }
        set { registerData = value; }
    }

    private List<Operator> operators;

    public List<Operator> Operators
    {
        get { return operators; }
        set { operators = value; }
    }

    // Address
    private string address;
    private string city;
    private string region;
    private string postCode;
    private string country;
    private string phone;

    public Account(int id, Guid userId, int paymentId)
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
}
