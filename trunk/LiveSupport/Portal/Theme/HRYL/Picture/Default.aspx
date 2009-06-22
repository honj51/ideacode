<%@ Page Language="C#" MasterPageFile="~/Theme/HRYL/Master/Child.Master" AutoEventWireup="true" Inherits="LeeHom.Cms.Web.BasePage.Picture.Default" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left: 10px; margin-bottom: 10px">
        您所在的位置： <a href="../Main/Default.aspx">
            <%=LeeHom.Cms.BLL.Config.Site.Name %></a> >>
        <asp:Literal runat="server" ID="ltlCurrent" Text="首页" /></div>

<LeeHom:LHRepeater ID="rpt" runat="server" PageSize="9">
<ItemTemplate>
<div class="img"><a title="标题：<%#Eval("IDName") %>&#10;类别：<%#Eval("SName") %>&#10;时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>" rel="<%#Eval("IsExternal").ToString()=="1"?"external":"ex"%>" <%#string.IsNullOrEmpty(Eval("TitleColor").ToString()+Eval("TitleFontFace").ToString())?"":("style=\""+Eval("TitleColor")+Eval("TitleFontFace")+"\" ") %>href="../Picture/<%#Eval("ID")%>.aspx"><img src="<%#Eval("ThumbPath")%>" title="<%#Eval("IDName") %>" /></a><br />
<%#LeeHom.Utility.Text.StringOperate.CutString(Eval("IDName").ToString(),11) %></div>
</ItemTemplate>
</LeeHom:LHRepeater>

</asp:Content>
