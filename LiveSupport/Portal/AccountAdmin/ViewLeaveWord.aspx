<%@ Page Title="" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewLeaveWord.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
<script src="JS/Save.js"></script>
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

    };</SCRIPT>
<script src="../js/My97DatePicker/WdatePicker.js"></script>
    <!--内容开始-->
   <!--内容-->
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
          详细留言记录</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 423px; text-align:left;">
<!--聊天记录内容-->
    <table style="width: 507px; height: 246px; margin-left:20px; font-size:14px; border:1px;">
    <tr><td style="width: 107px">留言者名称：</td><td>
        <asp:Label ID="lblCallerName" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="lwId" runat="server" />
        </td></tr>
    <tr><td style="width: 107px">电子邮箱：</td><td>
        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">联系电话：</td><td>
        <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">主题：</td><td>
        <asp:Label ID="lblSubject" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">留言内容：</td><td>
        <asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">IP地址：</td><td>
        <asp:Label ID="lblIP" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">留言时间：</td><td>
        <asp:Label ID="lblCallerDate" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">回复时间：</td><td>
        <asp:Label ID="lblSenddate" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">回复人：</td><td>
        <asp:Label ID="lblSendName" runat="server"></asp:Label>
        </td></tr>
    <tr><td style="width: 107px">是否回复：</td><td>
        <asp:Label ID="lblIsSend" runat="server" Text=""></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:LinkButton ID="LinkButton2" runat="server"  onclick="LinkButton2_Click" >回复</asp:LinkButton>&nbsp;
       <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click"  >设置未回复</asp:LinkButton>
        </td></tr>
    </table>
  <!--内容结束-->
  </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>



</asp:Content> 
 

