<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentManager.aspx.cs" Inherits="Default2" Title="�ͷ�����-���Ź���" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <center style="">
   <img src="Images/bg3.jpg" style="width: 765px" />
   <table style="width:765px;" >
   <tr>
 <!--Left-->
 <td valign="top">
<div><img src="Images/left_12.gif" /></div>
<!--����-->
<div style="height: 180px; background-image:url('Images/zhongjian.bmp'); ">
<LINK href="Images/sdmenu.css" type=text/css rel=stylesheet>
<SCRIPT src="Images/sdmenu.js" type="text/javascript">
</SCRIPT>
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
			
		};
	</SCRIPT>
<DIV class=sdmenu id=my_menu> 

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">��������</SPAN> 
<A href="AccountHome.aspx" >��˾��Ϣ</A>
<A href="UpdateAccount.aspx" >��˾�˺Ź���</A>

</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�ͷ�����</SPAN> 
<A href="DepartmentManager.aspx">��������</A> 
<A href="OperatorsManagment.aspx" >�ͷ�����</A> 
 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�������</SPAN> 
 
<A href="GetCode.aspx">��ȡ��������</A> 
<A href="#">����������</A> 
 
<A href="#">�Ի���ʾ����</A> 
<A href="#">������������</A>
 
</DIV>

<DIV class=collapsed><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">���ݷ��� (New)</SPAN> 
<A href="#">����ͳ�� </A>
<A href="#">��ѯ��ͳ��</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�����¼</SPAN> 
<A href="ChatAnnal.aspx">�����¼ </A> <A href="#">�ÿ�����</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�ͻ�����</SPAN> 
<A href="#">��ӿͻ�</A> 
<A href="#">�ͻ��б�</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">��ѵ绰����</SPAN> 
<A onclick="return open_url('#')" href="#">��ѵ绰����</A> 
<A onclick="return open_url('#')" href="#">���ù�˾��ѵ绰</A> 
</DIV> 
&nbsp;</DIV>
</div>
</div>
<!--��������-->
<div><img src="Images/abc.bmp" /></div>
 
   </td>
<!--right-->
<td style="width: 583px;" valign="top">
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     ��˾���Ź���</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
           <!--ͷ��--->
                <!--β��-->
<br />
           <asp:GridView ID="gvDepartment" runat="server"
               AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
               GridLines="None" Width="359px" AllowPaging="True" 
               DataSourceID="ObjectDataSource1" 
               onrowdatabound="gvDepartment_RowDataBound" DataKeyNames="DepartmentId" 
               onrowcommand="gvDepartment_RowCommand" onrowediting="gvDepartment_RowEditing" >
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
                   <asp:TemplateField HeaderText="��˾����">
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("Account.CompanyName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="DepartmentName" HeaderText="��������" 
                       SortExpression="DepartmentName" />
                   <asp:TemplateField HeaderText="�޸�" Visible="False">
                       <ItemTemplate>
                           <asp:ImageButton ID="ImageButtonEdit" runat="server"  
                               ImageUrl="~/Images/edit_icon.gif" CommandName="edit" />
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:CommandField ShowEditButton="True" EditImageUrl="~/Images/edit_icon.gif" />
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
               UpdateMethod="UpdateDepartmentById">
               <UpdateParameters>
                   <asp:Parameter Name="departmentId" Type="String" />
                   <asp:Parameter Name="DepartmentName" Type="String" />
               </UpdateParameters>
               <SelectParameters>
                   <asp:QueryStringParameter DefaultValue="" Name="AccountId" 
                       QueryStringField="AccountId" Type="String" />
               </SelectParameters>
           </asp:ObjectDataSource>
          
           <a href="AddDepartment.aspx" style="font-size:16px;">��Ӳ���</a>
           <br />
           <br />
           </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</td></tr>
   </table>
   </center>
</asp:Content>
