<%@ Page Language="C#" AutoEventWireup="true" CodeFile="operatortest.aspx.cs" Inherits="operatortest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            font-family: 宋体, Arial, Helvetica, sans-serif;
            font-size: large;
            color: #003366;
        }
        #Text1
        {
            width: 172px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
            <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
                </asp:Timer>
                系统状态<br />
                <table style="width:100%;">
                    <tr>
                        <td >
                            程序起动时间</td>
                        <td>
                            新建会话时间</td>
                        <td>
                            程序中断的时间</td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <input ID="Text1" type="text" /></td>
                    </tr>
                </table>
                <span class="style2"><b>
                客服表: </b></span>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="157px" 
                    Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="3">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:TemplateField HeaderText="客服ID" SortExpression="OperatorId">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# cutString((Eval("OperatorId")).ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="公司" SortExpression="AccountId">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# getAccountName((Eval("AccountId")).ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NickName" HeaderText="昵称" 
                    SortExpression="NickName" />
                        <asp:BoundField DataField="Email" HeaderText="邮件" SortExpression="Email" />
                        <asp:BoundField DataField="OperatorSession" HeaderText="OperatorSession" 
                    SortExpression="OperatorSession" />
                        <asp:BoundField DataField="AVChatStatus" HeaderText="视频状态" 
                    SortExpression="AVChatStatus" />
                        <asp:BoundField DataField="HeartBeatTime" HeaderText="心跳时间" 
                    SortExpression="HeartBeatTime" />
                        <asp:BoundField DataField="Status" HeaderText="客服状态" 
                    SortExpression="Status" />
                        <asp:CheckBoxField DataField="IsAdmin" HeaderText="是否管理员" 
                    SortExpression="IsAdmin" />
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" Width="100%" >
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                    <asp:TemplateField HeaderText="对话ID" SortExpression="OperatorId">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# cutString((Eval("ChatId")).ToString()) %>'></asp:Label>
                            </ItemTemplate>
                     </asp:TemplateField>
                        <asp:BoundField DataField="CreateBy" HeaderText="创建者" 
                    SortExpression="CreateBy" />
                        <asp:BoundField DataField="CloseBy" HeaderText="关闭者" 
                    SortExpression="CloseBy" />
                        <asp:BoundField DataField="CreateTime" HeaderText="创建时间" 
                    SortExpression="CreateTime" />
                        <asp:BoundField DataField="AcceptTime" HeaderText="接爱时间" 
                    SortExpression="AcceptTime" />
                        <asp:BoundField DataField="CloseTime" HeaderText="关闭时间" 
                    SortExpression="CloseTime" />
                        <asp:BoundField DataField="AccountId" HeaderText="公司ID" 
                    SortExpression="AccountId" />
                        <asp:BoundField DataField="VisitorId" HeaderText="访客ID" 
                    SortExpression="VisitorId" />
                        <asp:BoundField DataField="OperatorId" HeaderText="客服ID" 
                    SortExpression="OperatorId" />
                        <asp:CheckBoxField DataField="IsInviteByOperator" 
                    HeaderText="是否主动邀请" SortExpression="IsInviteByOperator" />
                        <asp:BoundField DataField="LastCheckTime" HeaderText="LastCheckTime" 
                    SortExpression="LastCheckTime" />
                        <asp:BoundField DataField="Status" HeaderText="状态" 
                    SortExpression="Status" />
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource1" Width="100%" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:BoundField DataField="VisitorId" HeaderText="访客ID" 
                SortExpression="VisitorId" />
            <asp:BoundField DataField="AccountId" HeaderText="公司ID" 
                SortExpression="AccountId" />
            <asp:BoundField DataField="Name" HeaderText="公司名" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="邮件" SortExpression="Email" />
            <asp:BoundField DataField="VisitCount" HeaderText="访问次数" 
                SortExpression="VisitCount" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
                SortExpression="Company" />
            <asp:CheckBoxField DataField="IsVIP" HeaderText="是否VIP" 
                SortExpression="IsVIP" />
            <asp:BoundField DataField="CurrentSessionId" HeaderText="CurrentSessionId" 
                SortExpression="CurrentSessionId" ReadOnly="True" />
        </Columns>
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetAllVisitors" TypeName="VisitorService">
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource2" Width="100%" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        SelectMethod="GetAllVisitSession" TypeName="VisitSessionService">
    </asp:ObjectDataSource>
    </form>
</body>
<script type="text/javascript" language="javascript">
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function EndRequestHandler(sender, args)
{
   if (args.get_error() != undefined)
   {
       if ((args.get_response().get_statusCode() == '12007') || (args.get_response().get_statusCode() == '12029'))
       {
        
        document.getElementById("Text1").value=new Date().getTime();
        args.set_errorHandled(true); 
       }
   }
}
</script>
</html>

