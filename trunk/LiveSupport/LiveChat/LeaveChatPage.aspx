<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaveChatPage.aspx.cs" Inherits="LeaveChatPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="background-image: url(Images/bg.jpg);
            background-position: center; height: 100%; width: 100%">
            <tr>
                <td align="center">
                    <span class="formField">感谢您的关注！</span>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <fieldset>
                        <legend>
                            <asp:Label ID="lblConfirmation" runat="server" Visible="false"></asp:Label>
                            <span id="Span1">当前没有客服在线.<br />
                                请留言，我们会尽快给您回复!</span> </legend>
                        <br />
                        <fieldset style="height: 5%; width: 43.5%">
                            <legend><span class="formField">姓名</span></legend>
                            <asp:TextBox ID="txt_username" runat="server" Width="99%"></asp:TextBox>
                        </fieldset>
                        <fieldset style="height: 5%; width: 43.5%">
                            <legend><span class="formField">电话</span></legend>
                            <asp:TextBox ID="txtPhone" runat="server" Width="100%"></asp:TextBox>
                        </fieldset>
                        <br />
                        <fieldset style="height: 5%; width: 87%">
                            <legend><span class="formField">您的电子邮件</span></legend>&nbsp;<asp:TextBox ID="txtSendBy"
                                runat="server" Width="100%"></asp:TextBox>
                        </fieldset>
                        <br />
                        <fieldset style="height: 5%; width: 87%">
                            <legend><span class="formField">主题</span></legend>&nbsp;<asp:TextBox ID="txtTheme"
                                runat="server" Width="100%"></asp:TextBox>
                        </fieldset>
                        <br />
                        <fieldset style="height: 230px; width: 87%">
                            <legend><span class="formField">留言内容</span> </legend>
                            <asp:TextBox ID="txtComment" runat="server" Height="230px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </fieldset>
                        <br />
                        <fieldset style="height: 2%; width: 92%;">
                            <asp:Button ID="btnSendEmail" runat="server" OnClick="btnSendEmail_Click" OnClientClick="emailclose()"
                                Text="发送邮件" />
                        </fieldset>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
