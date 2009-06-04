<%@ Page Language="C#" AutoEventWireup="true" CodeFile="operatortest.aspx.cs" Inherits="operatortest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 698px">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource1" Height="157px" Width="698px">
            <Columns>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
                <asp:BoundField DataField="AVChatStatus" HeaderText="AVChatStatus" 
                    SortExpression="AVChatStatus" />
                <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" 
                    SortExpression="IsAdmin" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetAllOperators" TypeName="OperatorService">
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

