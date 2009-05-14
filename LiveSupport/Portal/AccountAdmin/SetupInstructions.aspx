<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SetupInstructions.aspx.cs" Inherits="AccountAdmin_SetupInstructions" Title="安装指南" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script language="JavaScript"> 
   
function copyToClipboard(a2,a3){
//var textArea=document.forms[a2].elements[a3];
//textArea.focus();
//textArea.select();
//var range=textArea.createTextRange();
//range.execCommand("Copy");
} 
function trimString(a4)
{
return a4.replace(/^\s+/,'').replace(/\s+$/,'');
}
function getid()
{
   
   
}
  
  window.onload=function(){
      var hidden=document.getElementById("ctl00_ContentPlaceHolder1_HiddenField1").value;
      document.getElementById("TextArea1").value="<%--Add LiveChat services javascript --%>"+hidden;
    }
   
      
</script>

    <div id="pagetitle">&#23433;&#35013;&#25351;&#21335;</div>
    <div id="content-container-three-column">
        <div id="content-side1-three-column">
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
<div><img src="Images/2.jpg" /></div>
<DIV class=sdmenu id=my_menu style="margin-left:0px;"> 

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">基本设置</SPAN> 
<A href="#" target=_blank>账户首页</A>

</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客服管理</SPAN> 
<A href="#">部门设置</A> 
<A href="OperatorsManagment.aspx">客服管理</A> 
<A href="#">客服评分</A> <A href="#">登陆日志</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">风格设置</SPAN> 
<A href="#">风格基本信息设置</A> 
<A href="SetupInstructions.aspx">获取代码设置</A> 
<A href="#">界面风格设置</A> 
<A href="#">简介设置</A> 
<A href="#">对话提示设置</A> 
<A href="#">主动发起设置</A> <A 
href="#">客服图标设置</A> <A 
href="#">自定义客服图标</A> <A 
href="#">指定客服设置</A> <A 
href="#">自定义LOGO</A> 
<A href="#">自定义URL</A> 
</DIV>

<DIV class=collapsed><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">数据分析 (New)</SPAN> 
<A onclick=jump_URL() href="#">流量统计 </A>
<A href="#">咨询量统计</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">聊天记录</SPAN> 
<A href="#">聊天记录</A> <A href="#">访客留言</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">客户管理</SPAN> 
<A href="#">添加客户</A> 
<A href="#">客户列表</A> 
<A href="#">分组管理</A> 
<A href="#">IP阻止</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">免费电话管理</SPAN> 
<A onclick="return open_url('#')" href="#">免费电话管理</A> 
<A onclick="return open_url('#')" href="#">设置公司免费电话</A> 
</DIV> 
<img src="Images/4.jpg" />
</DIV><asp:HiddenField 
                        ID="HiddenField1" runat="server" />
        </div>
        <div id="content-main-three-column">
            &#23433;&#35013;&#27493;&#39588;:<br />
            1. &#23558;&#36825;&#27573;&#20195;&#30721;&#25918;&#20837;&#20840;&#23616;&#33021;&#35775;&#38382;&#30340;&#39029;&#38754;&#37324;:<br />
            <form name="button_html_form">
            <asp:TextBox ID="TextBox1" runat="server" Height="184px" TextMode="MultiLine" 
                Width="460px">&lt;%--Add LiveChat services javascript --%&gt; &lt;script 
            type=\&quot;text/javascript\&quot;&gt; function openChat() { var win = 
            window.open('http://ocs:8001/Chat.aspx?aid=','chat', 
            'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=603,height=510'); 
            win.focus(); win.opener = window; return false; } &lt;/script&gt;
            </asp:TextBox>
            <br />
            <input id="Button1" style="width: 225px" type="button" 
                value="Copy Chat Link Code to Clipboard" 
                onclick="copyToClipboard('button_html_form', 'content')" /><br />
                </form>
            2. &#23558;&#19979;&#38754;&#30340;&#20195;&#30721;&#25918;&#21040;&#20320;&#30340;&#32593;&#31449;&#24819;&#26174;&#31034;LiveSupport&#38142;&#25509;&#30340;&#20301;&#32622;:<br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Height="151px" TextMode="MultiLine" 
                Width="449px">&lt;script type=&quot;text/javascript&quot;&gt; document.write('&lt;a 
            href=&quot;javascript://&quot; onclick=&quot;openChat();&quot;&gt;&lt;img id=&quot;_imgLC&quot; 
            src=&quot;http://ocs:8001/ProcessImage.ashx?aid=&amp;referrer=' + document.referrer + '&quot; 
            border=&quot;0&quot; alt=&quot;Click here for live chat&quot; /&gt;&lt;/a&gt;'); function TextArea1_onclick() 
            { } &lt;/script&gt;</asp:TextBox>
            <br />
            <br />
            3. &#23436;&#25104;<br />
        </div>
<%--        <div id="content-side2-three-column">
        </div>
        
--%>      <div class="clear">
            
            
            
        </div>
    </div>
</asp:Content>

