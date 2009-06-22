<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Affiche.Show" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"><span>发布时间：<asp:Literal ID="PostTime" runat="server" /></span>>> 通知公告</div>
<div class="border">
<div class="idName"><asp:Literal runat="server" ID="IDName" /></div>
<hr />
<div class="content"><asp:Literal ID="Contents" runat="server" /></div>
</div>
</div>
</asp:Content>