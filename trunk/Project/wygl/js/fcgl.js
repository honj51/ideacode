function denglu()
{ 
if(document.form1.����.value=='')
	{
	 alert('���Ų���Ϊ��!');
	 document.form1.����.focus();
	 return false;
	}

if(document.form1.fh.value=='��ѡ��')
	{
	 alert('��ѡ��ҵ԰����!');
	 document.form1.fh.focus();
	 return false;
	}
	
	
if(document.form1.ch.value=='��ѡ��')
	{
	 alert('��ѡ�񷿲�����!');
	 document.form1.ch.focus();
	 return false;
	}

return true;
}