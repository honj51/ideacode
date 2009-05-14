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
        <div id="content-main-three-column" style="height: 410px">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                DataSourceID="ObjectDataSource1" DefaultMode="Edit" Height="50px" 
                Width="368px" 
                onitemcommand="DetailsView1_ItemCommand" 
                onitemupdated="DetailsView1_ItemUpdated" DataKeyNames="OperatorId">
                <Fields>
                    <asp:BoundField DataField="OperatorId" HeaderText="客服编号" 
                        SortExpression="OperatorId" ReadOnly="True" >
                    </asp:BoundField>
                    <asp:BoundField DataField="AccountId" HeaderText="公司编号" 
                        SortExpression="AccountId" ReadOnly="True" />
<asp:BoundField DataField="LoginName" HeaderText="客服账号" SortExpression="LoginName"></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="&#23494;&#30721;" 
                        SortExpression="Password" />
                    <asp:BoundField DataField="NickName" HeaderText="昵称" 
                        SortExpression="NickName" />
                    <asp:BoundField DataField="Email" HeaderText="电子邮件" SortExpression="Email" />
                    <asp:BoundField DataField="AVChatStatus" HeaderText="音频状态" 
                        SortExpression="AVChatStatus" Visible="False" />
                    
                    <asp:CommandField ShowEditButton="True" />
                    
                </Fields>
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DataObjectTypeName="LiveSupport.LiveSupportModel.Operator" SelectMethod="GetOperatorByOperatorId" 
                TypeName="LiveSupport.BLL.OperatorsManager" UpdateMethod="UpdateOperator" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="operatorId" QueryStringField="operatorId" 
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

