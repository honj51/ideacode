<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorCreate.aspx.cs" Inherits="AccountAdmin_OperatorCreate" Title="&#26080;&#26631;&#39064;&#39029;" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="pagetitle">&#22352;&#24109;&#31649;&#29702;</div>
    <div id="content-container-three-column">
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

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" 
        GridLines="None" Height="50px" Width="125px" DefaultMode="Edit" 
                onpageindexchanging="DetailsView1_PageIndexChanging" 
                oniteminserting="DetailsView1_ItemInserting" 
                oniteminserted="DetailsView1_ItemInserted" 
                onitemupdated="DetailsView1_ItemUpdated">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="&#22352;&#24109;&#29992;&#25143;&#21517;" SortExpression="Name" />
            <asp:BoundField DataField="Password" HeaderText="&#23494;&#30721;" 
                SortExpression="Password" />
            <asp:BoundField DataField="Email" HeaderText="Email&#22320;&#22336;" SortExpression="Email" />
            <asp:CheckBoxField DataField="Disabled" HeaderText="&#26159;&#21542;&#31105;&#29992;" 
                SortExpression="Disabled" />
            <asp:CommandField ShowInsertButton="True" ShowEditButton="True" />
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        onselecting="ObjectDataSource1_Selecting" SelectMethod="FindOperatorsByAccountId" 
        TypeName="LiveSupport.BLL.OperatorsManager" DataObjectTypeName="LiveSupport.DAL.Entity.Operator" 
                InsertMethod="InsertOperator" UpdateMethod="UpdateOperator">
                
        <SelectParameters>
            <asp:QueryStringParameter Name="accountId" QueryStringField="accountId" 
                Type="Int32" />
        </SelectParameters>
        
    </asp:ObjectDataSource>
</div>

    </div>
</asp:Content>

