function denglu2()
{ 
if(document.form2.admin_id.value=='')
	{ 
	 alert("登陆ID不能为空!");
	 document.form2.admin_id.focus();
	 return false;
	 }
if(document.form2.admin_id.value.length<4 |document.form2.admin_id.value.length>20)
	{
	 alert('登陆ID长度为4到20个字符');
	 document.form2.admin_id.focus();
	 return false;
	}		
	
	
if(document.form2.admin_name.value=='')
	{
	 alert('姓名不能为空!');
	 document.form2.admin_name.focus();
	 return false;
	}
if(document.form2.admin_name.value.length<2 | document.form2.admin_name.value.length>4)
	{
	 alert('姓名长度为2-4个字符');
	 document.form2.admin_name.focus();
	 return false;
    } 	
	
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
	
if(document.form2.admin_limit.value=='请选择')
	{
	 alert('请选择角色');
	 document.form2.admin_limit.focus();
	 return false;
	}
return true;
}