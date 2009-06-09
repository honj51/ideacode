<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" ValidateRequest="false"   AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>在线交流</title>
<link href="App_Themes/Default/mainCN.css"rel="stylesheet" type="text/css"/>
<link href="App_Themes/Default/skin.css"rel="stylesheet" type="text/css" />
<script  src="js/SendMsg.js"type="text/javascript" language="javascript"></script>
<script src="js/ChatPageScript.js" type="text/javascript" language=javascript></script>
<style type="text/css">
    BODY 
    {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        font-family:@新宋体;  
        font-size: 10pt;
    }
     TD {
        FONT-SIZE: 9pt; FONT-FAMILY: Tahoma
    }
    .file{
        BORDER-RIGHT: #70b4e0 1px solid; BORDER-TOP: #70b4e0 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #70b4e0 1px solid; COLOR: #007ac8; BORDER-BOTTOM: #70b4e0 1px solid; BACKGROUND-COLOR: #d4eeff
    }
    .btn{
        BORDER-RIGHT: #70b4e0 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #70b4e0 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 10px; PADDING-BOTTOM: 0px; MARGIN: 0px; BORDER-LEFT: #70b4e0 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: #70b4e0 1px solid; FONT-FAMILY: Arial, Helvetica, sans-serif; HEIGHT: 18px
    }
    .litChat
    {
       text-align:left; overflow:scroll;FONT-SIZE: 11pt; WIDTH: 100%; FONT-FAMILY: "宋体","MS Gothic","Times New Roman","PMingLiU"; HEIGHT: 100px;  
    }
    fieldset
    {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        border:1;
    } 
    #Button2
    {
        height: 22px;
        width: 50px;
    }
    #btnClose
    {
        width: 45px;
        height: 20px;
    }
     #Welcome
    {
        font-weight: bold;
        color: gray;
        font-size: 12pt;
    }
    .formField
    {
        font-weight: bold;
    }
    #chat
    {
        overflow:scroll;
        height:100%;
        width: 100%;
        overflow: auto;
    }
    #chatTitle
    {
	    color:#008040;
    }
    #chatTitle1
    {
        font-family:"新宋体";
        color:#090BAE;
    }
    #chatText
    {
	    font-size:11px;
	    color:blue;
    }
    #chatSts
    {
        font-size:13px;
        color: #FF9933
    }
    #txtMsg
    {
        font-family:"新宋体";
        font-size:11px;
	    color:#333;
        width: 164px;
        height: 117px;
    }
</style>
</head>
<body  topmargin="0" leftmargin="0" >
    <form id="formMain" runat="server">
    <div style="background-color:#85c3ff ;">   
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" >
            <Scripts>
                <asp:ScriptReference Path="~/js/SendMsg.js" />
            </Scripts>
        </asp:ScriptManager>     
