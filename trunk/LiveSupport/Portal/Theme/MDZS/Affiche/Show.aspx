<%@ Page Language="C#" MasterPageFile="../Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Affiche.Show" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"> >> 通知公告</div>
<div class="idName"><asp:Literal runat="server" ID="IDName" /></div>
<div class="info right">查看：<asp:Literal ID="Hits" runat="server" />次　发表时间：<asp:Literal ID="PostTime" runat="server" /></div>
<div class="content"><asp:Literal ID="Contents" runat="server" /></div>
</div>
</asp:Content>