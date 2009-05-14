<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorsManagment.aspx.cs" Inherits="AccountAdmin_OperatorsManangment" Title="坐席管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="pagetitle">&#22352;&#24109;&#31649;&#29702;</div>
    <div id="content-container-three-column" style="height: 568px;background-color:#CCCCCC;">
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
            &#24403;&#21069;&#22352;&#24109;&#36134;&#25143;&#21015;<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OperatorId" DataSourceID="ObjectDataSource1" 
                onrowcommand="GridView1_RowCommand" Width="487px" 
                onrowdatabound="GridView1_RowDataBound" AllowPaging="True" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField HeaderText="客服Id" SortExpression="OperatorId" 
                        Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OperatorId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOperatorId" runat="server" Text='<%# Bind("OperatorId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LoginName" HeaderText="客服账号" 
                        SortExpression="LoginName" />
                    <asp:BoundField DataField="Password" HeaderText="密码" 
                        SortExpression="Password" />
                    <asp:BoundField DataField="NickName" HeaderText="昵称" 
                        SortExpression="NickName" />
                    <asp:BoundField DataField="Email" HeaderText="电子邮件" SortExpression="Email" />
                    <asp:TemplateField HeaderText="状态" SortExpression="AVChatStatus" 
                        Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AVChatStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("AVChatStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="是否是管理员" SortExpression="IsAdmin" Visible="False">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsAdmin") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsAdmin") %>' 
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonEdit" runat="server" CommandArgument="OperatorId" 
                                CommandName="cmdEdit" ImageUrl="~/Images/edit_icon.gif" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="cmdDelete" 
                                ImageUrl="~/Images/ico_delete2.gif" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DataObjectTypeName="LiveSupport.LiveSupportModel.Operator" 
                DeleteMethod="DeleteOperatorByid" InsertMethod="NewOperator" 
                onselecting="ObjectDataSource1_Selecting" SelectMethod="GetOperatorByAccountId" 
                TypeName="LiveSupport.BLL.OperatorsManager">
                <DeleteParameters>
                    <asp:Parameter Name="operatorId" Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="accountId" QueryStringField="accountId" 
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
           
            <br />
            <asp:Button ID="Button1" runat="server" CommandArgument="cmdInsert" 
                CommandName="cmd" 
                Text="&#22686;&#21152;&#22352;&#24109;" onclick="Button1_Click" />
            <br />
        </div>
        <div id="content-side2-three-column">
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>