<%--面板1 star--%>
<asp:Panel ID="pnlNoOperator" Visible="false"  runat="server">
    <table cellpadding="0" cellspacing="0"  style="background-image:url(Images/bg.jpg); background-position:center;    height:100%; width:100%">
        <tr>
            <td  align="center">
                <span class="formField">   感谢您的关注！</span>
            </td>
        </tr>
        <tr>
            <td align="center">
                <fieldset > 
                    <legend > 
                    <asp:Label ID="lblConfirmation" Visible="false" runat="server"></asp:Label>
                    <span id="Span1">当前没有客服在线.<br />请留言，我们会尽快给您回复!</span>
                    </legend>
                    <br />
                     <fieldset style=" height:5%;  width:43.5%"  >
                     <legend>  <span class="formField"> 姓名</span></legend> 
                    <asp:TextBox ID="txt_username" runat="server" Width="99%" ></asp:TextBox>
                    </fieldset>
                    
                     <fieldset style=" height:5%;  width:43.5%"  >
                     <legend>  <span class="formField"> 电话</span></legend> 
                    <asp:TextBox ID="txtPhone" runat="server" Width="100%" ></asp:TextBox>
                    </fieldset>
                   
                    <br />
                    <fieldset style="height:5%; width:87%" > <legend>  <span class="formField">  您的电子邮件</span></legend> 
                    &nbsp;<asp:TextBox ID="txtSendBy" runat="server" Width="100%" ></asp:TextBox>
                    </fieldset>
                    <br />
                        <fieldset style=" height:5%;  width:87%"  >
                     <legend>  <span class="formField">主题</span></legend> 
                    &nbsp;<asp:TextBox ID="txtTheme" runat="server" Width="100%" ></asp:TextBox>
                    </fieldset>
                    <bt />
                    <fieldset style="height:230px; width:87%">
                    <legend>
                    <span class="formField">留言内容</span>
                    </legend>
                    <asp:TextBox ID="txtComment"  TextMode="MultiLine" Width="100%" Height="230px" runat="server"></asp:TextBox>
                    </fieldset>
                    <br />
                    <fieldset  style="height:2%; width:92%;">
                        <asp:Button  ID="btnSendEmail" runat="server"  Text="发送邮件"  OnClientClick="emailclose()" onclick="btnSendEmail_Click"/>
                    </fieldset>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Panel>
<%--面板1 end--%>
      
<asp:Panel  ID="pnlRequest" Visible="true" runat="server">
        
           <table  cellpadding="0" cellspacing="0"  style="background-image:url(Images/bg.jpg); background-position:center;    height:100%; width:100%">
           <tr>
           <td valign="top"  style=" height:30px; width:100%"  align="center">
           <asp:Label ID="welcomeLabel" runat="server" Text="Label"></asp:Label></td>
           </tr>
           <tr  >
           <td align="center" >
            <table   cellpadding="0" cellspacing="0"  style=" margin:200 150 40 50;   height:40%; width:50%"  align="center">
            <tr>
            <td align="center" colspan="2">
             <span id="Welcome"  >清输入下面的内容进行对话.</span>
            </td>
            </tr>
            
            <tr>
            <td align="right" >
             <span class="formField">您的名字:</span>
            </td>
            
            <td align="left">
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        
            </td>
            </tr>
            
            
            <tr valign="top">
            
            <td align="right" >
             <span class="formField">您的电子邮件:</span>
            
            </td>
            
            <td align="left">
              <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            
            </td>
            </tr>
            <tr>
             <td>
             
             </td>
            
            <td ><asp:Button  ID="btnStarChat" Text="开始对话" runat="server" onclick="btnStarChat_Click" /></td>
            </tr>
            </table>
           <tr>
           <td colspan="2"  align="center">
           版权所有
           </td>
           </tr>
   </table>
</asp:Panel>
        
        
        
           <asp:Panel   ID="pnlChat" runat="server">
              
       <table id="chatbox" cellpadding="0" cellspacing="0"  style=" height:100%; width:100%">
 
          <tr id="tdhead" style=" background-image: url(Images/title_bg.gif);">
    
    <td  style=" width:80%; height:30px;">
     
    <div id="head" style="background-image: url(Images/title.gif);" >
      <span id="headerBox">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional" ChildrenAsTriggers="False">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="timerRefresh" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
          <asp:Label ID="lblOp" runat="server"></asp:Label> 
          </ContentTemplate>
            </asp:UpdatePanel>
      </span>
      <span id="headerBoxTime">
     
    </span></div>
    
    </td>
    
    
       <td  valign="middle" style="  width:40px;  height:30px;">
      <div >
      
      <a href="" target="_blank" id="logo" 
             style="font-family: 微软雅黑; font-weight:100px; font-size:15px; text-decoration: none">
             
             LiveSupport</a>
		</div>		
    
    </td>
    
  </tr>
  
 
    <tr id="notewrap">
			<td  style=" width:85%; height:80%;">
  <table  height="100%" width="100%" style="break:break-all;word-wrap:break-word;table-layout:fixed" cellpadding="0" cellspacing="0">
  
                    
                    <tr  style="height:100%">
                        <td height="100%"  >
