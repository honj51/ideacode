<%@ Page Language="C#" AutoEventWireup="true" CodeFile="operatortest.aspx.cs" Inherits="operatortest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                客服表<asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
                </asp:Timer>
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="157px" Width="731px">
                    <Columns>
                        <asp:BoundField DataField="OperatorId" HeaderText="OperatorId" 
                    SortExpression="OperatorId" />
                        <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                    SortExpression="AccountId" />
                        <asp:BoundField DataField="LoginName" HeaderText="LoginName" 
                    SortExpression="LoginName" />
                        <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                        <asp:BoundField DataField="NickName" HeaderText="NickName" 
                    SortExpression="NickName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="OperatorSession" HeaderText="OperatorSession" 
                    SortExpression="OperatorSession" />
                        <asp:BoundField DataField="AVChatStatus" HeaderText="AVChatStatus" 
                    SortExpression="AVChatStatus" />
                        <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" 
                    SortExpression="IsAdmin" />
                        <asp:BoundField DataField="HeartBeatTime" HeaderText="HeartBeatTime" 
                    SortExpression="HeartBeatTime" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" >
                    <Columns>
                        <asp:BoundField DataField="ChatId" HeaderText="ChatId" 
                    SortExpression="ChatId" />
                        <asp:BoundField DataField="CreateBy" HeaderText="CreateBy" 
                    SortExpression="CreateBy" />
                        <asp:BoundField DataField="CloseBy" HeaderText="CloseBy" 
                    SortExpression="CloseBy" />
                        <asp:BoundField DataField="CreateTime" HeaderText="CreateTime" 
                    SortExpression="CreateTime" />
                        <asp:BoundField DataField="AcceptTime" HeaderText="AcceptTime" 
                    SortExpression="AcceptTime" />
                        <asp:BoundField DataField="CloseTime" HeaderText="CloseTime" 
                    SortExpression="CloseTime" />
                        <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                    SortExpression="AccountId" />
                        <asp:BoundField DataField="VisitorId" HeaderText="VisitorId" 
                    SortExpression="VisitorId" />
                        <asp:BoundField DataField="OperatorId" HeaderText="OperatorId" 
                    SortExpression="OperatorId" />
                        <asp:CheckBoxField DataField="IsInviteByOperator" 
                    HeaderText="IsInviteByOperator" SortExpression="IsInviteByOperator" />
                        <asp:BoundField DataField="LastCheckTime" HeaderText="LastCheckTime" 
                    SortExpression="LastCheckTime" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource1" >
        <Columns>
            <asp:BoundField DataField="VisitorId" HeaderText="VisitorId" 
                SortExpression="VisitorId" />
            <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                SortExpression="AccountId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="VisitCount" HeaderText="VisitCount" 
                SortExpression="VisitCount" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
                SortExpression="Company" />
            <asp:BoundField DataField="Remark" HeaderText="Remark" 
                SortExpression="Remark" />
            <asp:CheckBoxField DataField="IsVIP" HeaderText="IsVIP" 
                SortExpression="IsVIP" />
            <asp:BoundField DataField="CurrentSessionId" HeaderText="CurrentSessionId" 
                ReadOnly="True" SortExpression="CurrentSessionId" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetAllVisitors" TypeName="VisitorService">
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource2">
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        SelectMethod="GetAllVisitSession" TypeName="VisitSessionService">
    </asp:ObjectDataSource>
    </form>
</body>
</html>

