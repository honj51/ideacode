<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorEdit.aspx.cs" Inherits="AccountAdmin_OperatorEdit" Title="&#26080;&#26631;&#39064;&#39029;" %>

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
                DataSourceID="ObjectDataSource1" DefaultMode="Edit" Height="50px" 
                Width="125px" DataKeyNames="Id,AccountId" 
                onitemcommand="DetailsView1_ItemCommand" 
                onitemupdated="DetailsView1_ItemUpdated">
                <Fields>
                    <asp:BoundField DataField="Name" HeaderText="&#23458;&#26381;&#29992;&#25143;&#21517;" SortExpression="Name" >
                        <HeaderStyle HorizontalAlign="Justify" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="&#23494;&#30721;" 
                        SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email&#22320;&#22336;" SortExpression="Email" />
                    <asp:CheckBoxField DataField="Disabled" HeaderText="&#26159;&#21542;&#31105;&#29992;" 
                        SortExpression="Disabled" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                        SortExpression="AccountId" Visible="False" />
                </Fields>
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DataObjectTypeName="LiveSupport.DAL.Entity.Operator" SelectMethod="GetOperatorById" 
                TypeName="LiveSupport.BLL.OperatorsManager" UpdateMethod="UpdateOperator" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="operatorId" QueryStringField="operatorId" 
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

