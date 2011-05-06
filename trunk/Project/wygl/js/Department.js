function denglu()
{ 
if(document.form1.de_id1.value=='')
	{ 
	 alert("部门排序号不能为空!");
	 document.form1.de_id1.focus();
	 return false;
	 }
if(document.form1.de_id1.value.length<1 | document.form1.de_id1.value.length>4)
	{
	 alert('部门排序长度为1到4个字符');
	 document.form1.de_id1.focus();
	 return false;
	}	
if(document.form1.de_id1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('部门排序只有数字')
	 document.form1.de_id1.focus();
	 return false;
    }	
	
	
	
if(document.form1.de_name1.value=='')
	{
	 alert('部门名称不能为空!');
	 document.form1.de_name1.focus();
	 return false;
	}
if(document.form1.de_name1.value.length<2 | document.form1.de_name1.value.length>20)
	{
	 alert('部门名称长度不少于2');
	 document.form1.de_name1.focus();
	 return false;
    } 	

	
if(document.form1.de_tel1.value=='')
	{
	 alert('电话不能为空!');
	 document.form1.de_tel1.focus();
	 return false;
	}
if(document.form1.de_tel1.value.length<6 | document.form1.de_tel1.value.length>12)
	{
	 alert('电话号码长度不对');
	 document.form1.de_tel1.focus();
	 return false;
    } 	
if(document.form1.de_tel1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('电话只有数字')
	 document.form1.de_tel1.focus();
	 return false;
    }	


if(document.form1.de_fac1.value=='')
	{
	 alert('传真不能为空!');
	 document.form1.de_fac1.focus();
	 return false;
	}
if(document.form1.de_fac1.value.length<6 | document.form1.de_fac1.value.length>12)
	{
	 alert('传真号码长度不对');
	 document.form1.de_fac1.focus();
	 return false;
    } 	
if(document.form1.de_fac1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('传真只有数字')
	 document.form1.de_fac1.focus();
	 return false;
    }	
return true;
}