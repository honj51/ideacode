<%@ Page Language="C#" MasterPageFile="~/Theme/HRYL/Master/Child.Master" AutoEventWireup="true" Inherits="LeeHom.Cms.Web.BasePage.Picture.Show" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div style="margin-left: 10px; margin-bottom: 10px">
        您所在的位置： <a href="../Main/Default.aspx">
            <%=LeeHom.Cms.BLL.Config.Site.Name %></a> >>
        <asp:Literal runat="server" ID="ltlCurrent" Text="首页" /></div>
    <div class="title"><asp:Literal ID="IdName" runat="server" /></div>
    <div class="info">查看：<asp:Literal ID="Hits" runat="server" />次　　发表时间：<asp:Literal ID="PostTime" runat="server" /></div>
    <div class="imgShow"><asp:Literal ID="PicPath" runat="server" /></div>
    <div class="ArticleRead"><asp:Literal ID="Contents" runat="server" /></div>
</asp:Content>
