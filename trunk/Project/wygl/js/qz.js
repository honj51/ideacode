function denglu()
{ 
if(document.form1.user_role.value=='��ѡ��')
	{ 
	 alert("��ѡ�����۽�ɫ!");
	 document.form1.user_role.focus();
	 return false;
	 }	
if(document.form1.ping_role.value=='��ѡ��')
	{
	 alert('��ѡ�����۽�ɫ!');
	 document.form1.ping_role.focus();
	 return false;
	}
if(document.form1.qz.value=='��ѡ��')
	{
	 alert('��ѡ��Ȩ��!');
	 document.form1.qz.focus();
	 return false;
	}
return true;
}