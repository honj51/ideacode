<%@ Page Language="C#" MasterPageFile="~/Theme/SXZX/Master/Default.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Download.Show" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="c2" ContentPlaceHolderID="body" runat="server">

<asp:Literal ID="SortName" runat="server" Visible="false" />

<div class="page">
<div class="title"><img src="../Theme/LHTheme/Page/Page.gif" />下载中心</div>
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
        <td colspan="2"><asp:Literal ID="Description" runat="server" /></td>
    </tr>
</table>



<div class="comment"></div>
<div class="relation"></div>
</div>
</div>



</asp:Content>
