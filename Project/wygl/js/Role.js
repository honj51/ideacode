function denglu()
{ 

	
if(document.form1.role_name.value=='')
	{
	 alert('角色名称不能为空!');
	 document.form1.role_name.focus();
	 return false;
	}
if(document.form1.role_name.value.length<1 | document.form1.role_name.value.length>10)
	{
	 alert('角色名称不能大于3');
	 document.form1.role_name.focus();
	 return false;
    } 	
return true;
}