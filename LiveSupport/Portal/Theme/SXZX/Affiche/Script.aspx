<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Script.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Affiche.Script" %>
<%@ Register assembly="LeeHom.WebControls" namespace="LeeHom.WebControls" tagprefix="LeeHom" %>
var sAnnounce = '';
<LeeHom:LHRepeater ID="rpt" runat="server" HavePage="false">
<ItemTemplate>
sAnnounce += '<a style="<%#Eval("TitleColor") %><%#Eval("TitleFontFace") %>" href="<%=LeeHom.Cms.BLL.Config.Site.Url + LeeHom.Utility.ApplicationInfo.WebPath %>Announce/<%#Eval("ID") %>.aspx" rel="external"><%# LeeHom.Utility.Text.StringOperate.CutString(Eval("IDName").ToString(),Word) %></a>　[<%#Eval("PostTime")%>]<br />';
</ItemTemplate>
</LeeHom:LHRepeater>
document.getElementById('divAnnounce').innerHTML = sAnnounce;