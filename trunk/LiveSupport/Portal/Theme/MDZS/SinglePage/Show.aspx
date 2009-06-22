<%@ Page Language="C#" MasterPageFile="../Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.SinglePage.Show" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"> >> <asp:Literal runat="server" ID="IDName" /></div>
<div class="content"><asp:Literal ID="Contents" runat="server" /></div>
</div>
</asp:Content>