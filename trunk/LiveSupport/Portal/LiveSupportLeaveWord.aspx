<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" AutoEventWireup="true" CodeFile="LiveSupportLeaveWord.aspx.cs" Inherits="Default2" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" >
            <table Width="800px">
                <tr>
                <td>&nbsp;&nbsp;&nbsp;<a href="AddLiveSupportLeaveWord.aspx"><font style="font-size:14px;"><u>发表留言</u></font></a>&nbsp;&nbsp;&nbsp;</td>
                    <td >
                        管理员：</td>
                    <td >
                        <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td >
                        密&nbsp; 码：</td>
                    <td >
                        <asp:TextBox ID="TextBox2" runat="server" Width="100px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <img id="imgVerify" src="VerifyCode.aspx?" alt="看不清？点击更换" onclick="this.src=this.src+'?'" style="width: 121px; height: 29px" /></td>
                    <td >
                        <asp:TextBox ID="TextBox3" runat="server" Width="82px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="登 录" onclick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="false">
        <table Width="785px"><tr><td align="left">&nbsp;&nbsp;&nbsp;<a href="AddLiveSupportLeaveWord.aspx"><font style="font-size:14px;"><u>发表留言</u></font></a>&nbsp;&nbsp;&nbsp; 欢迎您：LiveSupport管理员!&nbsp;&nbsp;&nbsp;<a href="LiveSupportLeaveWord.aspx?action=loginout" onclick='return confirm("您确定要退出管理模式吗?");'>[注销]</a></td></tr></table>
           
        </asp:Panel>
<asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
			<table cellSpacing="1" cellPadding="5" width="785" bgColor="#cccccc" border="0" align="center">
				<tr>
					<td width="120" rowspan="2" align="center" bgcolor="#ffffff"><strong><img src='<%#Eval("PicUrl") %>' alt="" width="75" height="85" hspace="5" vspace="5" ><br />来自:<%# Eval("UserIp")%></strong></td>
					<td bgcolor="#f1f1f1" height="5"><span style="float:right">
					<a href='http://wpa.qq.com/msgrd?V=1&Uin=<%# Eval("UserQQ") %>&Site=时空留言版&Menu=yes' target="_blank"></a>
					发表于:<%# Eval("AddTime") %>
					</span>
					<span style="float:left"><strong>昵称:&nbsp;<%# Eval("UserName") %> &nbsp;&nbsp;<img src='<%#Eval("faceUrl") %>' /> </span></td>
				  </tr>
				  <tr align="left">
				  <asp:Panel ID="Panel8" runat="server" Visible='<%# Eval("IsHid").ToString()=="0" %>'>
					<td bgcolor="#ffffff" style="table-layout:fixed;word-break:break-all"><%# Eval("Contents")%>
					</asp:Panel>
					<asp:Panel ID="Pane9" runat="server" Visible='<%# Eval("IsHid").ToString()=="1"%>'>
					<td bgcolor="#ffffff" style="table-layout:fixed;word-break:break-all"><%#Session["nName"] == null ? "[悄悄话]" : Eval("Contents")%>
					</asp:Panel>
					
					<asp:Panel ID="re" runat="server" Visible='<%# Eval("Reply").ToString()!="" %>'>
					<hr size="1" style="border:1px dotted #333;">
					<span style="color:Red;">[管理员回复]&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;<%# Eval("Reply") %></span>
					</asp:Panel>
					<asp:Panel ID="manages" runat="server" Visible='<%# Session["nName"]!=null %>'>
					<hr size="1" style="border:1px dotted #333;">
                   <a href="Reply.aspx?id=<%# Eval("id") %>">[回复]</a>
                    <a href="LiveSupportLeaveWord.aspx?action=del&id=<%# Eval("id") %>" onclick='return confirm("您确定删除吗?");'>[删除]</a>
                   </asp:Panel>
					</td>
				  </tr>
			</table>
			<br />
            </ItemTemplate>
            
                    </asp:Repeater>
                    <table cellSpacing="1" cellPadding="5" width="785" bgColor="#cccccc" border="0" align="center">
				<tr>
					<td width="120" rowspan="2" align="right" bgcolor="#ffffff">
					 
            对 当前页:<asp:Label ID="lblChatIndex" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            /<asp:Label ID="lblChatIndexCount" runat="server" Font-Size="14px" 
                ForeColor="#FF3300"></asp:Label>
            <asp:ImageButton ID="ibtnCshang" runat="server" ImageUrl="~/images/shang.gif" 
                            onclick="ibtnCshang_Click" CausesValidation="False"/>
            <asp:ImageButton ID="ibtnCxia" runat="server" ImageUrl="~/images/xia.gif" 
                            onclick="ibtnCxia_Click" CausesValidation="False"/>
					</td>
				  </tr>
			</table>
</asp:Content>

