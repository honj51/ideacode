function denglu()
{ 
if(document.form1.user_role.value=='请选择')
	{ 
	 alert("请选择评价角色!");
	 document.form1.user_role.focus();
	 return false;
	 }	
if(document.form1.ping_role.value=='请选择')
	{
	 alert('请选择被评价角色!');
	 document.form1.ping_role.focus();
	 return false;
	}
if(document.form1.qz.value=='请选择')
	{
	 alert('请选择权重!');
	 document.form1.qz.focus();
	 return false;
	}
return true;
}