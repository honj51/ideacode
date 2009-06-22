<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAccount.aspx.cs" Inherits="AdminManager_ViewAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
 
 <table width="100%" cellpadding="0" cellspacing="0">
<tr><td style=" background-color:#0AAFDD; color:#ffffff; width:100%; height:32px;">&nbsp; <b>文 章 管 理</b></td></tr>
<tr><td style=" background-color:#BCE0FF; height:27px;">&nbsp;&nbsp;<a href="../Register.aspx" target="_blank">添加新的信息</a> | <a href="AccountManager.aspx" target="fraMain">现有信息查看</a>
<br />
                &nbsp;</td></tr>
</table><br />
 <table width="100%" cellpadding="0" cellspacing="0">
  <tr><td style="background-color:#BCE0FF;font-weight:bold;  width:100%; height:32px;">&nbsp;公 司 信 息</td></tr>
  </table>
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="560px" 
            AutoGenerateRows="False" CellPadding="4" DataSourceID="ObjectDataSource1" 
            ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                    SortExpression="AccountId" Visible="False" />
                <asp:BoundField DataField="AccountNumber" HeaderText="公司ID" 
                    SortExpression="AccountNumber" />
                <asp:BoundField DataField="CompanyName" HeaderText="公司名称" 
                    SortExpression="CompanyName" />
                <asp:BoundField DataField="Industry" HeaderText="行业类别" 
                    SortExpression="Industry" />
                <asp:BoundField DataField="Email" HeaderText="电子邮件" SortExpression="Email" />
                <asp:BoundField DataField="ContactName" HeaderText="联系人" 
                    SortExpression="ContactName" />
                <asp:BoundField DataField="Phone" HeaderText="联系方式" SortExpression="Phone" />
                <asp:BoundField DataField="Url" HeaderText="公司网址" SortExpression="Url" />
                
                <asp:BoundField DataField="Domain" HeaderText="Domain" 
                    SortExpression="Domain" Visible="False" />
                <asp:BoundField DataField="OperatorCount" HeaderText="客服数量" 
                    SortExpression="OperatorCount" />
                <asp:BoundField DataField="Province" HeaderText="省份" 
                    SortExpression="Province" />
                <asp:BoundField DataField="City" HeaderText="城市" SortExpression="City" />
                <asp:BoundField DataField="PaymentId" HeaderText="账号ID" 
                    SortExpression="PaymentId" />
                <asp:BoundField DataField="RegisterDate" HeaderText="注册时间" 
                    SortExpression="RegisterDate" />
                <asp:BoundField DataField="Remark" HeaderText="描述" SortExpression="Remark" />
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetAccountByAccountId" TypeName="LiveSupport.BLL.AccountsManager">
            <SelectParameters>
                <asp:QueryStringParameter Name="accountId" QueryStringField="aid" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
