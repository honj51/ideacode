<%@ Page Title="客服中心-LiveSupport在线客服系统" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="OperatorCreate.aspx.cs" Inherits="AccountAdmin_Default2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

  <table cellpadding="0" cellspacing="0">
    <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
    <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">添加客服</td></tr>
    <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
  </table>
 
 <table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center">
&nbsp;<table style="width: 360px; text-align:left; height: 238px;" border="1"  cellpadding="0" cellspacing="0">
         <tr><td>所在部门：</td><td>
    </asp:TextBox>
                                          <asp:DropDownList ID="ddlDepartment" runat="server">
                                          </asp:DropDownList>
    </td></tr>
<tr><td>坐席用户名：</td><td>
    <asp:TextBox ID="txtLoginName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtLoginName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>
<tr><td>密码：</td><td>
    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtPwd" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>
    <tr><td>重置密码：</td><td>
    <asp:TextBox ID="txtPwds" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtPwds" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txtPwd" ControlToValidate="txtPwds" ErrorMessage="密码不一致!"></asp:CompareValidator>
    </td></tr>
    <tr><td>昵称：</td><td>
    <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txtNickName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    </td></tr>
<tr><td>Email地址：</td><td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="txtEmail" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtEmail" ErrorMessage="Email有误!" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td></tr>
      
<tr style="background-image:url('Images/tjkf2.jpg');"><td></td>
    <td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/AccountAdmin/Images/add.gif" onclick="ImageButton1_Click" />
    </td></tr>
</table>
 <!--尾部-->
           </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
 
</asp:Content>

 
 

