<%@ Page Language="C#" ValidateRequest="false"   AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>在线交流</title>
        <link href="Images/mainCN.css" rel="stylesheet" type="text/css"/>
        <link href="Images/skin.css" rel="stylesheet" type="text/css" />

        <script  src="SendMsg.js" type="text/javascript" language="javascript"></script>

       
<style type="text/css">
    
    
        BODY 
        {
             margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
            font-family: Arial;  
		font-size: 10pt;
   	BORDER-RIGHT: 0px; PADDING-RIGHT: 0px; BORDER-TOP: 0px; PADDING-LEFT: 0px; FONT-SIZE: 9pt; PADDING-BOTTOM: 0px; MARGIN: 0px; OVERFLOW: hidden; BORDER-LEFT: 0px; PADDING-TOP: 1px; BORDER-BOTTOM: 0px; FONT-FAMILY: Tahoma
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
	    background-color:#85c3ff;
		height: 298px;
		width: 483px;
		overflow: auto;
		padding: 8px;
	}
	.chatName { color: gray; }
        #txtMsg
        {
            width: 164px;
            height: 117px;
        }
        .litChat
        {
        OVERFLOW-Y: scroll; DISPLAY: block; FONT-WEIGHT: normal; FONT-SIZE: 11pt; WIDTH: 100%; LINE-HEIGHT: 1.5em; FONT-FAMILY: "宋体","MS Gothic","Times New Roman","PMingLiU"; HEIGHT: 100px; 

            
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

        
        

        
    </style>  
<script language="javascript" type="text/javascript">

///禁止页面刷新
document.onkeydown = function()
 {
          if(event.keyCode==116) {
          event.keyCode=0;
          event.returnValue = false;
          }
}
document.oncontextmenu = function() {event.returnValue = false;} 



///窗体关闭提示
function Exit()
{
    if(confirm('是否关闭')==true) 
    {
      UpdateCloseDate();
      window.close();
    }
}

//交流方式
function shortKeyMenu()
{
    document.getElementById(shortKeyMenu).style.display="block"
}
//显示层
function divShow(divId)
{
    document.getElementById(divId).style.display="block";
}
//关闭层
function divClose(divId)
{
    document.getElementById(divId).style.display="none";
}
var lastCheck = new Date(); 
function scrollDiv()
{
    var d;
    if ((d = document.getElementById('chat')) && ('undefined' != typeof d.scrollTop))
{
	//d.scrollTop = 0;
	d.scrollTop = 5000;
}
window.setTimeout("scrollDiv()", 950);

var now = new Date();
var elapse = now.getSeconds() - lastCheck.getSeconds();
var sameMinute = now.getMinutes - lastCheck.getMinutes();
if( sameMinute != 0 || elapse >= 2 )
{
	// Check for typing notification
	PageMethods.CheckTypingNotification(getCookie('chatId'), OnCheckTypingNotificationComplete);
	
	lastCheck = new Date();
}
}
function OnCheckTypingNotificationComplete(result, methodName)
{
if( result != '' )
{
	var v = document.getElementById('typingNotification');
	if( v != 'undefined' &&  v != null) 
		v.innerText = result; 
}
}
window.onload = scrollDiv;
function Save(){    
var txt = document.getElementById("upChat").innerHTML
b = window.open();   
b.document.open();   
b.document.write(txt);   
b.document.close(); 
b.document.execCommand('saveas',true,''); 
}
</script>

</head>

<body  topmargin="0" leftmargin="0" >
    <form id="formMain" runat="server">
    <div style="background-color:#85c3ff ;">   
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" >
            <Scripts>
                <asp:ScriptReference Path="SendMsg.js" />
            </Scripts>
        </asp:ScriptManager>
       
        <asp:Panel ID="pnlNoOperator" Visible="false"  runat="server">
     
      <table cellpadding="0" cellspacing="0"  style="background-image:url(Images/bg.jpg); background-position:center;    height:100%; width:100%">
                <tr>
                <td  align="center"  style=" height:15%">
                
                  <span class="formField">   感谢您的关注！</span>
                </td>
                </tr>
                
                <tr>
                <td   align="center">
                
                
                <fieldset  style=" height:85% ; width:80%"> 
                <legend > 
                <asp:Label ID="lblConfirmation" Visible="false" runat="server"></asp:Label>
                 
                  <span id="Span1">当前没有客服在线.<br />
                    请留言，我们会尽快给您回复!</span>
                 </legend> 
                    
                    <br />
                     <fieldset style="height:5%; width:87%" > <legend>  <span class="formField">  您的电子邮件</span></legend> 
                <asp:TextBox ID="txtSendBy" runat="server" Width="100%"   ></asp:TextBox>
                   </fieldset>
                   <br />
                    <fieldset style="height:230px; width:87%">
                <legend>
                 <span class="formField">留言内容</span>
               
                </legend>
                  <asp:TextBox ID="txtComment"  TextMode="MultiLine" Width="100%" Height="230px" runat="server"></asp:TextBox>
                </fieldset>
               <br />
                <fieldset  style="height:2%; width:92%;">
                
                 <asp:Button  ID="btnSendEmail" runat="server"  Text="发送邮件"  onclick="btnSendEmail_Click"/>
                                 
                </fieldset>
                   
                </fieldset>
           
               </td>
                </tr>
            </table>
        </asp:Panel>
        
      
        <asp:Panel  ID="pnlRequest" Visible="true" runat="server">
        
           <table  cellpadding="0" cellspacing="0"  style="background-image:url(Images/bg.jpg); background-position:center;    height:100%; width:100%">
           <tr>
           <td valign="top" colspan="2" style=" height:30px; width:100%"  align="center">
           欢迎进入XXX公司客服服务
           </td>
           
         
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
            
            <td >
                <asp:Button  ID="btnStarChat" Text="开始对话" runat="server" onclick="btnStarChat_Click" />
            </td>
            
           
            </tr>
            </table>
            
            
        
          
           
           </td>
             <td style=" width:50px"  valign="baseline">
              <img  alt=""  src="Images/right_column_0.jpg" />
            
                
           </td>
           
           </tr>
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
                            <div id="history" >
				
				
            <asp:UpdatePanel ID="upChat" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="timerRefresh" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    
                    
                         <asp:Literal  ID="litChat" runat="server"></asp:Literal>
                        <asp:Timer ID="timerRefresh" Interval="1000" runat="server" 
                         OnTick="timerRefresh_Tick">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
               
               
                    <!--上传-->
          <div id="uploadFileBox" style="display:none; background-color:#d4eeff;" >&nbsp;&nbsp;
                <asp:FileUpload CssClass="file"  ID="fuFile" runat="server" Height="20px" Width="191"  />
              &nbsp;<asp:Button  ID="btnUpload" CssClass="btn" runat="server" Height="20px" Text="传送" Width="46px" onclick="btnUpload_Click" />&nbsp;
              <input ID="btnClose" class="btn" type="button" value="关闭" onclick="divClose('uploadFileBox')" />
                </div> 
             </div>
           
             
            
                      
                        </td>
                        
                    </tr>
                  
                </table>
  
  
  
  </td>
  
  <td valign="top" id="bwrap" style=" width:40px; height:80%;">
				<div id="banner"></div>
  
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
                        <li style="background-image: url(Images/tools_icn.gif);" id="active" class="open">
                            <asp:LinkButton ID="CutLBtn" runat="server" onclick="CutLBtn_Click" 
                                Font-Underline="False" ForeColor="White">剪切</asp:LinkButton>
                        </li>
                         <li style="background-image: url(Images/tools_icn.gif);" id="dialback" style="display:none;">免费电话</li>
                 
                        </ul>
                        <ul id="languageList" style="display:none;">
						<li lang:value="0">简体中文</li>
						<li lang:value="1">繁体中文</li>
						<li lang:value="2">English</li>
						<li lang:value="3">日 本 語</li>
						<li lang:value="4">한 국 말</li>
					</ul>
					  <div id="exitChat"  style="background-image: url(Images/tools_icn.gif);" onclick="Exit()">
				
                              结束对话
                              </div>
                
                        </div>
                        </div>
  </td>
  
  </tr>
  <tr id="msg">
    <td id="inputarea"   style=" width:85%; height:90px">
    
     <textarea name="message" id="txtMsg" rows="2" runat="server" cols="100" style=" width:100%; height:100%"  onkeypress="checkEnter(event)" /> </td><td align="center" id="enter_wrap"  style=" width:40px; height:90px">
        

                 
                    <div id="ewrap">
				<div id="enter" style="background-image:url(Images/send0.jpg)" onclick="CallSendMsg()"></div></div>
    
          
    
    </td>
  </tr>
  
  <tr>
  <td id="tdfooter" style="background: url(Images/footer_bg.gif);" colspan="2" valign="top"  style=" width:100%;" > 
  
  <div id="footer">
  <p>
  <span id="shortKeyTip" >[发送快捷键:Enter]: </span><span id="footerBox"></span></p><div id="shortcutkey" onclick="">消息发送方式</div><ul id="shortKeyMenu" style="display:none;">
				<li>按Enter键发送消息</li><li>按Ctrl+Enter键发送消息</li></ul></div></td></tr></table></asp:Panel></div></form></body></html>