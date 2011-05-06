function denglu()
{ 
if(document.form1.序号.value=='')
	{ 
	 alert("序号不能为空!");
	 document.form1.序号.focus();
	 return false;
	 }
if(document.form1.序号.value.length<1 | document.form1.序号.value.length>4)
	{
	 alert('序号长度为1到4个字符');
	 document.form1.序号.focus();
	 return false;
	}	
if(document.form1.序号.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('序号只有数字')
	 document.form1.序号.focus();
	 return false;
    }	
	
	
if(document.form1.消费项目.value=='')
	{
	 alert('消费项目不能为空!');
	 document.form1.消费项目.focus();
	 return false;
	}	
if(document.form1.消费项目.value.length<2 | document.form1.消费项目.value.length>20)
	{
	 alert('消费项目长度不少于2');
	 document.form1.消费项目.focus();
	 return false;
    } 	
	
if(document.form1.消费类型.value=='请选择')
	{
	 alert('请选择消费类型!');
	 document.form1.消费类型.focus();
	 return false;
	}
if(document.form1.损耗.value=='请选择')
	{
	 alert('请选择损耗值!');
	 document.form1.损耗.focus();
	 return false;
	}
if(document.form1.滞纳金.value=='请选择')
	{
	 alert('请选择滞纳金值!');
	 document.form1.滞纳金.focus();
	 return false;
	}
	
if(document.form1.值.value=='')
	{ 
	 alert("值不能为空!");
	 document.form1.值.focus();
	 return false;
	 }
if(document.form1.值.value.length<1 | document.form1.值.value.length>10)
	{
	 alert('值长度为1到10个字符');
	 document.form1.值.focus();
	 return false;
	}	

	
if(document.form1.说明.value=='')
	{
	 alert('说明不能为空!');
	 document.form1.说明.focus();
	 return false;
	}	
if(document.form1.说明.value.length<2 | document.form1.说明.value.length>20)
	{
	 alert('说明长度不少于2');
	 document.form1.说明.focus();
	 return false;
    } 	
	
return true;
}