<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChatAnnal.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"charset="gb2312"></script>
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
			var firstSubmenu = myMenu.submenus[4];
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
<A href="ChatAnnal.aspx">聊天记录 </A>
 <A href="#">访客留言</A> 
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
    <!--内容开始-->
    <TABLE class=setting_tb cellSpacing=1 cellPadding=0 border=0 
        style="width: 570px">
  <TBODY>
  <TR>
    <TD class=setting_td_top vAlign=center align=left colSpan=2>聊天记录查询 &gt;&gt;</TD></TR>
  <TR>
    <TD class=setting_td_left vAlign=center align=right>客服选择：</TD>
    <TD class=setting_td_right vAlign=center align=left><asp:DropDownList 
            ID="ddlOperator" runat="server">
        </asp:DropDownList>
      </TD></TR>
  <TR id=tr_time>
    <TD class=setting_td_left vAlign=center align=right>时间：</TD>
    <TD class=setting_td_right vAlign=center align=left>
        <asp:TextBox ID="txtBeginDate" runat="server" Width="98px" CssClass="Wdate" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
        至<asp:TextBox ID="txtEndDate" runat="server" Width="98px" CssClass="Wdate" onFocus="new WdatePicker(this,'%Y-%M-%D',true,'default')"></asp:TextBox>
&nbsp;<asp:Button ID="btnSelect" runat="server" Text="搜索" Width="64px" 
            onclick="btnSelect_Click" />
      </TD></TR>
  <TR>
    <TD class=setting_td_left vAlign=center align=right>&nbsp;</TD>
    <TD class=setting_td_right vAlign=center align=left><!--
			  <input type="button" name="gjcx" value="高级查询" class="setting-but2" onclick="javascript:location.href='chat_msg_search.php?arg=pbetrich2113203';" />--> 
    </TD></TR></TBODY></TABLE>
<!--聊天记录内容-->
<TABLE class="setting-chat-tb1 clear-b" style=" width:563px; border:1px; font-size:12px;" cellSpacing=1 
cellPadding=0 border=0>
  <TBODY>
  <TR>

    <TH vAlign=center align=middle style="width: 115px">&nbsp;发起会话者</TH>
    <TH vAlign=center noWrap align=middle style="width: 93px">开始时间</TH>
    <TH vAlign=center align=middle style="width: 93px">持续时长</TH>
    <TH vAlign=center align=middle style="width: 88px">(IP)</TH>
    <TH vAlign=center align=middle>地理位置</TH>
    <TH vAlign=center align=middle>&nbsp;</TH>
    <TH  vAlign=center align=middle>&nbsp;</TH></TR></TBODY></TABLE>
<table width="570">
<tr><td align="left" style=" background-color:#ebf1fa; height: 36px;">聊天记录 &gt;&gt;</td>
<tr><td align="left">
    <asp:GridView ID="GridViewChat" runat="server" Width="563px" 
        AutoGenerateColumns="False" onrowcommand="GridViewChat_RowCommand" 
        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="3"
        onpageindexchanging="GridViewChat_PageIndexChanging" 
        onrowdatabound="GridViewChat_RowDataBound" Font-Size="12px">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="ChatId" HeaderText="ID" SortExpression="ChatId" 
                Visible="False" />
            <asp:BoundField DataField="CreateBy" HeaderText="发起会话者" 
                SortExpression="CreateBy" />
            <asp:BoundField DataField="CloseBy" HeaderText="CloseBy" 
                SortExpression="CloseBy" Visible="False" />
            <asp:BoundField DataField="CreateTime" HeaderText="开始时间" 
                SortExpression="CreateTime" />
            <asp:BoundField DataField="AcceptTime" HeaderText="AcceptTime" 
                SortExpression="AcceptTime" Visible="False" />
            <asp:BoundField DataField="CloseTime" HeaderText="结束时间" 
                SortExpression="CloseTime" Visible="False" />
            <asp:TemplateField HeaderText="持续时长">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# this.DateCompare(Eval("CreateTime").ToString(),Eval("CloseTime").ToString()) %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                SortExpression="AccountId" Visible="False" />
            <asp:BoundField DataField="VisitorId" HeaderText="VisitorId" 
                SortExpression="VisitorId" Visible="False" />
            <asp:BoundField DataField="OperatorId" HeaderText="OperatorId" 
                SortExpression="OperatorId" Visible="False" />
            <asp:TemplateField HeaderText="IP">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Vs.IP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地理位置">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Vs.Location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    
                    <a href="ViewChatAnnal.aspx?chatId=<%# Eval("chatId") %>"><img alt="查看" src="Images/view.gif" /></a>
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ibtnImage" runat="server" AlternateText="删除" CommandName="cmdDelete" CommandArgument='<%# Eval("chatId") %>' ImageUrl="~/AccountAdmin/Images/rubbish.gif" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetChatByOperatorId" TypeName="LiveSupport.BLL.ChatManager">
        <SelectParameters>
            <asp:QueryStringParameter Name="operatorId" QueryStringField="operatorId" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </td></tr>
</tr>
</table>
    <!--内容结束-->
    </td></tr>
   </table>
   </center>
</asp:Content>

