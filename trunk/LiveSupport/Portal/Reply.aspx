<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Reply.aspx.cs" Inherits="Default2" Title="无标题页" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="center" cellSpacing=1 cellPadding=0 width="785px" bgColor=#d2dfe6 border=0>
<tr><td colspan="2" align="left" bgColor=#f3f7fa style="height:30px;">
&nbsp;&nbsp;&nbsp;<a href="AddLiveSupportLeaveWord.aspx"><font style="font-size:14px;"><u>发表留言</u></font></a>&nbsp;&nbsp;&nbsp; 欢迎您：LiveSupport管理员!&nbsp;&nbsp;&nbsp;<a href="LiveSupportLeaveWord.aspx?action=loginout" onclick='return confirm("您确定要退出管理模式吗?");'>[注销]</a>
</td></tr>
            <tr>
                <td align="center" bgColor=#ffffff>
                    回复内容：</td>
                <td align="left" bgColor=#ffffff>
                 <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="FCKeditor/" ToolbarSet="Basic">
                    </FCKeditorV2:FCKeditor>
                    </td>
            </tr>
            <tr>
                <td align="center" bgColor=#f3f7fa>
                    &nbsp;</td>
                <td align="left" bgColor=#f3f7fa>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="发表回复" />
                </td>
            </tr>
        </table>
</asp:Content>

