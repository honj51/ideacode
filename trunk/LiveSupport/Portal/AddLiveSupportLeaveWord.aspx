<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" AutoEventWireup="true" CodeFile="AddLiveSupportLeaveWord.aspx.cs" Inherits="AddLiveSupportLeaveWord" Title="无标题页" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 202px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table align="center" width="785px" border="1">
 <tr><td class="style1"></td><td colspan="2" align=left>
                    <font style="font-size:16px;">请发表您宝贵的意见</font></td></tr>
            <tr>
                <td align="right" class="style1" >
                    您的昵称：</td>
                <td align=left>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="昵称必填!"></asp:RequiredFieldValidator>
                </td>
                <td rowspan="5">
                    <asp:Image ID="Image1" runat="server" Height="95px" Width="85px" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    请选择头像：</td>
                <td align=left>
                    <asp:DropDownList ID="ddllPic" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddllPic_SelectedIndexChanged1">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    邮箱：</td>
                <td align=left>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    个人网站：</td>
                <td align=left>
                    <asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    QQ或MSN：</td>
                <td align=left>
                    <asp:TextBox ID="txtQQ" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr><td align="right" class="style1">表情：</td><td colspan="2" align=left>
                                <asp:RadioButton ID="Radio1" runat="server" Checked="True" GroupName="a1" />
                    <img  src="Imgs/face/face1.gif"/><asp:RadioButton ID="Radio2" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face2.gif" /><asp:RadioButton ID="Radio3" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face3.gif" /><asp:RadioButton ID="Radio4" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face4.gif" /><asp:RadioButton ID="Radio5" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face5.gif" /><asp:RadioButton ID="Radio6" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face6.gif" /><asp:RadioButton ID="Radio7" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face7.gif" /><asp:RadioButton ID="Radio8" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face8.gif" /><asp:RadioButton ID="Radio9" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face9.gif" /><asp:RadioButton ID="Radio10" runat="server" 
                        GroupName="a1" />
                    <img src="Imgs/face/face10.gif" /><br />
                    <asp:RadioButton ID="Radio11" runat="server" GroupName="a1" />
                    <img src="Imgs/face/face11.gif" /><asp:RadioButton ID="Radio12" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face12.gif" /><asp:RadioButton ID="Radio13" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face13.gif" /><asp:RadioButton ID="Radio14" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face14.gif" /><asp:RadioButton ID="Radio15" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face15.gif" /><asp:RadioButton ID="Radio16" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face16.gif" /><asp:RadioButton ID="Radio17" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face17.gif" /><asp:RadioButton ID="Radio18" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face18.gif" /><asp:RadioButton ID="Radio19" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face19.gif" /><asp:RadioButton ID="Radio20" 
                        runat="server" GroupName="a1" />
                    <img src="Imgs/face/face20.gif" />
            </td></tr>
            <tr><td align="right" class="style1">留言内容：</td><td colspan="2" align=left>

                <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="FCKeditor/" ToolbarSet="Basic">
                </FCKeditorV2:FCKeditor>
                </td></tr>
            <tr><td class="style1"></td><td colspan="2" align=left>
                    <asp:Button ID="Button1" runat="server" Text="发表留言" Width="78px" 
                        onclick="Button1_Click1" style="height: 26px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="悄悄话" />
                </td></tr>
        </table>
    
    </div>
        </asp:Content>

