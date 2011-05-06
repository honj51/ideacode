function denglu1()
{ 
if(document.form2.role_id1.value=='')
	{ 
	 alert("角色排序不能为空!");
	 document.form2.role_id1.focus();
	 return false;
	 }
if(document.form2.role_id1.value.length<1 |document.form2.role_id1.value.length>4)
	{
	 alert('单位名称长度为1到4个字符');
	 document.form2.role_id1.focus();
	 return false;
	}
if(document.form2.role_id1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('单位名称长度只有数字')
	 document.form2.role_id1.focus();
	 return false;
    }
	
	
	
if(document.form2.role_name1.value=='')
	{
	 alert('角色名称不能为空!');
	 document.form2.role_name1.focus();
	 return false;
	}
if(document.form2.role_name1.value.length<1 | document.form2.role_name1.value.length>3)
	{
	 alert('角色名称不能大于3');
	 document.form2.role_name1.focus();
	 return false;
    } 	
return true;
}