function denglu2()
{ 
if(document.form2.app_id.value=='')
	{ 
	 alert("一级标题列序号不能为空!");
	 document.form2.app_id.focus();
	 return false;
	 }
if(document.form2.app_id.value.length<1 |document.form2.app_id.value.length>4)
	{
	 alert('一级标题列序号长度为1到4个字符');
	 document.form2.app_id.focus();
	 return false;
	}
if(document.form2.app_id.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('一级标题列序号只有数字')
	 document.form2.app_id.focus();
	 return false;
    }
	
	
if(document.form2.one_title.value=='')
	{
	 alert('一级标题不能为空!');
	 document.form2.one_title.focus();
	 return false;
	}
if(document.form2.one_title.value.length<2 | document.form2.one_title.value.length>20)
	{
	 alert('一级标题长度不对');
	 document.form2.one_title.focus();
	 return false;
    } 	

	
	
if(document.form2.use_role.value=='请选择')
	{
	 alert('请选择使用角色!');
	 document.form2.use_role.focus();
	 return false;
	}
if(document.form2.ping_role.value=='请选择')
	{
	 alert('请选择评价对象!');
	 document.form2.ping_role.focus();
	 return false;
	}	
if(document.form2.ping_fenshu.value=='请选择')
	{
	 alert('请选择评评价分数!');
	 document.form2.ping_fenshu.focus();
	 return false;
	}	
return true;
}