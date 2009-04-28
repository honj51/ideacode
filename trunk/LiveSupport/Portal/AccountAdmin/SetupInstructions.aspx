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
            <ul class="list-of-links">
                <li class="current"><a href="AccountHome.aspx">&#36134;&#25143;&#39318;&#39029;</a></li>
                <li><a href="SetupInstructions.aspx">&#23433;&#35013;&#25351;&#21335;</a></li>
                <li><a href="OperatorsManagment.aspx">&#22352;&#24109;&#31649;&#29702;</a></li>
                <li><a href="AccountSettings.aspx">&#36134;&#25143;&#35774;&#32622;</a></li>
                <li><a href="CannedResponses.aspx">&#39044;&#32622;&#28040;&#24687;</a><asp:HiddenField 
                        ID="HiddenField1" runat="server" />
                </li>
            </ul>
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

