<%@ Page Title="" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorCreate.aspx.cs" Inherits="AccountAdmin_Default2" %>

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
     添加客服</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
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
      <tr><td>是否是管理员：</td><td>
        <asp:DropDownList ID="ddlIsAdmin" runat="server">
            <asp:ListItem Value="false">否</asp:ListItem>
            <asp:ListItem Value="true">是</asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><td>客服状态：</td><td>
        <asp:DropDownList ID="ddlStatus" runat="server">
            <asp:ListItem Value="Idle">空闲</asp:ListItem>
            <asp:ListItem Value="Chatting">交谈中</asp:ListItem>
            <asp:ListItem Value="BeRightBack">一会回来</asp:ListItem>
            <asp:ListItem Value="Away">离开</asp:ListItem>
            <asp:ListItem Value="Offline ">离线</asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><td style="height: 18px">音频状态：</td><td style="height: 18px">
        <asp:DropDownList ID="ddlAVChatStatus" runat="server">
            <asp:ListItem Value="Idle">空闲</asp:ListItem>
            <asp:ListItem Value="Chatting">通话中</asp:ListItem>
        </asp:DropDownList>
    </td></tr>
<tr style="background-image:url('Images/tjkf2.jpg');"><td></td>
    <td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/AccountAdmin/Images/add.gif" onclick="ImageButton1_Click" />
    </td></tr>
</table>
 <!--尾部-->
           </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>

</asp:Content>

