<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SetupInstructions.aspx.cs" Inherits="AccountAdmin_SetupInstructions" Title="&#26080;&#26631;&#39064;&#39029;" %>


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
</script>

    <div id="pagetitle">&#23433;&#35013;&#25351;&#21335;</div>
    <div id="content-container-three-column">
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li class="current"><a href="AccountHome.aspx">&#36134;&#25143;&#39318;&#39029;</a></li>
                <li><a href="SetupInstructions.aspx">&#23433;&#35013;&#25351;&#21335;</a></li>
                <li><a href="OperatorsManagment.aspx">&#22352;&#24109;&#31649;&#29702;</a></li>
                <li><a href="AccountSettings.aspx">&#36134;&#25143;&#35774;&#32622;</a></li>
                <li><a href="CannedResponses.aspx">&#39044;&#32622;&#28040;&#24687;</a></li>
            </ul>
        </div>
        <div id="content-main-three-column">
            &#23433;&#35013;&#27493;&#39588;:<br />
            1. &#23558;&#36825;&#27573;&#20195;&#30721;&#25918;&#20837;&#20840;&#23616;&#33021;&#35775;&#38382;&#30340;&#39029;&#38754;&#37324;:<br />
            <form name="button_html_form">
            <textarea id="TextArea1" name="S1" style="height: 202px; width: 536px"><%--Add LiveChat services javascript --%>
    <script type="text/javascript">
    function openChat()
    {
        var win = window.open('http://ocs:8001/Chat.aspx', 'chat', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=603,height=510');
        win.focus();
        win.opener = window;
        return false;
    }
    </script></textarea><br />
            <input id="Button1" style="width: 225px" type="button" 
                value="Copy Chat Link Code to Clipboard" 
                onclick="copyToClipboard('button_html_form', 'content')" /><br />
                </form>
            2. &#23558;&#19979;&#38754;&#30340;&#20195;&#30721;&#25918;&#21040;&#20320;&#30340;&#32593;&#31449;&#24819;&#26174;&#31034;LiveSupport&#38142;&#25509;&#30340;&#20301;&#32622;:<br />
            <br />
            <textarea id="TextArea2" name="S2" style="width: 535px; height: 115px"><script type="text/javascript">
			document.write('<a href="javascript://" onclick="openChat();"><img id="_imgLC" src="http://ocs:8001/ProcessImage.ashx?referrer=' + document.referrer + '" border="0" alt="Click here for live chat" /></a>');
function TextArea1_onclick() {

}

            </script></textarea><br />
            3. &#23436;&#25104;<br />
        </div>
<%--        <div id="content-side2-three-column">
        </div>
--%>        <div class="clear">
        </div>
    </div>
</asp:Content>

