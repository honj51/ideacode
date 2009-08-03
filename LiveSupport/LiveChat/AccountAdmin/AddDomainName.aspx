<%@ Page Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="AddDomainName.aspx.cs" Inherits="AccountAdmin_Default3" Title="客服中心-LiveSupport在线客服系统" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">
       添加域名</td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
 <table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center"> 
 
  <table style="width: 360px; text-align:left;" border="1" cellpadding="0" cellspacing="0">
<tr><td style="height: 25px">所属公司：</td><td style="height: 25px">
    <asp:TextBox ID="txtCompanyName" runat="server" ReadOnly="True"></asp:TextBox>
    </td></tr>
<tr><td style="height: 20px">域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名：</td><td style="height: 20px">
    <asp:TextBox ID="txtDomainName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtDomainName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>

<tr style="background-image:url('Images/tjkf2.jpg');"><td></td>
    <td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/AccountAdmin/Images/add.gif" onclick="ImageButton1_Click" />
    </td></tr>
</table>
 </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
</asp:Content>

