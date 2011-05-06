function denglu2()
{ 
if(document.form2.结束年.value=='请选择')
	{
	 alert('请选择年');
	 document.form2.结束年.focus();
	 return false;
	}
	
	
if(document.form2.结束月.value=='请选择')
	{
	 alert('请选择月');
	 document.form2.结束月.focus();
	 return false;
	}
if(document.form2.结束日.value=='请选择')
	{
	 alert('请选择日');
	 document.form2.结束日.focus();
	 return false;
	}		
return true;
}