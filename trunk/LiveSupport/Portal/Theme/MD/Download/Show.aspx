<%@ Page Language="C#" MasterPageFile="~/Theme/MD/Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Download.Show" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">
<div class="page">
<div class="title"><img src="../Theme/MD/Page/Sort.gif" /><asp:Literal runat="server" ID="SortName" /></div>
<div class="border">
<table border="0" cellpadding="5" cellspacing="1" id="Down">
<colgroup>
<col style="width:12%;" />
<col style="width:58%;" />
<col style="width:30%;" />
</colgroup>
    <tr>
        <td>名　　称</td>
        <td><asp:Literal ID="IDName" runat="server" /></td>
        <td rowspan="5"><asp:Literal ID="ThumbPath" runat="server" />&nbsp;</td>
    </tr>
    <tr>
        <td>所在类别</td>
        <td><asp:Literal ID="SortName2" runat="server" /></td>
    </tr>
    <tr>
        <td>查看次数</td>
        <td><asp:Literal ID="Hits" runat="server" /></td>
    </tr>
    <tr>
        <td>下载次数</td>
        <td><asp:Literal ID="DownCount" runat="server" /></td>
    </tr>
    <tr>
        <td>添加时间</td>
        <td><asp:Literal ID="PostTime" runat="server" /></td>
    </tr>
    <tr>
        <td>下载地址</td>
        <td colspan="2"><asp:Literal ID="ltlDownload" runat="server" />
        </td>
    </tr>
    <tr>
        <td>软件说明</td>
        <td colspan="2"><asp:Literal ID="Contents" runat="server" /></td>
    </tr>
</table>
</div>
<div class="comment"></div>
<div class="relation"></div>
</div>
</asp:Content>
