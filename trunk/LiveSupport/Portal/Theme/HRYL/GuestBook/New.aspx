<%@ Page Language="C#" MasterPageFile="../Master/Child.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Guestbook.New" %>
<%@ Register assembly="LeeHom.WebControls" namespace="LeeHom.WebControls" tagprefix="LeeHom" %>
<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left: 10px; margin-bottom: 10px">
        您所在的位置： <a href="../Main/Default.aspx">
            <%=LeeHom.Cms.BLL.Config.Site.Name %></a> >>
        <asp:Literal runat="server" ID="ltlCurrent" Text="首页" /></div>
<table class="gbTableW" cellspacing="0" cellpadding="5">
<tr>
<td class="gbTitle" colspan="2"><img src="../Theme/LHTheme/Images/GBIcon.gif" alt="" /> 签写留言</td>
</tr>
<tr>
<td>昵称：</td>
<td><LeeHom:LHValidateTextBox MaxLength="6" runat="server" CssClass="dataInput" ID="Poster" Title="昵称" /></td>
</tr>
<tr>
<td>性别：</td>
<td><asp:RadioButtonList ID="Sex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
<asp:ListItem Selected="True">先生</asp:ListItem>
<asp:ListItem>女士</asp:ListItem>
<asp:ListItem>保密</asp:ListItem>
</asp:RadioButtonList></td>
</tr>
<tr>
<td>电话：</td>
<td><LeeHom:LHValidateTextBox runat="server" ID="Address" CssClass="dataInput" MaxLength="9" Title="电话" AllowNull="true" /> (仅管理员可见)</td>
</tr>
<tr>
<td>邮件：</td>
<td><LeeHom:LHValidateTextBox runat="server" ID="Mail" CssClass="dataInput" Chk="chkMail" MaxLength="24" Title="邮件" AllowNull="true" /> (推荐填写，管理员回复后您将会收到回复内容)</td>
</tr>
<tr>
<td>ＱＱ：</td>
<td><LeeHom:LHValidateTextBox runat="server" ID="QQ" CssClass="dataInput" Chk="chkNumber" MaxLength="9" Title="ＱＱ" AllowNull="true" /></td>
</tr>   
<tr>
<td>主页：</td>
<td><LeeHom:LHValidateTextBox runat="server" ID="PersonWeb" CssClass="dataInput" Chk="chkUrl" Title="主页" AllowNull="true" /></td>
</tr>
<tr>
<td>ＩＰ：</td>
<td><%=LeeHom.Utility.Web.WebInfo.ClientIP %></td>
</tr>
<tr>
<td>留言内容</td>
<td><LeeHom:LHValidateTextBox runat="server" ID="Contents" Rows="10" TextMode="MultiLine" CssClass="specialInput" Title="留言内容" /></td>
</tr>
<tr>
<td>隐藏留言：</td>
<td><asp:CheckBox runat="server" ID="IsHidden" Text="(隐藏留言仅管理员可见)" /></td>
</tr>
<tr>
<td colspan="2" class="center">
<LeeHom:LHValidateImageButton ID="btnSubmit" runat="server" ImageUrl="~/Theme/LHTheme/Manager/btnSubmit.png" onclick="btnSubmit_Click" />　　　　　　　　　　　　　　　　　　<img src="../Theme/LHTheme/Manager/btnCancel.png" class="imgBtn" alt="取消" onclick="if(!_sub)Goto('Default.aspx');" />
</td>
</tr>
</table>
</asp:Content>