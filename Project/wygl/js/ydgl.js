function denglu()
{ 
if(document.form1.客户名称.value=='请选择')
	{
	 alert('请选择客户名称!');
	 document.form1.客户名称.focus();
	 return false;
	}
	
	
if(document.form1.fh.value=='请选择')
	{
	 alert('请选择所属工业园!');
	 document.form1.fh.focus();
	 return false;
	}
	
	
if(document.form1.ch.value=='请选择')
	{
	 alert('请选择所属房产!');
	 document.form1.ch.focus();
	 return false;
	}
	
if(document.form1.年.value=='请选择')
	{
	 alert('请选择年');
	 document.form1.年.focus();
	 return false;
	}
	
	
if(document.form1.月.value=='请选择')
	{
	 alert('请选择月');
	 document.form1.月.focus();
	 return false;
	}
if(document.form1.日.value=='请选择')
	{
	 alert('请选择日');
	 document.form1.日.focus();
	 return false;
	}	
return true;
}