﻿<%@ Page Language="C#" MasterPageFile="~/Theme/GZURSO/Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Vote.Show" %>

<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

<asp:Literal runat="server" ID="IDName" /><br /><asp:Literal runat="server" ID="CanVote" /><br /><asp:Literal runat="server" ID="VoteInfomation" />

<LeeHom:LHRepeater ID="rptText" runat="server" Visible="false" HavePage="false">
<HeaderTemplate><ul></HeaderTemplate>
<ItemTemplate>
<li><input type="radio" name="ot" value="<%#Eval("ID") %>" /><%#Eval("IDName") %> <%#Eval("VCount") %></li>
</ItemTemplate>
<FooterTemplate></ul></FooterTemplate>

</LeeHom:LHRepeater>
<LeeHom:LHRepeater ID="rptTextMult" runat="server" Visible="false" HavePage="false">
<HeaderTemplate><ul></HeaderTemplate>
<ItemTemplate>
<li><input type="checkbox" name="ot" value="<%#Eval("ID") %>" /><%#Eval("IDName") %> <%#Eval("VCount") %></li>
</ItemTemplate>
<FooterTemplate></ul></FooterTemplate>
</LeeHom:LHRepeater>

<LeeHom:LHRepeater ID="rptImage" runat="server" Visible="false" HavePage="false">
<HeaderTemplate><ul></HeaderTemplate>
<ItemTemplate>
<li><img src="<%#Eval("ImagePath") %>" alt="<%#Eval("IDName") %>"/><label><input type="radio" name="ot" value="<%#Eval("ID") %>" /><%#Eval("IDName") %> <%#Eval("VCount") %></label></li>
</ItemTemplate>
<FooterTemplate></ul></FooterTemplate>
</LeeHom:LHRepeater>

<LeeHom:LHRepeater ID="rptImageMult" runat="server" Visible="false" HavePage="false">
<HeaderTemplate><ul></HeaderTemplate>
<ItemTemplate>
<li><img src="<%#Eval("ImagePath") %>" alt="<%#Eval("IDName") %>"/><label><input type="checkbox" name="ot" value="<%#Eval("ID") %>" /><%#Eval("IDName") %> <%#Eval("VCount") %></label></li>
</ItemTemplate>
<FooterTemplate></ul></FooterTemplate>
</LeeHom:LHRepeater>
<LeeHom:LHPleaseWaitImageButton ID="btnSubmit" runat="server" ShowSecondButton="true" SecondButtonType="Script" ImageUrl="../Theme/LHTheme/Manager/btnSubmit.png" SecondBtnSrc="../Theme/LHTheme/Manager/btnCancel.png" SplitBtnSecond="　　　　　　　　　　　　　　　　　　　　" onclick="btnSubmit_Click" />
</asp:Content>
