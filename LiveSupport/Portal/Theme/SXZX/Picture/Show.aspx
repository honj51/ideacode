<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Picture.Show" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"><span>发布时间：<asp:Literal runat="server" ID="PostTime" /></span><img src="../Theme/LHTheme/Page/Page.gif" />图片中心</div>
<div class="border">
<div class="idName"><asp:Literal runat="server" ID="IdName" /></div>
<div class="picShow"><asp:Literal ID="PicPath" runat="server" /></div>
<fieldset class="content"><asp:Literal ID="Contents" runat="server" /></fieldset>
<div class="info right">出处：<asp:Literal runat="server" ID="ComeFrom" />　　作者：<asp:Literal ID="Author" runat="server" />　　查看：<asp:Literal ID="Hits" runat="server" />次　　</div>
<div class="comment"></div>
<div class="relation"></div>
</div>
</div>
</asp:Content>
