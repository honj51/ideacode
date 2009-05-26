<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorsManagment.aspx.cs" Inherits="AccountAdmin_OperatorsManangment" Title="客服中心-客服管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
   <center style="">
   <img src="Images/bg3.jpg" style="width: 765px" />
   <table style="width:765px;" >
   <tr>
 <!--Left-->
 <td valign="top">
<div><img src="Images/left_12.gif" /></div>
<!--导航-->
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

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">基本设置</SPAN> 
<A href="AccountHome.aspx" >公司信息</A>
<A href="UpdateAccount.aspx" >公司账号管理</A>

</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客服管理</SPAN> 
<A href="DepartmentManager.aspx">部门设置</A> 
<A href="OperatorsManagment.aspx" >客服管理</A> 
 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">风格设置</SPAN> 
 
<A href="GetCode.aspx">获取代码设置</A> 
<A href="#">界面风格设置</A> 
 
<A href="#">对话提示设置</A> 
<A href="#">主动发起设置</A>
 
</DIV>

<DIV class=collapsed><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">数据分析 (New)</SPAN> 
<A href="#">流量统计 </A>
<A href="#">咨询量统计</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">聊天记录</SPAN> 
<A href="ChatAnnal.aspx">聊天记录 </A> <A href="#">访客留言</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客户管理</SPAN> 
<A href="#">添加客户</A> 
<A href="#">客户列表</A> 
 
 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">免费电话管理</SPAN> 
<A onclick="return open_url('#')" href="#">免费电话管理</A> 
<A onclick="return open_url('#')" href="#">设置公司免费电话</A> 
</DIV> 
&nbsp;</DIV>
</div>
</div>
<!--导航结束-->
<div><img src="Images/abc.bmp" /></div>
 
   </td>
<!--right-->
<td style="width: 583px;" valign="top">
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     客服管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;">
           <!--头部--->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OperatorId" DataSourceID="ObjectDataSource1" 
                onrowcommand="GridView1_RowCommand" Width="487px" 
                onrowdatabound="GridView1_RowDataBound" AllowPaging="True" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
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
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
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
</td></tr>
   </table>
   </center>
</asp:Content>


