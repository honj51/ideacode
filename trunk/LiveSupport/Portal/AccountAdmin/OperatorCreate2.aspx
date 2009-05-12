<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorCreate2.aspx.cs" Inherits="Default2" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="pagetitle">&#22352;&#24109;&#31649;&#29702;</div>
    <div id="content-container-three-column" style="height: 568px">
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li class="current"><a href="AccountHome.aspx">&#36134;&#25143;&#39318;&#39029;</a></li>
                <li><a href="SetupInstructions.aspx">&#23433;&#35013;&#25351;&#21335;</a></li>
                <li><a href="OperatorsManagment.aspx">&#22352;&#24109;&#31649;&#29702;</a></li>
                <li><a href="AccountSettings.aspx">&#36134;&#25143;&#35774;&#32622;</a></li>
                <li><a href="CannedResponses.aspx">&#39044;&#32622;&#28040;&#24687;</a></li>
            </ul>
        </div>
        <div id="content-main-three-column">
<table>
<tr><td colspan="2">增加坐席<br />------------------------------------------------<br /><br /></td></tr>
<tr><td>坐席用户名：</td><td>
    <asp:TextBox ID="txtLoginName" runat="server"></asp:TextBox>
    </td></tr>
<tr><td>密码：</td><td>
    <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
    </td></tr>
    <tr><td>重置密码：</td><td>
    <asp:TextBox ID="txtPwds" runat="server"></asp:TextBox>
    </td></tr>
<tr><td>Email地址：</td><td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </td></tr>
<tr><td>是否禁用：</td><td>
    <asp:CheckBox ID="cbIs" runat="server" />
    </td></tr>
<tr><td></td><td>
    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/images/baocun.bmp" onclick="ImageButton1_Click" />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/images/fanhui.bmp" onclick="ImageButton2_Click" />
    </td></tr>
</table>

</div>

    </div>
</asp:Content>

