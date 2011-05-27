<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" Title="欢迎登陆" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>欢迎登陆</title>
</head>
<body>    
    <div id='Login' style="margin-left:auto; margin-right:auto; margin-top:0px; background: url('images/login.jpg') no-repeat; width: 1280px; height: 655px">	  
	   <form action="Login.aspx" method="post" style="height:570px;">
	    <h1 style="padding: 100px 0px 0px 480px ">欢迎登陆物业管理系统</h1>
	   	<div  id="login-div" style="padding: 120px 10px 0 560px">	   	    
	   		<div style="text-align: left; float: left">
		   		<div style="width: 200">
					<input type="hidden" name="action" value="login">
			   		<label >用户名:</label>
			   		<input type="text" name="user" size="30" maxlength="12" style="width:150px">
		   		</div>
		   		<div style="width: 200;margin-top: 5px">
			   		<label >密&nbsp;&nbsp;码:</label>
			    	<input type="password" name="password" size="30"  style="width:150px">
		   		</div>
		   		<div style="width: 200;margin-top: 5px">
			   		<label >验证码:</label>
			    	<input name="yanzheng" style="width:150px" />&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" Width="60px" ImageUrl="png.aspx?aa2" />
		   		</div>
		   			   		
	   		</div>	  
	   		<div style="float: right; margin:30px 500px 0px 0px">
			    	<input type="image" src="images/deng.png" > 
			    	
		   	</div>
		   	<div id="error" style="margin: 10px 0 0 -20px; clear: left;  ">
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
<%--	   			<?php
	   				switch ($_REQUEST['error']) {
	   					case -1:
	   						echo "<span class='red'>用户名或密码错误,请重试!</span>";
	   					break;
	   					case -2:
	   						echo "<span class='red'>登录失败，账户已被禁用!</span>";
	   					break;
	   				}
	        	?>				
--%>		   	</div>
		   
<%--		   	<div style="margin: 20px 0 0 -60px;color:yellow; font-size: 9;clear: left">提示: 如有时输入用户名密码无法登陆时，请按F5刷新后重试。</div>
--%>		</div>
	        
	   </form>
	   <div style="text-align:center;margin-bottom:20px;">
	    <p style="font-size:10px;color:White">深圳市兴联兴投资有限公司&nbsp;&nbsp;版权所有&nbsp;&nbsp;  技术支持：互动科技有限公司</p> 
	</div>
	</div>
	
</body>
</html>