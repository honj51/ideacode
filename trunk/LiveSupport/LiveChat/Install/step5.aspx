<%@ Page Language="C#" AutoEventWireup="true" CodeFile="step5.aspx.cs" Inherits="Install_step5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="javascript" src="../templates/default/common.js"></script>
<html>
<HEAD>
<LINK rev="stylesheet" media="all" href="css/styles.css" type="text/css" rel="stylesheet"><title>安装 LiveSupport 2.0 (.NET Framework 2.0/3.x)</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        .style1
        {
            width: 147px;
        }
    </style>
</HEAD>
      <body >
<body >
    <form id="Form1" method="post" runat="server" >
        <table cellspacing="1" cellpadding="0" width="700" align="center" bgcolor="#666666"
            border="0">
            <tr>
                <td bgcolor="#ffffff">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td bgcolor="#333" colspan="2">
                                <table cellspacing="0" cellpadding="8" width="100%" border="0" 
                                    style="margin-bottom: 0px">
                                    <tr>
                                        <td>
                                            <font color="#ffffff">初始化</font></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="180">
                                <img src="images/logo.jpg" width="180" height="300">
                            </td>
                            <td valign="top" width="520">
                                &nbsp;<span style="color:#F00"><strong><img src="images/logfile_48.png" 
                                    style="width: 24px; height: 15px" />注意</strong></span> :<strong>此步需手动来完成，(用来配置OperatorConsole 上传文件等功能)&nbsp;
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 需认真填写</strong>&nbsp;&nbsp; <a href="#"><span style="color:#090">详见《安装说明》</span></a><br>
                                <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                    <tr>
                                        <td>
                                            <p>
                                                <span style="color:#000"><strong>手动配置FTP 步骤：</strong></span></p>
                                            <p:colorscheme
 colors="#ffffff,#000000,#dbf5f9,#04617b,#0f6fc6,#009dd9,#e2d700,#85dfd0" 
                                                xmlns:p="urn:schemas-microsoft-com:office:powerpoint"/>

                                            <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                                <tr>
                                                    <td colspan="2">
                                                        1.创建ftp虚拟目录（如ftp://xxx/Upload）指向AppData/Upload</td>
                                                </tr>
                                                  <tr>
                                                    <td colspan="2">2.创建一个ftp用户（或修改已有的)， 对 ftp://xxx/Upload 可读写</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">3.把ftp路径[FtpUploadURL] ，ftp用户[FtpUser,FtpPassword]下面框中</td>
                                                </tr>
                                                  <tr id="tr1">
                                                    <td style="background-color: #f5f5f5" class="style1">
                                                        服务器IP地址或域名:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="ftpServer" runat="server" 
                                                            Width="150" Enabled="true" ></asp:TextBox>*<span id="msg1"></span></td>
                                                </tr>
                                                <tr id="tr2">
                                                    <td style="background-color: #f5f5f5" class="style1">
                                                        Ftp帐号:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="ftpAccounts" runat="server" 
                                                            Width="150" Enabled="true"></asp:TextBox>*<span id="msg2"></span></td>
                                                </tr>
                                                <tr id="tr3">
                                                    <td style="background-color: #f5f5f5" class="style1">
                                                        Ftp密码:</td>
                                                    <td style="background-color: #f5f5f5; width: 352px;">
                                                        <asp:TextBox ID="ftpPassWord" runat="server" Width="150"
                                                         TextMode="Password"></asp:TextBox>*<span id="msg3"></span></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            注: LiveChatServer会将这个ftp路径告诉OperatorConsole以传输文件</td>
                                    </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                            <td>&nbsp;
                                </td>
                            <td>
                                <table cellspacing="0" cellpadding="8" border="0" style="width: 66%">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="BtnUP" runat="server" Text="上一步" Width="73px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="BtnNext" runat="server" Text="下一步" Width="64px" 
                                                onclick="BtnNext_Click" />
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
       <br /><br />
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" ID="Table1">
<tr><td align="center"><div align="center" style="position:relative ; padding-top:60px;font-size:14px; font-family: Arial">
<hr style="height:1; width:600; height:1; color:#CCCCCC" />Powered by <a style="COLOR: #000000" href="http://www.zxkefu.cn" target="_blank">LiveSupport 2.0 (.NET Framework 2.0/3.x)</a>
&nbsp;<br />&copy; 2001-LiveSupport 2.0 (.NET Framework 2.0/3.x) <a style="COLOR: #000000;font-weight:bold" href="http://www.zxkefu.cn" target="_blank">Comsenz Inc.</a></div></td></tr></table>
    </form>
</body>
</html>

