<%@ Page Title="客服中心-LiveSupport在线客服系统" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="OperatorEdit.aspx.cs" Inherits="AccountAdmin_Default3" %>

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
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     客服信息管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
<table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top">
    <!--头部--->
    <div style="text-align:left; margin-left:60px; margin-top:50px;">
            <TABLE id=ctl00_ContentPlaceHolder1_DetailsView1 
      style="WIDTH: 368px; BORDER-COLLAPSE: collapse; HEIGHT: 50px" 
      cellSpacing=0 rules=all border=1>
        <TBODY>
        <TR>
          <TD style="width: 109px">公司名称：</TD>
          <TD>
              <asp:TextBox ID="txtCompanyName" runat="server" ReadOnly="True"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD style="width: 109px">所属部门：</TD>
          <TD>
              <asp:DropDownList ID="ddlDepartment" runat="server">
              </asp:DropDownList>
            </TD></TR>
        <TR>
          <TD style="width: 109px">客服账号：</TD>
          <TD>
              <asp:TextBox ID="txtLoginName" runat="server" ReadOnly="True"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD style="width: 109px">密码：</TD>
          <TD>
              <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                  ControlToValidate="txtPwd" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD style="width: 109px">昵称：</TD>
          <TD>
              <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                  ControlToValidate="txtNickName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD style="width: 109px">电子邮件：</TD>
          <TD>
              <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                  ControlToValidate="txtEmail" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                  ControlToValidate="txtEmail" ErrorMessage="Email有误!" 
                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </TD></TR>
        <TR>
          <TD><A </TD><td>
            <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="保存" 
                Width="67px" style="height: 26px" />
            </td></TR></TBODY></TABLE>
        </div>
 <!--尾部-->
</td></tr></table>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</asp:Content>

 
 

