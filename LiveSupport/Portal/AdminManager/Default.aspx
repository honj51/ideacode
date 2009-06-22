<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="AdminManager_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)" />
<link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Script/Common.js"></script>

<title>用户登陆 @ leehom内容管理系统 -- Power By WWW.19870123.CN</title>
<style type="text/css">
body {background: #006599;margin: 0px;font-family: 宋体;text-align: center;}
td {font-size: 12px;}
.name {font-size: 12px;text-align: center;}
.txt {border: #000000 1px double;font-weight: bold;font-size: 13px;height: 22px;}
</style>
</head>

<body>

<form runat="server" id="form">
<table cellspacing="0" cellpadding="0" width="100%" border="0" style="text-align:center;">
<tr>
<td style="height:600px;background: url('../Theme/Default/Manager/indexbg.gif');">

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<table cellspacing="0" cellpadding="0" width="427" border="0" style="margin:0 auto; color:Black;">
<tr>
<td style="background: url(../Theme/Default/Manager/index_hz01.gif ); height: 64px;" colspan="3">
    江西互动科技有限公司</td>
</tr>
<tr>
<td style="font-size: 1px; line-height: 1px; background: url(../Theme/Default/Manager/index_hz02.gif); width: 3px;">
</td>
<td style="border-top: #666666 1px double; background: url(../Theme/Default/Manager/index_hz03.gif ); height: 162px" valign="top">
<br />
<br />
<table cellspacing="0" cellpadding="0" width="320" border="0" style="margin:0 auto">
<tr>
<td style="height: 30px;" colspan="2">
<div class="name">
用户名：　　<asp:TextBox ID="txtUser" runat="server" CssClass="txt" ValidationGroup="Login" Width="148"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvN" runat="server" ControlToValidate="txtUser" Display="Dynamic" ValidationGroup="Login">*
</asp:RequiredFieldValidator>
</div>
</td>
</tr>
<tr>
<td style="height: 30px;" colspan="2">
<div class="name">
密　码：　　<asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="txt" ValidationGroup="Login" Width="148"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" Display="Dynamic" ValidationGroup="Login">*
</asp:RequiredFieldValidator>
</div>
</td>
</tr>
<tr>
<td style="height: 30px;" colspan="2">
<div class="name">
计算题：　　<img src="../App_Page/ValidateCode.aspx" alt="看不清？点击刷新" onclick="this.src='../App_Page/ValidateCode.aspx?temp='+Math.random()" style="cursor: pointer; margin: 5px 0px 0px;" height="25" width="60" />
<asp:TextBox ID="txtValidate" runat="server" MaxLength="2" CssClass="txt" Width="82px" ValidationGroup="Login"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtValidate" Display="Dynamic" ValidationGroup="Login">*
</asp:RequiredFieldValidator>
</div>
</td>
</tr>
<tr>
<td style="height: 40px;" colspan="2"><asp:ImageButton CssClass="fixIBtn" 
        id="ImageButton1" runat="server" 
        imageurl="../Theme/Default/Manager/index_hz04.gif" ValidationGroup="Login" 
        onclick="ImageButton1_Click1" /></td>
</tr>
</table>
</td>
<td style="font-size: 1px; line-height: 1px; background: url(../Theme/Default/Manager/index_hz02.gif); width: 3px;">
</td>
</tr>
<tr>
<td style="background: url(../Theme/Default/Manager/index_hz05.gif ); height: 127px; text-align: center;" colspan="3">
<asp:Literal id="ltlTip" runat="server" />
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>
