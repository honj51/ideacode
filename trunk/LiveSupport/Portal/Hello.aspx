<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" AutoEventWireup="true" CodeFile="Hello.aspx.cs" Inherits="Default2" Title="获取公司ID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<div><img src="Imgs/GetAccountId.jpg" style="margin-top:5px;" /></div>


<table cellpadding="0" cellspacing="0" style=" width:785px; position: relative;">
<tr><td style="background-image:url('Imgs/about-down2.GIF'); text-align:left; vertical-align:top;">
<table cellpadding="0" cellspacing="0" style=" text-align:center; width:760px;">
<tr><td>


</td></tr>
<tr><td align="left">
<table width="760" style=" text-align:left; font-size:12px;margin-left:15px; ">
<tr><td>
    <span style="LINE-HEIGHT: 30px; COLOR: #000000; FONT-SIZE: 13px; FONT-WEIGHT: bold">
    第一步: 创建你的公司ID</span></td></tr>
<tr><td  ><span style="COLOR: #ff9933">恭喜： 您已完成注册！</span>
    <br />
    您的公司登录ID是：<asp:Label ID="lblId" runat="server"></asp:Label>
    <br />
    您的客服ID是：<asp:Label ID="lblLoginName" runat="server"></asp:Label>
    <br />
    同时我们已经给您的电子邮箱<asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
    发送了相关邮件。</td></tr>
<tr><td>
    <span style="LINE-HEIGHT: 30px; COLOR: #000000; FONT-SIZE: 13px; FONT-WEIGHT: bold">
    第二步: 下载客服软件</span></td></tr>
<tr><td >请点击下载LiveSupport客服软件<br />
    <br />
    <a href="Download/OperatorConsole.msi"><img  src="images/btn_down.gif"/></a><br />
    <br />
&nbsp;运行后请在登录窗口中输入您的公司ID，客服ID，密码登录LiveSupport客服系统。  
    <br />
                              </td></tr>
<tr><td >
    <span style="LINE-HEIGHT: 30px; COLOR: #000000; FONT-SIZE: 13px; FONT-WEIGHT: bold">
    第三步: 将LiveSupport客服图标添加到您公司的网站</span></td></tr>
<tr><td >登录LiveSupport客服中心后请点击风格设置中的获取代码设置<br />
    <br />
     
    <img  src="images/huoqu.gif" /><br />
    
    向导会帮助您通过简单的步骤，产生LiveSupport客服网页代码,请嵌入到您公司网站的页面中。  
    <br />
    <br />
    <img src="images/getCode.jpg" style="width: 744px; height: 192px"  /><br />
    浏览您的网站 即可
    <br />
&nbsp;</td></tr>
</table>
    </td></tr>
</table>
    </td></tr>
    <tr><td style="background-image:url('Imgs/about-bottom2.GIF'); text-align:left; height:15px;">

        </td></tr>
</table>
</center>
</asp:Content>

