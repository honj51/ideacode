<%@ Page Title="添加部门" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="AddDepartment.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">

    <SCRIPT type="text/javascript">
		// <![CDATA[
		var myMenu;
		window.onload = function() {
			myMenu = new SDMenu("my_menu");
			//myMenu.remember = true
			myMenu.oneSmOnly = true;  
			myMenu.init();
			var firstSubmenu = myMenu.submenus[1];
			myMenu.expandMenu(firstSubmenu);  
			
		};</SCRIPT>
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     添加公司部门</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
<table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top">
<table style="width: 360px; text-align:left;" border="1"  cellpadding="0" cellspacing="0">
<tr><td style="height: 25px">公司名称：</td><td style="height: 25px">
    <asp:TextBox ID="txtCompanyName" runat="server" ReadOnly="True"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtCompanyName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>
<tr><td style="height: 20px">部门名称：</td><td style="height: 20px">
    <asp:TextBox ID="txtDepartmentName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtDepartmentName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>

<tr style="background-image:url('Images/tjkf2.jpg');"><td></td>
    <td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/AccountAdmin/Images/add.gif" onclick="ImageButton1_Click" />
    </td></tr>
</table>
<!--尾部--></td></tr></table>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</asp:Content>

 
 

