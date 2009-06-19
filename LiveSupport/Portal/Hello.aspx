<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hello.aspx.cs" Inherits="Default2" Title="获取公司ID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<img src="images/tupian-5.gif" width="760" style="height: 151px" />
<table width="760" style="text-align:left; font-size:12px;">
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
    第三步: 将Live800客服图标添加到您公司的网站</span></td></tr>
<tr><td >登录LiveSupport客服系统后请点击网页代码 <br />
     
    <img  src="images/huoqu.gif"/><br />
    
    向导会帮助您通过简单的步骤，产生LiveSupport客服网页代码,并嵌入到您公司网站的页面中。 </td></tr>
</table>
</center>
</asp:Content>

