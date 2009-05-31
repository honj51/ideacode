<%@ Page Title="" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChatAnnal.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
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
<script type="text/javascript">
    function Save() {
        var txt = document.getElementById("divMessage").innerHTML;
        b = window.open();
        b.document.open();
        b.document.write(txt);
        b.document.close();
        b.document.execCommand('saveas', true, '');
        b.window.close();
    } 
		</script>
<!--聊天记录内容-->
    <TABLE class=setting_tb cellSpacing=1 cellPadding=0 border=0 
        style="width: 570px">
  <TR>
    <TD class=setting_td_top vAlign=center align=left colSpan=2>聊天记录查询 &gt;&gt;</TD></TR>
  <TR>
</TABLE>
<div style=" width:570px;text-align:left; border-right: 1px solid; border-top: 1px solid; float: right; border-left: 1px solid; border-bottom: 1px solid; position: relative;">
    <input id="btnSave" type="button" value="保存HTML" onclick="Save()" /></div>
 <div id="divMessage" style=" margin-top:5px; height:340px; width:570px;  overflow: scroll; text-align:left; border-right: 1px solid; border-top: 1px solid; float: right; border-left: 1px solid; border-bottom: 1px solid; position: relative;">
            <asp:Literal   ID="lblMessage" runat="server"></asp:Literal>
    </div>

</asp:Content>

