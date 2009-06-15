<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetBackPassword.aspx.cs" Inherits="GetBackPassword" Title="获取客服密码" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--验证码-->
<script src="js/Random.js"> </script>
    <style type="text/css">
        .style1
        {
            height: 340px;
        }
    </style>
</head>
<body style="background-image:url('AccountAdmin/Images/bg.gif');">
    <form id="form1" runat="server">
    <div>
<table height="100" width="100%"><tr><td valign="middle" align="center">
   
<table style=" background-image:url('Images/zhaohuimima.gif'); width: 415px;   margin-top:120px;">
   <tr><td ><div style="height: 123px; width: 348px; margin-top:63px; ">
<table style=" color:#000000;">
<tr><td align="right">公司账号：</td><td align="left">
    <asp:TextBox ID="txtAccountLoginName" 
        runat="server"  Width="140px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtAccountLoginName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>
    <tr><td align="right">客服账号：</td><td align="left">
    <asp:TextBox ID="txtOperatorLoginName" 
        runat="server"  Width="140px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="txtOperatorLoginName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>
<tr><td align="right" >您的Email：</td><td align="left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="140px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="格式有误!" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td></tr>
    <tr><td align="right">验证码：</td><td  align="left"><img id="imgRandom" alt="验证码" src="RandImage.aspx"  class="verifycode_img"/>&nbsp;<a href="javascript:show_vcode()">看不清楚? 换个图片</a></td></tr>
    <tr><td align="right">输入验证码：</td><td align="left">
                    <asp:TextBox ID="txtRandom" runat="server" 
                        Width="140px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtRandom" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
                    </td></tr>
<tr><td></td><td align="left">
    <asp:ImageButton ID="btnGet" runat="server" 
        ImageUrl="~/images/zhaohui.gif" onclick="btnGet_Click" />
    </td></tr>
</table>
</div></td></tr>
</table>

</td></tr></table>
    </div>
    </form>
</body>
</html>
 
 

