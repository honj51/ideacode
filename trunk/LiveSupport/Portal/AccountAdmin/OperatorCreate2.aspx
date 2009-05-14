<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorCreate2.aspx.cs" Inherits="Default2" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="pagetitle">&#22352;&#24109;&#31649;&#29702;</div>
    <div id="content-container-three-column" style="height: 568px">
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li class="current"><a href="AccountHome.aspx">&#36134;&#25143;&#39318;&#39029;</a></li>
                <li><a href="SetupInstructions.aspx">&#23433;&#35013;&#25351;&#21335;</a></li>
                <li><a href="OperatorsManagment.aspx">&#22352;&#24109;&#31649;&#29702;</a></li>
                <li><a href="AccountSettings.aspx">&#36134;&#25143;&#35774;&#32622;</a></li>
                <li><a href="CannedResponses.aspx">&#39044;&#32622;&#28040;&#24687;</a></li>
            </ul>
        </div>
        <div id="content-main-three-column">
<div>
<img src="Images/tjkf.jpg" />
<table style="width: 360px; height: 238px;" border="1"  cellpadding="0" 
        cellspacing="0">
<tr><td>坐席用户名：</td><td>
    <asp:TextBox ID="txtLoginName" runat="server"></asp:TextBox>
    </td></tr>
<tr><td>密码：</td><td>
    <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
    </td></tr>
    <tr><td>重置密码：</td><td>
    <asp:TextBox ID="txtPwds" runat="server"></asp:TextBox>
    </td></tr>
    <tr><td>昵称：</td><td>
    <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
    </td></tr>
<tr><td>Email地址：</td><td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
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
</div>
</div>

    </div>
</asp:Content>