<%--  显示消息层--%>
 <div id="history" >
    <div id="chat"> 
        <asp:UpdatePanel  ID="upChat" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
        <Triggers>
        <asp:AsyncPostBackTrigger  ControlID="timerRefresh" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
        <asp:Literal   ID="litChat" runat="server"></asp:Literal>
        <asp:Timer ID="timerRefresh" Interval="1000" runat="server" OnTick="timerRefresh_Tick">
        </asp:Timer>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>

   <!--上传-->
    <div id="uploadFileBox" style="display:none; background-color:#d4eeff;" >&nbsp;&nbsp;
        <asp:FileUpload CssClass="file"  ID="fuFile" runat="server" Height="20px" Width="191"  />
        &nbsp;<asp:Button  ID="btnUpload" CssClass="btn" runat="server" Height="20px" Text="传送" Width="46px" onclick="btnUpload_Click" />&nbsp;
        <input ID="btnClose" class="btn" type="button" value="关闭" onclick="divClose('uploadFileBox')" />
    </div> 
</div>
<%--  显示消息层结束--%>          
             
            
                      
                        </td>
                        
                    </tr>
                  
                </table>
  
  
  
  </td>
  
  <td valign="top" id="bwrap" style=" width:40px; height:80%;">
				<div id="banner" style="height:305px; width: 135px" ><img  alt=""  src="Images/right_column_0.jpg" width="100%" height="100%"
                        /></div>
  
  </td>
  </tr>
  
  <tr id="tdinput">
  <td id="twrap" colspan="2" style=" width:100%; height:30px;">
  <div id="tool_wrap">
                    <ul id="toolsbar">
                        <li style="background-image: url(Images/tools_icn.gif);" id="file" onclick="divShow('uploadFileBox');">传送文件 </li>
                        <li style="background-image: url(Images/tools_icn.gif);" id="save" class="open" onclick="Save();">保存记录 </li>
                        <li style="background-image: url(Images/tools_icn.gif);" id="switch" class="open" style='display:none'>关闭提示音 </li>
                        <li style="background-image: url(Images/tools_icn.gif);" id="language" style="display:none;">语言选择</li>
                        </ul>
                        <ul id="languageList" style="display:none;">
						<li lang:value="0">简体中文</li>
						<li lang:value="1">繁体中文</li>
						<li lang:value="2">English</li>
						<li lang:value="3">日 本 語</li>
						<li lang:value="4">한 국 말</li>
					   </ul>
					  <div id="exitChat" style="background-image: url(Images/tools_icn.gif);" onclick="Exit()"> 结束对话</div>
                    </div>
                    </div>
  </td>
  </tr>
  <tr id="msg">
<td id="inputarea"style=" width:85%; height:90px">
         <textarea name="message" id="txtMsg" rows="2" runat="server" cols="100" onkeypress="checkEnter(event)" /> </td><td align="center" id="enter_wrap"  style=" width:40px; height:90px">
<div id="ewrap">
    <div id="enter" style="background-image:url(Images/send0.jpg)" onclick="CallSendMsg()"></div>
</div>
</td>
</tr>
<tr>
  <td id="tdfooter" style="background: url(Images/footer_bg.gif);" colspan="2" valign="top"  style=" width:100%;" > 
  <div id="footer">
  <p>
  <span id="shortKeyTip" >[发送快捷键:Enter]: </span><span id="footerBox"></span></p><div id="shortcutkey" onclick="">消息发送方式</div><ul id="shortKeyMenu" style="display:none;">
<li>按Enter键发送消息</li><li>按Ctrl+Enter键发送消息</li></ul></div></td></tr></table></asp:Panel></div></form></body></html>