<%@ Page Title="�ͷ�����-LiveSupport���߿ͷ�ϵͳ" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="DepartmentManager.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
  <table cellpadding="0" cellspacing="0">
    <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
    <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">��˾���Ź���</td></tr>
    <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
  </table>
 
 <table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center" align="center"> 
 
  <br />
           <asp:GridView ID="gvDepartment" runat="server"
               AutoGenerateColumns="False" Width="522px" AllowPaging="True" 
               DataSourceID="ObjectDataSource1" 
               onrowdatabound="gvDepartment_RowDataBound" DataKeyNames="DepartmentId" 
               onrowcommand="gvDepartment_RowCommand" 
               onrowediting="gvDepartment_RowEditing" 
               onrowupdating="gvDepartment_RowUpdating" 
               ondatabound="gvDepartment_DataBound" Font-Size="13px" CellPadding="4" 
               ForeColor="#333333" GridLines="None" >
               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <RowStyle BackColor="#EFF3FB" />
               <Columns>
                   <asp:TemplateField HeaderText="���ű��" SortExpression="DepartmentId" 
                       Visible="False">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblCompanyName" runat="server" 
                               Text='<%# Bind("DepartmentId") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="��˾ID" Visible="False">
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("Account.AccountId") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="��˾����">
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("Account.CompanyName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="DepartmentName" HeaderText="��������" 
                       SortExpression="DepartmentName" />
                   <asp:TemplateField HeaderText="�޸�">
                       <ItemTemplate>
                           <asp:ImageButton ID="ImageButtonEdit" runat="server" 
                               ImageUrl="~/Images/edit_icon.gif" CommandName="edit" />
                       </ItemTemplate>
                       <EditItemTemplate>
                           <asp:Button ID="Button1" runat="server" CommandName="update" Text="����" 
                               CommandArgument='<%# Bind("DepartmentId") %>' /><asp:Button ID="Button2" runat="server" CommandName="cancel" Text="ȡ��" />
                       </EditItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="ɾ��">
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
          <asp:Button ID="Button3" runat="server" Text="���ӷ���" OnClick="Button3_Click" />
           <br />
     
           <br />
 </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
</asp:Content>

 

