<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>在线交流</title>
        <link href="Images/mainCN.css" type="text/css" rel="Stylesheet" />
    <link href="Images/skin.css" type="text/css" rel="stylesheet" />
  
    <style type="text/css">
       
      
      
      
        BODY 
        {
            font-family: Arial; b
		color: black;
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
		width: 500px;
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
            
   fieldset {
    padding:10px;
    margin:10px;
    
    color:#333; 
    border:1;
    
} 
legend {
    color:#06c;
    font-weight:800; 
    
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
				if( v != 'undefined' ) 
					v.innerText = result; 
			}
		}
		
		window.onload = scrollDiv;
    </script>

</head>

<body topmargin="0" leftmargin="0" >
    <form id="formMain" runat="server">
    <div style="background-color:#85c3ff ;height:510px; width:603px;">   
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" >
            <Scripts>
                <asp:ScriptReference Path="SendMsg.js" />
            </Scripts>
        </asp:ScriptManager>
       
        <asp:Panel ID="pnlNoOperator" Visible="false"  runat="server">
            <div  style=" height:92.5%; width:93%">
                
                <fieldset style="height:100%; width:100%" > 
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
               <br />
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlRequest" Visible="true" runat="server">
            <div style="height:100%; width:100%">
            <fieldset style="height:92.5%; width:93%">
                
                <legend>
                
                <span id="Welcome">清输入下面的内容进行对话.</span>
                </legend>
            
            <fieldset style=" width:40%">
            <legend>
            <span class="formField">您的名字</span>
            </legend>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </fieldset>
            <br />
            <fieldset style=" width:40%">
            <legend>
            
                <span class="formField">您的电子邮件</span>
            </legend>
             <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </fieldset>
          
          
         <br />
            
            <fieldset style=" width:40%">
             
            <asp:Button  ID="btnStarChat" Text="开始对话" runat="server" onclick="btnStarChat_Click" />
            <br />
            
            </fieldset>
            </fieldset>
                
                </div>
            
                          
        </asp:Panel>
        
        
       <%-- <asp:Panel ID="pnlRequest" Visible="true" runat="server">
            <div style="padding-left: 5px;">
                <span id="Welcome">清输入下面的内容进行对话.</span><br />
                <span class="formField">您的名字</span><br />
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
                <br />
                <span class="formField">您的电子邮件</span><br />
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
                <br />
               
            </div>
        </asp:Panel>--%>
        
     
        <%--<asp:Panel ID="pnlChat" Visible="false" runat="server" style="width: 175px" 
            Height="463px" Width="172px">
			<div id="chat"> 
            <asp:UpdatePanel ID="upChat" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="timerRefresh" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    
                        <asp:Literal ID="litChat" runat="server"></asp:Literal>
            
                    <asp:Timer ID="timerRefresh" Interval="2123" runat="server" OnTick="timerRefresh_Tick">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
             </div>
             
             <br /> 
            <br />
            <input type="text" id="txtMsg" runat="server" 
                style="width:500px; height: 76px;"   
                onkeypress="checkEnter(event)" />
           
           <input type="image" id="btnSend"  src="Images/send.jpg"  onclick="CallSendMsg()"/>
            <input type="button" id="btnSend" value="发送" onclick="CallSendMsg()" /><br />
           <span id="typingNotification">状态: </span></asp:Panel>--%>
          
           
           
           <asp:Panel Height="100%" Width="100%"  ID="pnlChat" runat="server">
               <div >
               <table id="chatbox" cellpadding="0" cellspacing="0">
                
                <tr id="tdhead">
    <td>
      <div id="head">
      <span id="headerBox">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional" ChildrenAsTriggers="False">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="timerRefresh" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
          <asp:Label ID="lblOp" runat="server"   ></asp:Label> 
          </ContentTemplate>
            </asp:UpdatePanel>
      </span>
      <span 
    id="headerBoxTime">
     
    </span></div>
    
    </td>
    <td align="right"><a id="logo" href="#" 
      target="_blank">
      logo
      </a>
      </td>
      </tr>
           
           <tr id="notewrap">
            
            <td id="wrap" >
                
                <table cellpadding="0" cellspacing="0" 
                    style="height:100%;TABLE-LAYOUT: fixed; background-color:#d4eeff;" 
                    width="100%">
                    
                    <tr  style="height:100%">
                        <td height="100%"  >
                            <div id="chat" style=" background-color:#d4eeff;"> 
            <asp:UpdatePanel ID="upChat" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="timerRefresh" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    
                     <%--<textarea  id="litChat" runat="server" style="height:100% ; width:100%"  readonly="readonly" /> --%>
                         <asp:Literal  ID="litChat" runat="server"></asp:Literal>
                        <asp:Timer ID="timerRefresh" Interval="1000" runat="server" 
                         OnTick="timerRefresh_Tick">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
               
             </div>
           
                 <!--上传-->
          <div id="divSend" style="display:none; background-color:#d4eeff;" >&nbsp;&nbsp;
                <asp:FileUpload CssClass="file"  ID="fuFile" runat="server" Height="20px" Width="191"  />
              &nbsp;<asp:Button  ID="btnUpload" CssClass="btn" runat="server" Height="20px" Text="传送" Width="46px" onclick="btnUpload_Click" />&nbsp;
              <input ID="btnClose" class="btn" type="button" value="关闭" onclick="divClose('divSend')" />
                </div>  
            
                      
                        </td>
                        
                    </tr>
                  
                </table>
              
            </td>
            <td id="bwrap" valign="top">
                <div id="banner" style="display:none;">
                  
                </div>
            </td>
        </tr>
        <tr id="tdinput">
            <td id="twrap" colspan="2">
         
                <div id="tool_wrap">
                    <ul id="toolsbar">
                        <li id="file" onclick="divShow('divSend');">传送文件 </li>
                        <li id="save" class="open">保存记录 </li>
                        <li id="switch" class="open">关闭提示音 </li>
                        <li id="active" class="open">
                            <asp:LinkButton ID="CutLBtn" runat="server" onclick="CutLBtn_Click" 
                                Font-Underline="False" ForeColor="White">剪切</asp:LinkButton>
                        </li>
                        </ul>
                        
                   <div id="exitChat" >
                       
                          <asp:LinkButton ID="lkbExit" runat="server" Font-Underline="False" 
                              ForeColor="White" onclick="lkbExit_Click" >结束对话</asp:LinkButton>
                        </div>
                        </div>
                        </td>
                        </tr><tr id="msg">
            <td id="inputarea" style="height:100px; width:490px;">
              
                 
                 <textarea id="txtMsg" rows="2" runat="server" cols="50"   onkeypress="checkEnter(event)" />
                 
                  </td>
                 
                 <td  align="center">
                
                
                    <div id="enter" >
                    <!----发送--->
                    
          <input  type="image" id="btnSend"  src="Images/send.jpg"  onclick="CallSendMsg()"/>
          
           </div>
         
          
          </td>
          
          </tr></table>
          <img id="track" src="Images/track.gif" /> </div></asp:Panel>
          
          </div></form></body></html>

                  