function denglu2()
{ 

if(document.form2.admin_pwd.value=='')
	{
	 alert('密码不能为空!');
	 document.form2.admin_pwd.focus();
	 return false;
	}
if(document.form2.admin_pwd.value.length<4 | document.form2.admin_pwd.value.length>20)
	{
	 alert('密码长度不能少于4');
	 document.form2.admin_pwd.focus();
	 return false;
    } 	
if(document.form2.admin_pwd.value!=document.form2.admin_pwd1.value)
	{
	 alert('两次密码不一样');
	 document.form2.admin_pwd.focus();
	 return false;
    } 
return true;
}