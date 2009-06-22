<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Picture.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"><img src="../Theme/LHTheme/Page/Page.gif" /><asp:Literal runat="server" ID="IDName" Text="图片中心" /></div>
<div class="border">
<div id="PicList">
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="16">
<ItemTemplate>
<div class="img"><a title="标题：<%#Eval("IDName") %>&#10;类别：<%#Eval("SName") %>&#10;时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>" rel="<%#Eval("IsExternal").ToString()=="1"?"external":"ex"%>" <%#string.IsNullOrEmpty(Eval("TitleColor").ToString()+Eval("TitleFontFace").ToString())?"":("style=\""+Eval("TitleColor")+Eval("TitleFontFace")+"\" ") %>href="../Picture/<%#Eval("ID")%>.aspx"><img src="<%#Eval("ThumbPath")%>" title="<%#Eval("IDName") %>" /></a><br />
<%#LeeHom.Utility.Text.StringOperate.CutString(Eval("IDName").ToString(),11) %></div>
</ItemTemplate>
</LeeHom:LHRepeater>
</div>
</div>
</div>
</asp:Content>