<%@ Page Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="DomainName.aspx.cs" Inherits="AccountAdmin_Default3" Title="客服中心-LiveSupport在线客服系统"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--内容-->

 <table cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">
       域名管理</td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
 
<div></div>
 <table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center"> 
  <div style="text-align:left;color: #cccccc; border-bottom: 1px solid; position: relative;">&nbsp;&nbsp;&nbsp; 
      所有域名：</div>
  <!--内容-->
  <TABLE cellSpacing=0 cellPadding=0 border=0 style=" margin-left:2px;">
        <TBODY style="text-align:center;">
        <tr><td align="left" >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  Width="561px" 
                AllowPaging="True" DataKeyNames="DomainName" 
                onrowdatabound="GridView1_RowDataBound" >
                <Columns>
                    <asp:TemplateField HeaderText="公司" SortExpression="RegisterId">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# cutString(getAccountName((Eval("RegisterId")).ToString()),6) %>' ToolTip='<%# getAccountName((Eval("RegisterId")).ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="域名" SortExpression="DomainName">
                        <ItemTemplate>
                            <a  href="http://<%# Eval("DomainName") %>"><asp:Label ID="Label2" runat="server" Text='<%# cutString((Eval("DomainName")).ToString(),14) %>' ToolTip='<%# Eval("DomainName") %>' ></asp:Label></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="图片样式" SortExpression="IconStyle">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="25px" Width="70px" ImageUrl= '<%# showImage(1 ,(Eval("DomainName")).ToString() ,(Eval("IconStyle")).ToString()) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="主动邀请" SortExpression="InviteStyle">
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" Height="25px" Width="70px"  ImageUrl= '<%# showImage(2 ,(Eval("DomainName")).ToString(),(Eval("InviteStyle")).ToString()) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="对话窗口" SortExpression="ChatStyle">
                        <ItemTemplate>
                            <asp:Image ID="Image3" runat="server" Height="25px" Width="70px" ImageUrl= '<%# showImage(3 ,(Eval("DomainName")).ToString(),(Eval("ChatStyle")).ToString()) %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="显示的位置" SortExpression="IcoLocation">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# getIcoLocation((Eval("IcoLocation")).ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFormatString="GetCode.aspx?domain={0}" 
                     Text="编辑"  DataNavigateUrlFields="DomainName"/>
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                SelectMethod="GetAllWebSiteByRegisterId" 
                TypeName="LiveSupport.BLL.WebSiteManager" DeleteMethod="Delete">
                <DeleteParameters>
                    <asp:Parameter Name="domainName" Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="op" SessionField="User" Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
<div style=" text-align:center;"><asp:Button ID="Button1" runat="server" 
        Text="添加域名" onclick="Button1_Click"/></div>
            </td></tr>
        </TBODY></TABLE>
 </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
</asp:Content>

