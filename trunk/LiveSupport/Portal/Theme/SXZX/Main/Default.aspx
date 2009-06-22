<%@ Page Language="C#" AutoEventWireup="true" Inherits="LeeHom.Cms.Page.SkinPage" %>
<%@ Register Assembly="LeeHom.WebControls" Namespace="LeeHom.WebControls" TagPrefix="LeeHom" %>
<%@ Register Assembly="LeeHom.Cms.Controls" Namespace="LeeHom.Cms.Controls" TagPrefix="LeeHomCms" %>
<%@ Register Src="~/App_Control/ModuleRepeater.ascx" TagName="ModuleRepeater" TagPrefix="LeeHomCms" %>
<%@ Register src="~/App_Control/Menu.ascx" tagname="Menu" tagprefix="LeeHomCms" %>
<script type="text/C#" runat="server">
    protected override void OnLoad(EventArgs e)
    {
        this.rpt.DataSource = new LeeHom.Cms.BLL.Affiche().ListToModule(8, "");
        this.rpt.DataBind();
        this.rptFindlink.DataSource = new LeeHom.Cms.BLL.Friendlink().ListToModule(4, "");
        this.rptFindlink.DataBind();
        this.rptScrollImg.DataSource = new LeeHom.Cms.BLL.Picture().ListToModule(20, " and [Picture].[SID] in (11,12)");
        this.rptScrollImg.DataBind();
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <LeeHomCms:HeadString ID="hs" Type="Page" runat="server" />
    <title>首页</title>
</head>
<body>

        <form id="form1" runat="server">

    <div id="All">
        <LeeHom:LHTipBox ID="ltb" runat="server" />
        <h1>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
                height="204" width="890">
                <param name="movie" value="../Theme/LHTheme/Page/Top.swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <embed src="../Theme/LHTheme/Page/Top.swf" width="890" height="204" quality="high"
                    pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"
                    wmode="transparent">
</embed>
            </object>
        </h1>
        <h2>
            <LeeHomCms:Menu ID="Menu1" runat="server" />
        </h2>
        <asp:Literal runat="server" ID="ltlCurrent" Text="首页" Visible="false" />
        <%--<h4><img src="../Theme/LHTheme/Page/CurrentIcon.gif" />您当前的位置： <a href="../Main">本专科招生网</a> >> <asp:Literal runat="server" ID="ltlCurrent" Text="首页" /></h4>
--%><div id="Body">
    <div id="Side">
        <div class="title" style="margin-top: 0">
            图片新闻</div>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" class="flash" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0">
            <param name="movie" value="../Theme/Pic.swf?bcastr_xml_url=../Article/ImgList.aspx&TitleBgAlpha=50&TitleBgColor=0xFF9E83&BtnOverColor=0xFF9E83&AutoPlayTime=3" />
            <param name="quality" value="high" />
            <param name="scale" value="noscale" />
            <param name="LOOP" value="false" />
            <param name="menu" value="false" />
            <param name="wmode" value="transparent" />
            <embed src="../Theme/Pic.swf?bcastr_xml_url=../Article/ImgList.aspx&TitleBgAlpha=60&TitleBgColor=0xFF9E83&BtnOverColor=0xFF9E83&AutoPlayTime=3"
                class="flash" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false"
                wmode="transparent"></embed>
        </object>
        <div class="title">
            通知公告</div>
        <ul>
            <asp:Repeater ID="rpt" runat="server">
                <ItemTemplate>
                    <li><a rel="ex" href="../Affiche/<%#Eval("ID") %>.aspx" title="标题：<%#Eval("IDName") %>&#10;发布时间：<%#Eval("PostTime") %>">
                        <%#LeeHom.Utility.Text.StringOperate.CutString(Eval("IDName").ToString(), 13) %></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div class="title">
            友情链接</div>
        <ul>
            <asp:Repeater ID="rptFindlink" runat="server">
                <ItemTemplate>
                    <li><a rel="external" title="站名：<%#Eval("IDName")%>&#10;描述：<%#Eval("Description")%>&#10;点击次数：<%#Eval("Hits")%>"
                        href="../Friendlink/<%#Eval("ID")%>.aspx">
                        <%#LeeHom.Utility.Text.StringOperate.CutString(Eval("IDName").ToString(),15) %></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div id="Content">
        <div class="default">
            <div class="fleft">
                <div class="title">
                    中心简介</div>
                <div class="border">
                    <a href="../SinglePage/6.aspx" rel="ex">
                        <img src="../Theme/LHTheme/Page/Description.gif" class="noBorder" alt="中心简介" /></a></div>
            </div>
            <div class="fright">
                <div class="title">
                    实训项目</div>
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" class="border" style="width: 316px;
                    height: 214px;" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0">
                    <param name="movie" value="../Theme/Pic.swf?bcastr_xml_url=../Theme/LHTheme/XML/Default.xml&IsShowBtn=0&TitleBgAlpha=0&AutoPlayTime=4&Tween=3" />
                    <param name="quality" value="high" />
                    <param name="scale" value="noscale" />
                    <param name="LOOP" value="false" />
                    <param name="menu" value="false" />
                    <param name="wmode" value="transparent" />
                    <embed class="border" src="../Theme/Pic.swf?bcastr_xml_url=../Theme/LHTheme/XML/Default.xml&IsShowBtn=0&TitleBgAlpha=0&AutoPlayTime=4&Tween=3"
                        class="flash" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                        type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false"
                        wmode="transparent" style="width: 316px; height: 214px;"></embed>
                </object>
            </div>
            <div class="download">
                <LeeHomCms:ModuleRepeater Module="Download" ShowTime="false" ID="drpt1" CssClass="fleft" runat="server" DataCount="4"
                    SortName="实训须知" SortID="2" CutTitle="15" />
                <LeeHomCms:ModuleRepeater Module="Download" ShowTime="false" ID="drpt2" CssClass="fright" runat="server" DataCount="4"
                    SortName="实用下载" SortID="35" CutTitle="15" />
            </div>
            <div style="margin-top: 5px; width: 100%;">
                <img id="JP" src="../Theme/LHTheme/Page/JingPai.jpg" />
                <img id="Con" src="../Theme/LHTheme/Page/Conn.jpg" />
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
        </div>
    </div>
    <div id="MPicScroll">
        <div id="scroll_div" class="scroll_div">
            <div id="scroll_begin" style="display: inline;">
                <asp:Repeater runat="server" ID="rptScrollImg">
                    <ItemTemplate>
                        <a rel="external" href="../Picture/<%#Eval("ID") %>.aspx">
                            <img src="<%#Eval("ThumbPath") %>" /></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="scroll_end" style="display: inline;">
            </div>
        </div>

        <script type="text/javascript">ScrollImg();</script>

    </div>
        </form>
    <div id="CopyRight">
        <%=LeeHom.Cms.BLL.Config.Site.Plus %>
       <hr />
        <span>设计制作：<a rel="external" title="紫竹林工作室，承接各种B/S、C/S软件制作。" href="http://www.zzlnet.net/">『紫竹林工作室』 </a></span></div>
</body>
</html>
