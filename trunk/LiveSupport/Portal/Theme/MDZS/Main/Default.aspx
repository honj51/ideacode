<%@ Page Language="C#" MasterPageFile="~/Theme/MDZS/Master/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Main.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<%@ Register src="~/App_Control/ModuleRepeater.ascx" tagname="ModuleRepeater" tagprefix="LeeHomCms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

<LeeHomCms:ModuleRepeater ID="ModuleRepeater1" runat="server" SortID="1" SortName=">> 招生快讯" CssClass="fleft zskx" />

<div class="fright">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="scriptmain" name="scriptmain" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" class="flash">
    <param name="movie" value="../Theme/Pic.swf?bcastr_xml_url=../Picture/ImgList.aspx&AutoPlayTime=4&TitleBgAlpha=50&TitleBgColor=0x990000&BtnOverColor=0x990000"/>
    <param name="quality" value="high"/>
    <param name="scale" value="noscale"/>
    <param name="LOOP" value="false"/>
    <param name="menu" value="false"/>
    <param name="wmode" value="transparent"/>
    <embed src="../Theme/Pic.swf?bcastr_xml_url=../Picture/ImgList.aspx&AutoPlayTime=4&TitleBgAlpha=60&TitleBgColor=0x990000&BtnOverColor=0x990000" class="flash" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent"></embed>
  </object>
</div>

<div id="Search"><LeeHom:LHTree visible="false"  ID="ddlSort" TreeMode="DropDownList" runat="server" CssClass="dataInput" /></div>

<LeeHomCms:ModuleRepeater ID="ModuleRepeater2" runat="server" SortID="11" SortName=">> 招生章程" CssClass="fleft" />
<LeeHomCms:ModuleRepeater ID="ModuleRepeater3" runat="server" SortID="10" SortName=">> 招生政策" CssClass="fright"  />
<LeeHomCms:ModuleRepeater ID="ModuleRepeater4" runat="server" SortID="8" SortName=">> 专业简介" CssClass="fleft" />
<LeeHomCms:ModuleRepeater ID="ModuleRepeater5" runat="server" SortID="5" SortName=">> 考生问答" CssClass="fright"  />
</asp:Content>
