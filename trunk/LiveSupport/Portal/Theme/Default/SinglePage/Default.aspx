<%@ Page Language="C#" MasterPageFile="~/Theme/Default/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.SinglePage.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"> >> <asp:Literal runat="server" ID="IDName" Text="公告通知" /></div>
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="15">
<HeaderTemplate>
<ul>
</HeaderTemplate>
<ItemTemplate>
<li><span><%#Eval("PostTime") %></span><a rel="ex" href="../SinglePage/<%#Eval("ID") %>.aspx"><%#Eval("IDName")%></a></li>
</ItemTemplate>
<FooterTemplate>
</ul>
</FooterTemplate>
</LeeHom:LHRepeater>
</div>
</asp:Content>