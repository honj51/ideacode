<%@ Page Language="C#" MasterPageFile="~/Theme/HRYL/Master/Child.Master" AutoEventWireup="true" Inherits="LeeHom.Cms.Web.BasePage.SinglePage.Show" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
	<div class="Sort_border">
		<div class="Sort" style="text-align:center; width: 494px;"><asp:Literal ID="IDName" runat="server" /></div>
	</div>
	<div class="ArticleRead"><asp:Literal ID="Contents" runat="server" /></div>
</asp:Content>
