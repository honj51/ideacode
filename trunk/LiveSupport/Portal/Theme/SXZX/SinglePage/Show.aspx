<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.SinglePage.Show" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="border">
<div class="title"><img src="../Theme/LHTheme/Page/Page.gif" /><asp:Literal runat="server" ID="IDName" /></div>
<div class="content"><asp:Literal ID="Contents" runat="server" /></div>
</div>
</div>
</asp:Content>