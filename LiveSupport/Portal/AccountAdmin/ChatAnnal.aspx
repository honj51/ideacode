<%@ Page Title="�鿴���ʼ�¼" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="ChatAnnal.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
<SCRIPT type="text/javascript">
    // <![CDATA[
    var myMenu;
    window.onload = function() {
        myMenu = new SDMenu("my_menu");
        //myMenu.remember = true
        myMenu.oneSmOnly = true;
        myMenu.init();
        var firstSubmenu = myMenu.submenus[4];
        myMenu.expandMenu(firstSubmenu);

    };</SCRIPT>
<script src="../js/My97DatePicker/WdatePicker.js"></script>
    <!--���ݿ�ʼ-->
   <!--����-->
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
          �����¼��ѯ </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
  <!--����-->
   <TABLE class=setting_tb cellSpacing=1 cellPadding=0 border=0 
        style="width: 570px">
  <TBODY>
  <TR>
    <TD class=setting_td_top vAlign=center align=left colSpan=2>&nbsp;</TD></TR>
  <TR id=tr_time>
    <TD class=setting_td_left vAlign=center align=right>�ͷ�ѡ��<asp:DropDownList 
            ID="ddlOperator" runat="server">
        </asp:DropDownList>
      &nbsp; ѡ��ʱ�䣺</TD>
    <TD class=setting_td_right vAlign=center align=left>
        <asp:TextBox ID="txtBeginDate" runat="server" Width="98px" CssClass="Wdate" onFocus="new WdatePicker

(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
        ��<asp:TextBox ID="txtEndDate" runat="server" Width="98px" CssClass="Wdate" onFocus="new WdatePicker

(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
&nbsp;<asp:Button ID="btnSelect" runat="server" Text="����" Width="64px" 
            onclick="btnSelect_Click" />
      </TD></TR></TBODY></TABLE>
<!--�����¼����-->
<table width="570">
<tr><td align="left" style=" background-color:#ebf1fa; height: 36px;">�����¼ &gt;&gt;</td>
<tr><td align="left">
    <asp:GridView ID="GridViewChat" runat="server" Width="563px" 
        AutoGenerateColumns="False" onrowcommand="GridViewChat_RowCommand" 
        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="3"
        onpageindexchanging="GridViewChat_PageIndexChanging" 
        onrowdatabound="GridViewChat_RowDataBound" Font-Size="12px">
        <RowStyle BackColor="#E3EAEB" />
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
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
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
  <!--���ݽ���-->
  </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>



</asp:Content>

 
 
