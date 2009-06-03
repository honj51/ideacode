<%@ Page Title="" Language="C#" MasterPageFile="~/AccountAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="SetupInstructions.aspx.cs" Inherits="AccountAdmin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="con1" Runat="Server">
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     获取代码</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px; ">
    <!--头部--->
      <div id="content-main-three-column" style="text-align:left;">
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
            3. &#23436;&#25104;<br /></DIV><asp:HiddenField 
                        ID="HiddenField1" runat="server" />
        </div>
       <!--导航结束-->
       </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</asp:Content>

 
 
