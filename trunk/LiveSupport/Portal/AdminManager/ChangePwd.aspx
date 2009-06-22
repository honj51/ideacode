<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="AdminManager_UpdateAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="../Theme/Default/css/Manager.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Script/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">

<div class="MainBox">

<div class="Content">
<table width="100%"  border="0" cellpadding="5" cellspacing="1" class="MainTable">
<colgroup span="2">
<col class="tdbg1" />
<col class="tdbg2" />
</colgroup>
<tbody>
<tr>
<td>登 陆 名：</td>
<td><asp:TextBox ID="txtAdminLoginName" runat="server" CssClass="longInput" ReadOnly="True"></asp:TextBox>
</td>
</tr>

<tr>
<td>原 密 码：</td>
<td><asp:TextBox ID="txtOldPwd" runat="server" CssClass="longInput" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd"
Display="Dynamic">不能为空</asp:RequiredFieldValidator></td>
</tr>
<tr>
<td>新 密 码：</td>
<td><asp:TextBox ID="txtAdminPwd" runat="server" CssClass="longInput" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtAdminPwd"
Display="Dynamic">不能为空</asp:RequiredFieldValidator></td>
</tr>
<tr>
<td>密码确认：</td>
<td><asp:TextBox ID="txtAdminPwdRe" runat="server" CssClass="longInput" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtAdminPwdRe"
Display="Dynamic">不能为空</asp:RequiredFieldValidator>
<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtAdminPwdRe"
ControlToValidate="txtAdminPwd" Display="Dynamic" ErrorMessage="cv">两次密码输入不一致</asp:CompareValidator></td>
</tr>
<tr>
<td>
</td><td>
        <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="保存" 
            Width="58px" />
</td>
</tr>
</tbody>
</table>

</div>
</div>
</form>
</body>
</html>