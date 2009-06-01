<%@ Page Title="部门管理" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentManager.aspx.cs" Inherits="AccountAdmin_Default3" %>

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
     公司部门管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
           <!--头部--->
                <!--尾部-->
<br />
           <asp:GridView ID="gvDepartment" runat="server"
               AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
               GridLines="None" Width="455px" AllowPaging="True" 
               DataSourceID="ObjectDataSource1" 
               onrowdatabound="gvDepartment_RowDataBound" DataKeyNames="DepartmentId" 
               onrowcommand="gvDepartment_RowCommand" 
               onrowediting="gvDepartment_RowEditing" 
               onrowupdating="gvDepartment_RowUpdating" 
               ondatabound="gvDepartment_DataBound" >
               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <RowStyle BackColor="#EFF3FB" />
               <Columns>
                   <asp:TemplateField HeaderText="部门编号" SortExpression="DepartmentId" 
                       Visible="False">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblCompanyName" runat="server" 
                               Text='<%# Bind("DepartmentId") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="公司ID" Visible="False">
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("Account.AccountId") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="公司名称">
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("Account.CompanyName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="DepartmentName" HeaderText="部门名称" 
                       SortExpression="DepartmentName" />
                   <asp:TemplateField HeaderText="修改">
                       <ItemTemplate>
                           <asp:ImageButton ID="ImageButtonEdit" runat="server" 
                               ImageUrl="~/Images/edit_icon.gif" CommandName="edit" />
                       </ItemTemplate>
                       <EditItemTemplate>
                           <asp:Button ID="Button1" runat="server" CommandName="update" Text="更新" 
                               CommandArgument='<%# Bind("DepartmentId") %>' /><asp:Button ID="Button2" runat="server" CommandName="cancel" Text="取消" />
                       </EditItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="删除">
                       <ItemTemplate>
                           <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="cmdDelete" 
                               ImageUrl="~/Images/ico_delete2.gif" />
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <EditRowStyle BackColor="#2461BF" />
               <AlternatingRowStyle BackColor="White" />
           </asp:GridView>
          <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
               onselecting="ObjectDataSource1_Selecting" 
               SelectMethod="GetDepartmentByAccountId" 
               TypeName="LiveSupport.BLL.DepartmentManager" 
               UpdateMethod="UpdateDepartmentById" 
               onupdating="ObjectDataSource1_Updating">
               <UpdateParameters>
                   <asp:Parameter Name="accountId" Type="String" />
                   <asp:Parameter Name="departmentId" Type="String" />
                   <asp:Parameter Name="DepartmentName" Type="String" />
               </UpdateParameters>
               <SelectParameters>
                   <asp:QueryStringParameter DefaultValue="" Name="AccountId" 
                       QueryStringField="AccountId" Type="String" />
               </SelectParameters>
           </asp:ObjectDataSource>
          
           <a href="AddDepartment.aspx" style="font-size:16px;">添加部门</a>
           <br />
           <br />
           </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</asp:Content>

