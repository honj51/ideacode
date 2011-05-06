function denglu()
{ 
if(document.form1.客户名称.value=='请选择')
	{
	 alert('请选择客户名称');
	 document.form1.客户名称.focus();
	 return false;
	}
if(document.form1.fh.value=='请选择')
	{
	 alert('请选择所属工业园');
	 document.form1.fh.focus();
	 return false;
	}
	
if(document.form1.ch.value=='请选择' | document.form1.ch.value=='' )
	{
	 alert('请选择所属房产');
	 document.form1.ch.focus();
	 return false;
	}	
if(document.form1.开始年.value=='请选择')
	{
	 alert('请选择年');
	 document.form1.开始年.focus();
	 return false;
	}
	
	
if(document.form1.开始月.value=='请选择')
	{
	 alert('请选择月');
	 document.form1.开始月.focus();
	 return false;
	}
if(document.form1.开始日.value=='请选择')
	{
	 alert('请选择日');
	 document.form1.开始日.focus();
	 return false;
	}		
	
if(document.form1.结束年.value=='请选择')
	{
	 alert('请选择年');
	 document.form1.结束年.focus();
	 return false;
	}
	
	
if(document.form1.结束月.value=='请选择')
	{
	 alert('请选择月');
	 document.form1.结束月.focus();
	 return false;
	}
if(document.form1.结束日.value=='请选择')
	{
	 alert('请选择日');
	 document.form1.结束日.focus();
	 return false;
	}		
return true;
}