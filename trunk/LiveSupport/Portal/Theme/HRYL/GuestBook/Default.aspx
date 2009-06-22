﻿<%@ Page Language="C#" MasterPageFile="../Master/Child.Master" AutoEventWireup="true" Inherits="LeeHom.Cms.Web.BasePage.Guestbook.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left: 10px; margin-bottom: 10px">
        您所在的位置： <a href="../Main/Default.aspx">
            <%=LeeHom.Cms.BLL.Config.Site.Name %></a> >>
        <asp:Literal runat="server" ID="ltlCurrent" Text="首页" /></div>
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="4" SqlPageEnabled="True">
<ItemTemplate>
<table class="gbTable" cellspacing="0" cellpadding="5">
<tr>
<td valign="middle" class="gbTitle" colspan="2"><label># <%#base.Floor-- %> <a href="New.aspx">[签写留言]</a></label><img src="../Theme/LHTheme/Images/GBIcon.gif" alt="" /> <%#Eval("PostTime")%></td>
</tr>
<tr>
<td valign="top" class="gbTdl">
昵称：<%#Eval("Poster")%><br />
性别：<%#Eval("Sex")%><br />
ＱＱ：<%#string.IsNullOrEmpty(Eval("QQ").ToString()) ? "保密" : ("<a href=\"tencent://message/?uin=" + Eval("QQ") + "&site=" + LeeHom.Cms.BLL.Config.Site.Name + "&menu=yes\">" + Eval("QQ") + "</a>")%><br />
<%#string.IsNullOrEmpty(Eval("Mail").ToString()) ? "" : "邮件：<a href=\"mailto:" + Eval("Mail") + "\" rel=\"external\">发送电子邮件</a><br />"%>
<%#string.IsNullOrEmpty(Eval("PersonWeb").ToString()) ? "" : "主页：<a href=\"" + Eval("PersonWeb") + "\" rel=\"external\">访问个人主页</a><br />"%>
ＩＰ：<%#Eval("IP")%>
</td>
<td valign="top" class="gbTdr">
留言内容：<hr /><%#Eval("IsPassed").ToString() == "1" && Eval("IsHidden").ToString() == "0" ? LeeHom.Utility.Text.StringOperate.HtmlEncode(Eval("Contents").ToString()) : (Eval("IsHidden").ToString() == "1" ? "<span class=\"greenText\">该留言为管理员可见留言</span>" : "<span class=\"orangeText\">该留言未通过待审</span>")%>
<%#string.IsNullOrEmpty(Eval("Replays").ToString()) ? "" : ("<div class=\"replay\">管理员[" + Eval("Replayer") + "]于[" + Eval("ReplayTime") + "]回复：<hr />" + Eval("Replays") + "</div>")%>
</td>
</tr>
</table>
</ItemTemplate>
</LeeHom:LHRepeater>
</asp:Content>