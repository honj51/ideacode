<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat3333.aspx.cs" Inherits="chat3333" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>无标题页</title>
   
   <style type="text/css">
.unnamed1 {
        height: 100%;
        width: 100%;
}
body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
}
     
       
     
   </style>
 
</head>
<body>

      
       <table id="chatbox" cellpadding="0" cellspacing="0">
                
       <tr style=" background-image:url(Images/title_bg.gif)">
    <td>
      
    
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
                    
                    
                         <asp:Literal  ID="litChat" runat="server"></asp:Literal>
                        <asp:Timer ID="timerRefresh" Interval="1000" runat="server" 
                        >
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
               
             </div>
           
                 <!--上传-->
          <div id="uploadFileBox" style="display:none; background-color:#d4eeff;" >&nbsp;&nbsp;
                <asp:FileUpload CssClass="file"  ID="fuFile" runat="server" Height="20px" Width="191"  />
              &nbsp;<asp:Button  ID="btnUpload" CssClass="btn" runat="server" Height="20px" Text="传送" Width="46px"  />&nbsp;
              <input ID="btnClose" class="btn" type="button" value="关闭" onclick="divClose('uploadFileBox')" />
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
                        <li id="file" onclick="divShow('uploadFileBox');">传送文件 </li>
                        <li id="save" class="open">保存记录 </li>
                        <li id="switch" class="open">关闭提示音 </li>
                        <li id="active" class="open">
                            <asp:LinkButton ID="CutLBtn" runat="server" 
                                Font-Underline="False" ForeColor="White">剪切</asp:LinkButton>
                        </li>
                        </ul>
                        
                   <div id="exitChat" >
                       
                          <asp:LinkButton ID="lkbExit" runat="server" Font-Underline="False" 
                              ForeColor="White"  >结束对话</asp:LinkButton>
                        </div>
                        </div>
                        </td>
                        
                        </tr>
                        
                        <tr id="msg">
            <td id="inputarea" style="height:100px; width:490px;">
              
                 
                 <textarea id="txtMsg" rows="2" runat="server" cols="50"   onkeypress="checkEnter(event)" />
                 
                  </td>
                 
                 <td  align="center">
                
                
                    <div id="enter" >
                 
                    
          <input  type="image" id="btnSend"  src="Images/send0.jpg"  onclick="CallSendMsg()"/>
          
           </div>
         
          
          </td>
          
          </tr></table>
   
</body>
</html>
