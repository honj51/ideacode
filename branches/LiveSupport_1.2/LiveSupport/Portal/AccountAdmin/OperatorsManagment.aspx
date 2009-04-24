﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorsManagment.aspx.cs" Inherits="AccountAdmin_OperatorsManangment" Title="坐席管理" %>

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
            &#24403;&#21069;&#22352;&#24109;&#36134;&#25143;&#21015;&#34920;:<br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" onrowcommand="GridView1_RowCommand" 
                onrowdatabound="GridView1_RowDataBound" DataKeyNames="Id" 
                AutoGenerateColumns="False" Width="455px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Password" HeaderText="Password" 
                        SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="IsOnline" HeaderText="IsOnline" 
                        SortExpression="IsOnline" />
                    <asp:CheckBoxField DataField="Disabled" HeaderText="Disabled" 
                        SortExpression="Disabled" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            &#20462;&#25913;
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonEdit" runat="server" CommandName="cmdEdit" 
                                ImageUrl="~/images/edit_icon.gif" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            &#21024;&#38500;
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="cmdDelete" 
                                ImageUrl="~/images/ico_delete2.gif" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <a href="OperatorCreate.aspx">Create Operator</a>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" CommandArgument="cmdInsert" 
                CommandName="cmd" 
                Text="&#22686;&#21152;&#22352;&#24109;" onclick="Button1_Click" />
        </div>
        <div id="content-side2-three-column">
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                onselecting="ObjectDataSource1_Selecting" 
                SelectMethod="FindOperatorsByAccountId" TypeName="LiveSupport.BLL.OperatorsManager" 
                DataObjectTypeName="LiveSupport.DAL.Entity.Operator" 
                UpdateMethod="UpdateOperator">
                <SelectParameters>
                    <asp:QueryStringParameter Name="accountId" QueryStringField="accountId" 
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="accountId" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>

