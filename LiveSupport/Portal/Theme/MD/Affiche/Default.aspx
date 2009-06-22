<%@ Page Language="C#" MasterPageFile="~/Theme/MD/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Affiche.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"><img src="../Theme/MD/Page/Sort.gif" /><asp:Literal runat="server" ID="IDName" Text="公告通知" /></div>
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="15" UrlRewriterFormat="Affiche/p{0}.aspx">
<HeaderTemplate>
<ul>
</HeaderTemplate>
<ItemTemplate>
<li><span><%#Eval("PostTime") %></span><a title="标题：<%#Eval("IDName") %>&#10;时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>" rel="ex" <%#string.IsNullOrEmpty(Eval("TitleColor").ToString()+Eval("TitleFontFace").ToString())?"":("style=\""+Eval("TitleColor")+Eval("TitleFontFace")+"\" ") %>href="../Affiche/<%#Eval("ID") %>.aspx"><%#Eval("IDName")%></a></li>
</ItemTemplate>
<FooterTemplate>
</ul>
</FooterTemplate>
</LeeHom:LHRepeater>
</div>
</asp:Content>
