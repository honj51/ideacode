<%@ Page Title="客服管理" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorsManagment.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
<SCRIPT type="text/javascript">
		// <![CDATA[
		var myMenu;
		window.onload = function() {
			myMenu = new SDMenu("my_menu");
			//myMenu.remember = true
			myMenu.oneSmOnly = true;  
			myMenu.init();
			var firstSubmenu = myMenu.submenus[1];
			myMenu.expandMenu(firstSubmenu);  
			
		};</SCRIPT>
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     客服管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
           <!--头部--->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OperatorId" DataSourceID="ObjectDataSource1" 
                onrowcommand="GridView1_RowCommand" Width="549px" 
                onrowdatabound="GridView1_RowDataBound" AllowPaging="True" 
               Font-Size="14px">
                <Columns>
                    <asp:TemplateField HeaderText="部门">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Department.DepartmentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                        SortExpression="Password" Visible="False" />
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

            <asp:Button ID="Button1" runat="server" CommandArgument="cmdInsert" 
                CommandName="cmd" 
                Text="&#22686;&#21152;&#22352;&#24109;" onclick="Button1_Click" />
                <!--尾部-->
           </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</asp:Content>

 
 

