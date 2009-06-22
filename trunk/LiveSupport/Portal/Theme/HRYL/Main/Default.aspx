<%@ Page Language="C#" MasterPageFile="~/Theme/HRYL/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="LeeHom.Cms.Web.BasePage.Main.Default" %>

<%@ Register Assembly="LeeHom.Cms.Controls" Namespace="LeeHom.Cms.Controls" TagPrefix="LeeHomCms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>贵州恒润医疗设备</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="Whole">
        <div class="left">
            <div class="Sort_border">
                <div class="Sort">
                    &nbsp;
                    <img alt="" src="../Theme/Hryl/Images/Sort.gif" width="15" height="12" />&nbsp;
                    公司简介&nbsp; |&nbsp; About Us</div>
                <div style="width: 40px; height: 7px; float: right; margin-top: 15px; margin-right: 12px">
                    <a href="../SinglePage/1.aspx">
                        <img alt="" src="../Theme/Hryl/Images/more.gif" style="border-style: none; border-width: 0;" /></a></div>
            </div>
            <div style="width: 435px; margin-top: 10px; margin-bottom: 10px">
                <img alt="" src="../Theme/Hryl/Images/gsss.jpg" style="float: left; margin-left: 6px;
                    margin-right: 10px" /><%=LeeHom.Utility.Text.StringOperate.HtmlEncode(LeeHom.Cms.BLL.Config.Site.Description) %></div>
            <div class="Sort_border">
                <div class="Sort">
                    &nbsp;
                    <img alt="" src="../Theme/Hryl/Images/Sort.gif" width="15" height="12" />&nbsp;
                    新闻中心&nbsp; |&nbsp; News</div>
                <div style="width: 40px; height: 7px; float: right; margin-top: 15px; margin-right: 12px">
                    <a href="../Article/s2.aspx">
                        <img alt="" src="../Theme/Hryl/Images/more.gif" style="border-style: none; border-width: 0;" /></a></div>
            </div>
            <dl id="NewsList">
                <LeeHomCms:ModuleRepeater ID="mrptNews" runat="server" ShowIsTop="true" DataCount="6" SortID="2">
                    <ItemTemplate>
                        <li><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy-MM-dd") %>　|　<a rel="external" title="<%#Eval("IDName") %>" href="../Article/<%#Eval("ID") %>.aspx"><%#Eval("ShortTitle") %></a></li>
                    </ItemTemplate>
                </LeeHomCms:ModuleRepeater>
            </dl>
        </div>
        <div class="right">
            <div class="Sort_border_right">
                <div class="Sort_right">
                    <img alt="" src="../Theme/Hryl/Images/Sort.gif" width="15" height="12" />&nbsp;
                    产品展示&nbsp; |&nbsp; Products</div>
                <div style="width: 40px; height: 7px; float: right; margin-top: 15px; margin-right: 12px">
                    <a href="../Picture/s1.aspx">
                        <img alt="" src="../Theme/Hryl/Images/more.gif" style="border-style: none; border-width: 0;" /></a></div>
            </div>
            <ul id="ImgList">
                <LeeHomCms:ModuleRepeater ID="mrptProducet" runat="server" ShowIsTop="true" DataCount="4" Module="Picture" SortID="1">
                    <ItemTemplate>
                        <li><a href="../Picture/<%#Eval("ID") %>.aspx" rel="external"><img alt="<%#Eval("IDName") %>" src="<%#Eval("ThumbPath") %>" /><span><%#LeeHom.Utility.Text.StringOperate.CutString(Eval("IDName").ToString(),9) %></span></a></li>
                    </ItemTemplate>
                </LeeHomCms:ModuleRepeater>
            </ul>
            <div style="text-align: center; margin-top: 5px">
                <input id="Keyword" />&nbsp;&nbsp;
                <select id="Type">
                    <option value="Picture">产品</option>
                    <option value="Article">新闻</option>
                </select>&nbsp;&nbsp;
                <input class="Search_button" type="submit" value="搜索" onclick='window.location="../Search_"+$("Type").value+"_0/"+$("Keyword").value+".aspx"' name="Submit" />
            </div>
        </div>
    </div>
</asp:Content>
