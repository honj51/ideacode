<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiveSupportLeaveWord.aspx.cs" Inherits="LiveSupportLeaveWord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>LiveSupport 留言板崛起版</title>
    <style type="text/css">
    body{font:12px tahoma;margin:0;padding:0;}
    input,textarea{font:12px tahoma;}
    input,textarea{border:1px solid #069;}
    ul{margin:0;padding:0;}
    li{display:inline;}
    .bottom{background:#f1f1f1;padding:5px;margin:10px 0;}
	.time{font:11px tahoma;color:#666}
	.text_red{color:red;}
	.border_all{border-left:1px solid #999;border-right:1px solid #999;}
        .style1
        {
            width: 82%;
        }
        .style2
        {
            width: 131px;
        }
        .style3
        {
            width: 126px;
        }
        .style6
        {
            width: 113px;
        }
        .style7
        {
            width: 52px;
        }
        .style9
        {
            width: 130px;
        }
        .style10
        {
            width: 73px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <table align="center" class="style1">
            <tr>
                <td>
                    <img src="Imgs/Logo.jpg" alt="" border="0" usemap="#Map" style="width: 800px; height: 239px" /></td>
          </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Width="800px">
            <table class="style1">
                <tr>
                    <td class="style10">
                        管理员：</td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style7">
                        密&nbsp; 码：</td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style9">
                        <img id="imgVerify" src="VerifyCode.aspx?" alt="看不清？点击更换" onclick="this.src=this.src+'?'" style="width: 121px; height: 29px" /></td>
                    <td class="style6">
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
        <table align="center" class="style1">
            <tr>
                <td>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
			<table cellSpacing="1" cellPadding="5" width="800" bgColor="#cccccc" border="0" align="center">
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
					<span class="text_red">&nbsp;&nbsp;&nbsp[回复]&nbsp;&nbsp;&nbsp<%# Eval("Reply") %></span>
					</asp:Panel>
					<asp:Panel ID="manages" runat="server" Visible='<%# Session["nName"]!=null %>'>
					<hr size="1" style="border:1px dotted #333;">
                   <a href="Reply.aspx?id=<%# Eval("id") %>">[回复]</a>
                    <a href="LiveSupportLeaveWord.aspx?action=del&id=<%# Eval("id") %>" onclick='return confirm("您确定删除吗?");'>[删除]</a>
                    <a href="LiveSupportLeaveWord.aspx?action=loginout" onclick='return confirm("您确定要退出管理模式吗?");'>[注销]</a>
                   </asp:Panel>
					</td>
				  </tr>
			</table>
			<br />
            </ItemTemplate>
                    </asp:Repeater>
                    
                </td>
            </tr>
        </table>
    
    </div>
    </form>

<map name="Map" id="Map"><area shape="rect" coords="331,180,448,223" href="AddMessage.aspx" />
</map></body>
</html>

