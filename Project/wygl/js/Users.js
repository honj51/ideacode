function denglu()
{ 
if(document.form1.user_id.value=='')
	{ 
	 alert("��½ID����Ϊ��!");
	 document.form1.user_id.focus();
	 return false;
	 }
if(document.form1.user_id.value.length<4 |document.form1.user_id.value.length>20)
	{
	 alert('��½ID����Ϊ4��20���ַ�');
	 document.form1.user_id.focus();
	 return false;
	}		
	
	
if(document.form1.user_name.value=='')
	{
	 alert('��������Ϊ��!');
	 document.form1.user_name.focus();
	 return false;
	}
if(document.form1.user_name.value.length<2 | document.form1.user_name.value.length>4)
	{
	 alert('��������Ϊ2-4���ַ�');
	 document.form1.user_name.focus();
	 return false;
    } 	

	
	
if(document.form1.user_pwd.value=='')
	{
	 alert('���벻��Ϊ��!');
	 document.form1.user_pwd.focus();
	 return false;
	}
if(document.form1.user_pwd.value.length<4 | document.form1.user_pwd.value.length>20)
	{
	 alert('���볤�Ȳ�������4');
	 document.form1.user_pwd.focus();
	 return false;
    } 	
if(document.form1.user_pwd.value!=document.form1.user_pwd1.value)
	{
	 alert('�������벻һ��');
	 document.form1.user_pwd1.focus();
	 return false;
    } 	
	
	
if(document.form1.role_name.value=='��ѡ��')
	{
	 alert('��ѡ���ɫ');
	 document.form1.role_name.focus();
	 return false;
	}
	
	
if(document.form1.de_name.value=='��ѡ��')
	{
	 alert('��ѡ����');
	 document.form1.de_name.focus();
	 return false;
	}
if(document.form1.birthday_y.value=='��ѡ��')
	{
	 alert('��ѡ�����ա���');
	 document.form1.de_name.focus();
	 return false;
	}
if(document.form1.birthday_m.value=='��ѡ��')
	{
	 alert('��ѡ�����ա���');
	 document.form1.de_name.focus();
	 return false;
	}
if(document.form1.birthday_d.value=='��ѡ��')
	{
	 alert('��ѡ�����ա���');
	 document.form1.de_name.focus();
	 return false;
	}
return true;
}