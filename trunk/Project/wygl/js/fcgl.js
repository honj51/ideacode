function denglu()
{ 
if(document.form1.房号.value=='')
	{
	 alert('房号不能为空!');
	 document.form1.房号.focus();
	 return false;
	}

if(document.form1.fh.value=='请选择')
	{
	 alert('请选择工业园名称!');
	 document.form1.fh.focus();
	 return false;
	}
	
	
if(document.form1.ch.value=='请选择')
	{
	 alert('请选择房产类型!');
	 document.form1.ch.focus();
	 return false;
	}

return true;
}