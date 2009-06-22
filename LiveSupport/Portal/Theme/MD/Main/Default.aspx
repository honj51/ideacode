<%@ Page Language="C#" MasterPageFile="~/Theme/MD/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Main.Default" %>

<%@ Register Assembly="LeeHom.Cms.Controls" Namespace="LeeHom.Cms.Controls" TagPrefix="LeeHomCms" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<%@ Register src="~/App_Control/ModuleRepeater.ascx" tagname="ModuleRepeater" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

<dl style="width:670px;height:auto;">
<dt><a href="../Article/s2.aspx" rel="ex"><img src="../Theme/MD/Page/More.gif" /></a><img src="../Theme/MD/Page/Sort.gif" />重要新闻</dt>
<dd style="margin:0;">
<div class="indexFlash">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" class="f">
    <param name="movie" value="../Theme/Pic.swf?bcastr_xml_url=../Article/ImgList.aspx&AutoPlayTime=4&TitleBgAlpha=0&TitleBgColor=0x990000&BtnOverColor=0x990000"/>
    <embed class="f" src="../Theme/Pic.swf?bcastr_xml_url=../Article/ImgList.aspx&AutoPlayTime=4&TitleBgAlpha=60&TitleBgColor=0x990000&BtnOverColor=0x990000" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" menu="false"></embed>
  </object>
</div>
<div style="float:left;">
<dl style="border:none;width:auto;">
<LeeHomCms:ModuleRepeater ID="ImportNews" runat="server" DataCount="10" ShowIsTop="true" SortID="2">
<ItemTemplate>
<dd><a rel="ex" href="../Article/<%#Eval("ID") %>.aspx" title="标题：<%#Eval("IDName") %>&#10;作者：<%#Eval("Author") %>&#10;发表时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>"><%#Eval("ShortTitle") %></a>　<label>[ <%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy-MM-dd") %> ]</label></dd>
</ItemTemplate>
</LeeHomCms:ModuleRepeater>
</dl>
</div>
</dd>
<dd class="clear"></dd>
</dl>

<dl style="width:670px;height:176px;"><dt><a href="../Picture/s45.aspx" rel="ex"><img src="../Theme/MD/Page/More.gif" /></a><img src="../Theme/MD/Page/Sort.gif" />校园风光</dt>
<dd>
<div id="scroll_div" class="scroll_div"><div id="scroll_begin" style="display: inline;">
<LeeHomCms:ModuleRepeater ID="Img" Module="Picture" runat="server" SortID="45">
<ItemTemplate>
<a rel="external" href="../Picture/<%#Eval("ID") %>.aspx"><img src="<%#Eval("ThumbPath") %>" alt="标题：<%#Eval("IDName") %>&#10;发表时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>" /></a>
</ItemTemplate>
</LeeHomCms:ModuleRepeater>
</div><div id="scroll_end" style="display: inline;"></div></div>
<script type="text/javascript">ScrollImg();</script>
</dd>
</dl>

<uc1:ModuleRepeater ID="ModuleRepeater2" runat="server" SortID="3" GetChild="True" SortName='<img src="../Theme/MD/Page/Sort.gif" />校园快讯' CssClass="fleft" />
<uc1:ModuleRepeater ID="ModuleRepeater3" runat="server" SortID="16" SortName='<img src="../Theme/MD/Page/Sort.gif" />学院文件' CssClass="fright"  />
<uc1:ModuleRepeater ID="ModuleRepeater4" runat="server" SortID="32" GetChild="true" SortName='<img src="../Theme/MD/Page/Sort.gif" />党建工作' CssClass="fleft" />
<uc1:ModuleRepeater ID="ModuleRepeater5" runat="server" SortID="44" GetChild="false" SortName='<img src="../Theme/MD/Page/Sort.gif" />办事指南' CssClass="fright"  />
</asp:Content>
