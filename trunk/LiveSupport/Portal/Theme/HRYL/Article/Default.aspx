<%@ Page Language="C#" MasterPageFile="~/Theme/HRYL/Master/Child.Master" AutoEventWireup="true"
    Inherits="LeeHom.Cms.Web.BasePage.Article.Default" %>

<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left: 10px; margin-bottom: 10px">
        您所在的位置： <a href="../Main/Default.aspx">
            <%=LeeHom.Cms.BLL.Config.Site.Name %></a> >>
        <asp:Literal runat="server" ID="ltlCurrent" Text="首页" /></div>
    <LeeHom:LHRepeater ID="rpt" runat="server" PageSize="16">
        <HeaderTemplate>
            <ul id="News">
        </HeaderTemplate>
        <ItemTemplate>
            <li><span>
                <%#Eval("PostTime") %></span><%#Eval("IsTop").ToString()=="1"?"[顶]":""%><%#Eval("ShortType")%><a
                    title="标题：<%#Eval("IDName") %>&#10;类别：<%#Eval("SName") %>&#10;时间：<%#Eval("PostTime") %>&#10;点击：<%#Eval("Hits") %>"
                    rel="<%#Eval("IsExternal").ToString()=="1"?"external":"ex"%>" <%#string.IsNullOrEmpty(Eval("TitleColor").ToString()+Eval("TitleFontFace").ToString())?"":("style=\""+Eval("TitleColor")+Eval("TitleFontFace")+"\" ") %>href="../Article/<%#Eval("ID")%>.aspx"><%#Eval("ShortTitle")%></a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </LeeHom:LHRepeater>
</asp:Content>
