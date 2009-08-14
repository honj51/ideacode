<%@ Page Language="C#" AutoEventWireup="true" CodeFile="step4.aspx.cs" Inherits="Install_step4" %>
<%@ Import Namespace="LiveSupportInstall" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<script language="javascript" src="../templates/default/common.js"></script>
  <HEAD>
<LINK rev="stylesheet" media="all" href="css/styles.css" type="text/css" rel="stylesheet"><title>安装 LiveSupport 2.0 (.NET Framework 2.0/3.x)</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></HEAD>
      <body >
    <form id="Form1" method="post" runat="server">
        <table cellspacing="1" cellpadding="0" width="700" align="center" bgcolor="#666666"
            border="0">
            <tr>
                <td bgcolor="#ffffff">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td bgcolor="#333" colspan="2">
                                <table cellspacing="0" cellpadding="8" width="100%" border="0">
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
                                <br>
                                <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                    <tr>
                                        <td>
                                            <p>
                                                配置邮件信息</p>
                                            <table cellspacing="0" cellpadding="8" width="100%" border="0">
                                                <tr>
                                                    <td width="30%">论坛的名称:</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="forumtitle" runat="server" CanBeNull="可为空" RequiredFieldType="暂无校验"
                                                            Width="150px">LiveSupport!NT 2.0</asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>邮件服务器：</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="EmalServerPath" runat="server" CanBeNull="必填" 
                                                            RequiredFieldType="暂无校验" MaxLength="20" Size="20" Width="150px"></asp:TextBox>
                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                            ControlToValidate="EmalServerPath" ErrorMessage="服务器不能为空" InitialValue="*" 
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </td>
                                                </tr>
                                                  <tr>
                                                    <td>收发邮箱帐号：<br />
                                                        </td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="SystemMail" runat="server" RequiredFieldType="电子邮箱" MaxLength="50"
                                                            Size="20" Width="150px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                            ControlToValidate="SystemMail" ErrorMessage="邮箱帐号不能为空" InitialValue="*" 
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>E-mal&nbsp; 密码: </td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="SystemEmalPwd" runat="server" Width="150px" 
                                                            MaxLength="20" TextMode="Password"></asp:TextBox> 
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                            ControlToValidate="SystemEmalPwd" ErrorMessage="密码不能为空" InitialValue="*" 
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>确认密码:</td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="rqSystemEmalPwd" runat="server" Width="150px" 
                                                            MaxLength="20" TextMode="Password"></asp:TextBox> 
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                            ControlToCompare="SystemEmalPwd" ControlToValidate="rqSystemEmalPwd" 
                                                            ErrorMessage="确认密码不一至"></asp:CompareValidator>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <table cellspacing="0" cellpadding="8" border="0" style="width: 66%">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="btnUp" runat="server" Text="上一步" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnNext" runat="server" Text="下一步" onclick="btnNext_Click" ></asp:Button>
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

