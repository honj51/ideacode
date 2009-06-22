<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Article.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"><img src="../Theme/LHTheme/Page/Page.gif" /><asp:Literal runat="server" ID="IDName" Text="文章中心" /></div>
<div class="border">
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="25">
<HeaderTemplate>
<ul>
</HeaderTemplate>
<ItemTemplate>
<li><span><%#Eval("PostTime") %></span><%#Eval("IsTop").ToString()=="1"?"[顶]":""%><%#Eval("ShortType")%><a title="标题：<%#Eval("IDName") %>&#10;类别：<%#Eval("SName") %>&#10;时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>" rel="<%#Eval("IsExternal").ToString()=="1"?"external":"ex"%>" <%#string.IsNullOrEmpty(Eval("TitleColor").ToString()+Eval("TitleFontFace").ToString())?"":("style=\""+Eval("TitleColor")+Eval("TitleFontFace")+"\" ") %>href="../Article/<%#Eval("ID")%>.aspx"><%#Eval("ShortTitle")%></a></li>
</ItemTemplate>
<FooterTemplate>
</ul>
</FooterTemplate>
</LeeHom:LHRepeater>
</div>
</div>
</asp:Content>