<%@ Page Language="C#" MasterPageFile="~/Theme/GZURSO/Master/Default.Master" AutoEventWireup="true" Inherits="LeeHom.Cms.Web.BasePage.Main.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<%@ Register src="~/App_Control/ModuleRepeater.ascx" tagname="ModuleRepeater" tagprefix="LeeHomCms" %>
<%@ Register src="~/App_Control/SearchSort.ascx" tagname="SearchSort" tagprefix="LeeHomCms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

<LeeHomCms:ModuleRepeater ID="ModuleRepeater1" runat="server" SortID="3" SortName=">> 招生快讯" CssClass="fleft" />

<div class="fright">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="scriptmain" name="scriptmain" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" style="width: 330px; height: 206px">
    <param name="movie" value="../Theme/Pic.swf?bcastr_xml_url=../Picture/ImgList.aspx&AutoPlayTime=4&TitleBgAlpha=50&TitleBgColor=0x0066ff&BtnOverColor=0x0066ff"/>
    <param name="quality" value="high"/>
    <param name="scale" value="noscale"/>
    <param name="LOOP" value="false"/>
    <param name="menu" value="false"/>
    <param name="wmode" value="transparent"/>
    <embed src="../Theme/Pic.swf?bcastr_xml_url=../Picture/ImgList.aspx&AutoPlayTime=4&TitleBgAlpha=60&TitleBgColor=0x0066ff&BtnOverColor=0x0066ff" width="330" height="206" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent"></embed>
  </object>
</div>

<div id="Search">类别：<LeeHomCms:SearchSort ID="Sort" runat="server" />　关键字：<input id="Key" type="text" class="dataInput" />　<input type="button" onclick="return Search($('<%=Sort.SortID %>').value,$('Key'))" value=" 搜 索 " /></div>

<LeeHomCms:ModuleRepeater ID="ModuleRepeater2" runat="server" SortID="5" SortName=">> 招生章程" CssClass="fleft" />
<LeeHomCms:ModuleRepeater ID="ModuleRepeater3" runat="server" SortID="6" SortName=">> 招生政策" CssClass="fright"  />
<LeeHomCms:ModuleRepeater ID="ModuleRepeater4" runat="server" SortID="2" SortName=">> 专业简介" CssClass="fleft" />
<LeeHomCms:ModuleRepeater ID="ModuleRepeater5" runat="server" SortID="15" SortName=">> 考生问答" CssClass="fright"  />
</asp:Content>
