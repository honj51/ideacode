function denglu2()
{ 
if(document.form2.de_id.value=='')
	{ 
	 alert("部门排序号不能为空!");
	 document.form2.de_id.focus();
	 return false;
	 }
if(document.form2.de_id.value.length<1 | document.form2.de_id.value.length>4)
	{
	 alert('部门排序长度为1到4个字符');
	 document.form2.de_id.focus();
	 return false;
	}	
if(document.form2.de_id.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('部门排序只有数字')
	 document.form2.de_id.focus();
	 return false;
    }	
	
	
	
if(document.form2.de_name.value=='')
	{
	 alert('部门名称不能为空!');
	 document.form2.de_name.focus();
	 return false;
	}
if(document.form2.de_name.value.length<2 | document.form2.de_name.value.length>20)
	{
	 alert('部门名称长度不少于2');
	 document.form2.de_name.focus();
	 return false;
    } 	

	
if(document.form2.de_tel.value=='')
	{
	 alert('电话不能为空!');
	 document.form2.de_tel.focus();
	 return false;
	}
if(document.form2.de_tel.value.length<6 | document.form2.de_tel.value.length>12)
	{
	 alert('电话号码长度不对');
	 document.form2.de_tel.focus();
	 return false;
    } 	
if(document.form2.de_tel.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('电话只有数字')
	 document.form2.de_tel.focus();
	 return false;
    }	


if(document.form2.de_fac1.value=='')
	{
	 alert('传真不能为空!');
	 document.form2.de_fac1.focus();
	 return false;
	}
if(document.form2.de_fac1.value.length<6 | document.form2.de_fac1.value.length>12)
	{
	 alert('传真号码长度不对');
	 document.form2.de_fac1.focus();
	 return false;
    } 	
if(document.form2.de_fac1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('传真只有数字')
	 document.form2.de_fac1.focus();
	 return false;
    }	
return true;
}