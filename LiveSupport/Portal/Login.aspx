<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login2" Title="管理员登录-LiveSupport在线客服系统" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登录</title>
    <style type="text/css">
        .style2
        {
            height: 22px;
        }

        .style7
        {
            width: 141px;
        }
    </style>
</head>
<body style="background-image:url('Images/bg.gif');">
    <form id="form1" runat="server">
   <table height="100" width="100%"><tr><td valign="middle" align="center">
   
<table style=" background-image:url('Images/login.png'); width: 440px; height: 265px;  margin-top:120px;">
<tr><td>
<table style="width:100%; height:100%;">
<tr><td style="width:41%;"></td>
<td align="left">

<table style=" font-size:13px;">
<tr><td >公司账号：</td><td align="left">
                    <asp:TextBox ID="txtNumber" runat="server" Font-Size="12px" Width="106px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                        ValidationGroup="Login1">*</asp:RequiredFieldValidator>
    </td></tr>
<tr><td >客服账号：</td><td align="left">
                    <asp:TextBox ID="UserName" runat="server" Font-Size="12px" Width="106px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                        ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                        ValidationGroup="Login1">*</asp:RequiredFieldValidator>
    </td></tr>
<tr><td >客服密码：</td><td align="left">
                    <asp:TextBox ID="Password" runat="server" Font-Size="12px" TextMode="Password" 
                        Width="106px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                        ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                        ValidationGroup="Login1">*</asp:RequiredFieldValidator>
    </td></tr>
    <tr><td colspan="2" align="center" class="style2">
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                </td></tr>
<tr></td><td colspan="2" align="center" style=" height:30px;">
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/Images/login_l.gif" onclick="ImageButton1_Click" 
        ValidationGroup="Login1" />
<a href="Licence.aspx"><img src="Images/login_r.gif" /></a>
    </td></tr>
</table>
</td></tr>
</table>

</td></tr>
</table>

</td></tr></table>
    </form>
</body>
</html>
 
 

