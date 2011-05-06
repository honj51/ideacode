function denglu()
{ 
if(document.form1.admin_user.value=='')
	{ 
	 alert("用户名不能为空!");
	 document.form1.admin_user.focus();
	 return false;
	 }
if(document.form1.admin_user.value.length<4 |document.form1.admin_user.value.length>20)
	{
	 alert('用户名长度不对');
	 document.form1.admin_user.focus();
	 return false;
	}		
if(document.form1.admin_pwd.value=='')
	{
	 alert('密码不能为空!');
	 document.form1.admin_pwd.focus();
	 return false;
	}
if(document.form1.admin_pwd.value.length<4 | document.form1.admin_pwd.value.length>20)
	{
	 alert('密码长度不对');
	 document.form1.admin_pwd.focus();
	 return false;
    } 	
if(document.form1.reg.value=='')
    {
	 alert('验证码不能为空');
	 document.form1.reg.focus();
	 return false;
	}
if(document.form1.reg.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('验证码只有数字')
	 document.form1.reg.focus();
	 return false;
    }
if(document.form1.reg.value.length<4 | document.form1.reg.value.length>4)
	{
	 alert('验证码长度为4');
	 document.form1.reg.focus();
	 return false;
	} 	
return true;
}