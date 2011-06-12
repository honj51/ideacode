<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" Title="欢迎登陆" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
		 #loading-mask{
	        position:absolute;
	        left:0;
	        top:0;
	        width:100%;
	        height:100%;
	        z-index:20000;
	        background-color:white;
	    }
	    #loading{
	        position:absolute;
	        left:45%;
	        top:40%;
	        padding:2px;
	        z-index:20001;
	        height:auto;
	    }
	    #loading a {
	        color:#225588;
	    }
	    #loading .loading-indicator{
	        background:white;
	        color:#444;
	        font:bold 13px tahoma,arial,helvetica;
	        padding:10px;
	        margin:0;
	        height:auto;
	    }
	    #loading-msg {
	        font: normal 10px arial,tahoma,sans-serif;
	    }
		body {
			margin:0;padding:0;text-align:center;
			background-color: #e1f3ff ;
		}
		#login-div {
			margin: 0 auto; width: 300;
			vertical-align: middle;
		}
		#error {
			color: red;
		}
	</style>
    <title>欢迎登陆</title>
</head>
<body>    
    <div id="loading-mask" style=""></div>
	<div id="loading">
	    <div class="loading-indicator"><img src="images/extanim32.gif" width="32" height="32" style="margin-right:8px;float:left;vertical-align:top;"/>物业管理系统<br /><span id="loading-msg">载入图片和样式...</span></div>
	</div>
	<% if (Request.IsLocal)
	{
    %>
	<div>
	    <script type="text/javascript">document.getElementById('loading-msg').innerHTML = '载入样式...';</script>		
	    <link rel="stylesheet" type="text/css" href="http://localhost/extjs/resources/css/ext-all.css" />
        <link rel="stylesheet" type="text/css" href="http://localhost/extjs/examples/ux/css/ux-all.css" />
    	<script type="text/javascript">document.getElementById('loading-msg').innerHTML = '载入基础库...';</script>		
	    <script type="text/javascript" src="http://localhost/extjs/adapter/ext/ext-base.js"></script>
	    <script type="text/javascript">document.getElementById('loading-msg').innerHTML = '载入界面库...';</script>	    
	    <script type="text/javascript" src="http://localhost/extjs/ext-all.js"></script>
	    <script type="text/javascript" src="http://localhost/extjs/examples/ux/ux-all.js"></script>
        <script type="text/javascript" src="http://localhost/extjs/src/locale/ext-lang-zh_CN.js"></script>
	    <script type="text/javascript">document.getElementById('loading-msg').innerHTML = '初始化...';</script>
	    <script type="text/javascript">
	    	Ext.get('loading-mask').setVisible(false);
	    	Ext.get('loading').setVisible(false);
	    </script>	    
	</div>
    <%     
	} else {
	 %>
	<div>
	    <script type="text/javascript">document.getElementById('loading-msg').innerHTML = '载入样式...';</script>		
	    <link rel="stylesheet" type="text/css" href="ext/resources/css/ext-all.css" />
        <link rel="stylesheet" type="text/css" href="ext/examples/ux/css/ux-all.css" />
    	<script type="text/javascript">document.getElementById('loading-msg').innerHTML = '载入基础库...';</script>		
	    <script type="text/javascript" src="ext/adapter/ext/ext-base.js"></script>
	    <script type="text/javascript">document.getElementById('loading-msg').innerHTML = '载入界面库...';</script>	    
	    <script type="text/javascript" src="ext/ext-all.js"></script>
	    <script type="text/javascript" src="ext/examples/ux/ux-all.js"></script>
        <script type="text/javascript" src="ext/src/locale/ext-lang-zh_CN.js"></script>
	    <script type="text/javascript">document.getElementById('loading-msg').innerHTML = '初始化...';</script>
	    <script type="text/javascript">
	    	Ext.get('loading-mask').setVisible(false);
	    	Ext.get('loading').setVisible(false);
	    </script>	    
	</div>
    <%     
	} 
	 %>
    <div id='Login' style="margin-left:auto; margin-right:auto; margin-top:0px; background: url('images/login.jpg') no-repeat; width: 1280px; height: 655px">	  
	   <form action="Login.aspx" method="post" style="height:570px;">
	    <h1 style="padding: 160px 0px 0px 480px "></h1>
	   	<div  id="login-div" style="padding: 120px 10px 0 560px">	   	    
	   		<div style="text-align: left; float: left;width:368px;">
		   		<div style="width: 200">
					<input type="hidden" name="action" value="login">
			   		<label >用户名:</label>
			   		<input type="text" name="user" size="30" maxlength="12" style="width:150px">
		   		</div>
		   		<div style="width: 200;margin-top: 5px">
			   		<label >密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
			    	<input type="password" name="password" size="30"  style="width:150px">
		   		</div>
		   		<div style="width: 200;margin-top: 5px">
			   		<label >验证码:</label>
			    	<input name="yanzheng" style="width:150px" />&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" Width="60px" ImageUrl="png.aspx?aa2" />
		   		</div>
		   	    <div style="float:right;margin:20px 80px 20px 0px;">
			    	<input type="image" src="images/deng.png" > 
		   	    </div><br /><br /><br />		   		
		   	    <div style="float:right;width:200px;margin-right:50px;" id="error">
		   	        <% 
                        switch (Request.Params["error"])
                        {
                            case "-1":
                                Response.Write("<span style=\"color: Red\">用户名或密码错误,请重试!</span>");
                                break;
                            case "-2":
                                Response.Write("<span style=\"color: Red\">验证码错误,请重试!</span>");
                                break;
                            default:
                                break;
                        }        
		   	         %> 
    		   	</div>
    		   
    <%--		   	<div style="margin: 20px 0 0 -60px;color:yellow; font-size: 9;clear: left">提示: 如有时输入用户名密码无法登陆时，请按F5刷新后重试。</div>
    --%>		</div>
	        </div>	
	   </form>
	   <div style="text-align:center;margin-bottom:20px;">
	    <p style="font-size:10px;color:White">深圳市兴联兴投资有限公司&nbsp;&nbsp;版权所有&nbsp;&nbsp;  技术支持：互动科技有限公司</p> 
	</div>
	</div>
	
</body>
</html>