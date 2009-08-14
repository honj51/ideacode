<%@ Page Language="c#" AutoEventWireup="false" Inherits="LiveSupportInstall.step4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<script language="javascript" src="../admin/js/common.js"></script>

<%=header%>
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
                                <%=logo%>
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
                                                            RequiredFieldType="暂无校验" MaxLength="20" Size="20" Width="150px"></asp:TextBox>*&nbsp;
                                                        </td>
                                                </tr>
                                                  <tr>
                                                    <td>收发邮箱帐号：<br />
                                                        </td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="SystemMail" runat="server" RequiredFieldType="电子邮箱" MaxLength="50"
                                                            Size="20" Width="150px">tao410396629@126.com</asp:TextBox>
                                                        *</td>
                                                </tr>
                                                <tr>
                                                    <td>E-mal&nbsp; 密码: </td>
                                                    <td style="width: 352px">
                                                        <asp:TextBox ID="SystemEmalPwd" runat="server" Width="150px" Text="123456" 
                                                            MaxLength="20" TextMode="Password"></asp:TextBox> *<br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>确认密码:</td>
                                                    <td style="width: 352px">
                                                        <input name="repwd" type="password" maxlength="32" id="repwd" class="FormBase" onfocus="this.className='FormFocus';" onblur="this.className='FormBase';" maxlength="32" size="20" style="width:150px;"  value="123456"/>*
                                                        
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
        <%=footer%>
    </form>
</body>
</html>