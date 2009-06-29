<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestChatPage.aspx.cs"
    Inherits="RequestChatPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="background-image: url('Images/bg.jpg');
             height: 510px; width: 100%">
            <tr>
                <td valign="top" style="height: 30px; width: 100%" align="center">
                    <asp:Label ID="welcomeLabel" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 200 150 40 50; height: 40%;
                        width: 50%" align="center">
                        <tr>
                            <td align="center" colspan="2">
                                <span id="Welcome">清输入下面的内容进行对话.</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <span class="formField">您的名字:</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td align="right">
                                <span class="formField">您的电子邮件:</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnStarChat" Text="开始对话" runat="server" OnClick="btnStarChat_Click" />
                            </td>
                        </tr>
                    </table>
                    <tr>
                        <td colspan="2" align="center">
                            版权所有
                        </td>
                    </tr>
        </table>
    </div>
    </form>
</body>
</html>
