<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" Title="�ޱ���ҳ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="height: 606px">
<div style="text-align:center;">
<img src="images/banner_4.jpg" style="width: 760px; height: 151px;" />
</div>
<table cellSpacing="0" cellPadding="0" style="height: 466px; ">
<tr><td style="width: 160px; background-image:url('images/left.jpg');" 
        valign="top">
<!--leftMenu-->
<DIV id=column style="margin-top:30px;">
    </DIV>
    
    
    </td>
    <td style="width: 23px; ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="width: 580px;" valign="top"><div style="text-align:left; margin-top:10px;"><img src="images/register.gif" /></div>
    <!--�û���¼--->
    <div style="margin-top:50px;">
        <table border="0" cellpadding="0" style="width:290px; font-size:14px;">
            <tr>
                <td align="center">
                    �û���¼</td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server">�û���:</asp:Label>
                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Width="106px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                        ControlToValidate="UserName" ErrorMessage="������д���û�������" ToolTip="������д���û�������" 
                        ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">��&nbsp;&nbsp;��:</asp:Label>
                    <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" 
                        Width="106px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                        ControlToValidate="Password" ErrorMessage="������д�����롱��" ToolTip="������д�����롱��" 
                        ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td align="center" style="color:Red;">
                    <asp:Button ID="LoginButton" runat="server" BackColor="White" 
                        BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                        Font-Names="Verdana" Font-Size="10pt" ForeColor="#1C5E55" Height="20px"  
                        Text="��¼" ValidationGroup="Login1" Width="55px" onclick="LoginButton_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Licence.aspx">ע�����û�</asp:HyperLink>
                </td>
            </tr>
        </table>
        </div>
    </td></tr>
</table>

</center>
</asp:Content>

