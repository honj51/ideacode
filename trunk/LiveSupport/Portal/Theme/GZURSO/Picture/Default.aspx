<%@ Page Language="C#" MasterPageFile="~/Theme/GZURSO/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Picture.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"> >> <asp:Literal runat="server" ID="IDName" Text="图片中心" /></div>
<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="15">
<HeaderTemplate>
<ul>
</HeaderTemplate>
<ItemTemplate>
<li><span><%#Eval("PostTime") %></span><%#Eval("IsTop").ToString()=="1"?"[顶]":""%><a title="标题：<%#Eval("IDName") %>&#10;类别：<%#Eval("SName") %>&#10;时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>" rel="<%#Eval("IsExternal").ToString()=="1"?"external":"ex"%>" <%#string.IsNullOrEmpty(Eval("TitleColor").ToString()+Eval("TitleFontFace").ToString())?"":("style=\""+Eval("TitleColor")+Eval("TitleFontFace")+"\" ") %>href="../Picture/<%#Eval("ID")%>.aspx"><%#Eval("IDName")%></a></li>
</ItemTemplate>
<FooterTemplate>
</ul>
</FooterTemplate>
</LeeHom:LHRepeater>
</div>
</asp:Content>