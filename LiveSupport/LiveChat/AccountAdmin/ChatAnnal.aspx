<%@ Page Title="�ͷ�����-LiveSupport���߿ͷ�ϵͳ" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="ChatAnnal.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
 .Imgs{
	border:#999 1px solid;
	height:18px;
	background:url(Images/datePicker.gif) no-repeat right;
</style>
    <script src="JS/calenderJS.js" type="text/javascript"></script>
    <!--���ݿ�ʼ-->
   <!--����-->
   <table cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">�����¼��ѯ</td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
 


<table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center"> 
 <!--����-->
   <TABLE class=setting_tb cellSpacing=1 cellPadding=0 border=0 
        style="width: 560px">
  <TBODY>

  <TR id=tr_time>
    <TD class=setting_td_left vAlign=center align=right>�ͷ�ѡ��<asp:DropDownList 
            ID="ddlOperator" runat="server">
        </asp:DropDownList>
      &nbsp; ѡ��ʱ�䣺</TD>
    <TD class=setting_td_right vAlign=center align=left>
        <asp:TextBox ID="txtBeginDate" runat="server" Width="98px" CssClass="Imgs" onfocus="HS_setDate(this)"></asp:TextBox>
        ��<asp:TextBox ID="txtEndDate" runat="server" Width="98px" CssClass="Imgs" onfocus="HS_setDate(this)"></asp:TextBox>
&nbsp;<asp:Button ID="btnSelect" runat="server" Text="����" Width="64px" 
            onclick="btnSelect_Click" />
      </TD></TR></TBODY></TABLE>
<!--�����¼����-->
<table width="560">
<tr><td align="left" style=" background-color:#ebf1fa; height: 20px;"><b>�����¼</b> &gt;&gt;</td>
<tr><td align="left">
    <asp:GridView ID="GridViewChat" runat="server" Width="560px" 
        AutoGenerateColumns="False" onrowcommand="GridViewChat_RowCommand" 
        AllowPaging="True" CellPadding="4"
        onpageindexchanging="GridViewChat_PageIndexChanging" 
        onrowdatabound="GridViewChat_RowDataBound" Font-Size="13px" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ChatId" HeaderText="ID" SortExpression="ChatId" 
                Visible="False" />
            <asp:BoundField DataField="CreateBy" HeaderText="����Ự��" 
                SortExpression="CreateBy" />
            <asp:BoundField DataField="CloseBy" HeaderText="CloseBy" 
                SortExpression="CloseBy" Visible="False" />
            <asp:BoundField DataField="CreateTime" HeaderText="��ʼʱ��" 
                SortExpression="CreateTime" />
            <asp:BoundField DataField="AcceptTime" HeaderText="AcceptTime" 
                SortExpression="AcceptTime" Visible="False" />
            <asp:BoundField DataField="CloseTime" HeaderText="����ʱ��" 
                SortExpression="CloseTime" Visible="False" />
            <asp:TemplateField HeaderText="����ʱ��">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# this.DateCompare(Eval("CreateTime").ToString(),Eval

("CloseTime").ToString()) %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                SortExpression="AccountId" Visible="False" />
            <asp:BoundField DataField="VisitorId" HeaderText="VisitorId" 
                SortExpression="VisitorId" Visible="False" />
            <asp:BoundField DataField="OperatorId" HeaderText="OperatorId" 
                SortExpression="OperatorId" Visible="False" />
            <asp:TemplateField HeaderText="IP">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Vs.IP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="����λ��">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Vs.Location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    
                    <a href="ViewChatAnnal.aspx?chatId=<%# Eval("chatId") %>"><img alt="�鿴" src="Images/view.gif" 

/></a>
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ibtnImage" runat="server" AlternateText="ɾ��" CommandName="cmdDelete"  

CommandArgument='<%# Eval("chatId") %>' ImageUrl="~/AccountAdmin/Images/rubbish.gif" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetChatByOperatorId" TypeName="LiveSupport.BLL.ChatManager">
        <SelectParameters>
            <asp:QueryStringParameter Name="operatorId" QueryStringField="operatorId" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </td></tr>
</tr>
</table> 
  
 </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
</asp:Content>

 
 

