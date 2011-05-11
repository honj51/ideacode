<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" Title="无标题页" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <div id='Login' style="margin-left:auto; margin-right:auto; margin-top:100px; background: url('images/login-clip.jpg') no-repeat; width: 600px; height: 300px">	  
	   <form action="Login.aspx" method="post">
	   	<div  id="login-div" style="padding: 140px 10px 0 200px">
	   		<div style="text-align: left; float: left">
		   		<div style="width: 200">
					<input type="hidden" name="action" value="login">
			   		<label >用户名:</label>
			   		<input type="text" name="user" size="30" maxlength="12" style="width:150px">
		   		</div>
		   		<div style="width: 200;margin-top: 5px">
			   		<label >密码:</label>
			    	<input type="password" name="password" size="30"  style="width:150px">
		   		</div>		   		
	   		</div>	  
	   		<div style="float: right;">
			    	<input type="submit" style="width: 80;"  value="  登录  ">
		   	</div>
		   	<div id="error" style="margin: 10px 0 0 -20px; clear: left">
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
	</div>
</body>
</html>