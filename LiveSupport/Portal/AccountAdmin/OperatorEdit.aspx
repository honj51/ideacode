<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorEdit.aspx.cs" Inherits="AccountAdmin_OperatorEdit" Title="&#26080;&#26631;&#39064;&#39029;" %>

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
<A href="#">聊天记录</A> <A href="#">访客留言</A> 
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
     客服信息管理</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px; ">
    <!--头部--->
    <div style="text-align:left; margin-left:60px; margin-top:50px;">
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
        </div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DataObjectTypeName="LiveSupport.LiveSupportModel.Operator" SelectMethod="GetOperatorByOperatorId" 
                TypeName="LiveSupport.BLL.OperatorsManager" UpdateMethod="UpdateOperator" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="operatorId" QueryStringField="operatorId" 
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
 <!--尾部-->
 </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</td></tr>
   </table>
   </center>
</asp:Content>
