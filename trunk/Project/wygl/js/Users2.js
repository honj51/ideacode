function denglu2()
{ 
if(document.form2.user_id.value=='')
	{ 
	 alert("��½ID����Ϊ��!");
	 document.form2.user_id.focus();
	 return false;
	 }
if(document.form2.user_id.value.length<4 |document.form2.user_id.value.length>20)
	{
	 alert('��½ID����Ϊ4��20���ַ�');
	 document.form2.user_id.focus();
	 return false;
	}		
	
	
if(document.form2.user_name.value=='')
	{
	 alert('��������Ϊ��!');
	 document.form2.user_name.focus();
	 return false;
	}
if(document.form2.user_name.value.length<2 | document.form2.user_name.value.length>4)
	{
	 alert('��������Ϊ2-4���ַ�');
	 document.form2.user_name.focus();
	 return false;
    } 	

	
	
if(document.form2.user_pwd.value=='')
	{
	 alert('���벻��Ϊ��!');
	 document.form2.user_pwd.focus();
	 return false;
	}
if(document.form2.user_pwd.value.length<4 | document.form2.user_pwd.value.length>20)
	{
	 alert('���볤�Ȳ�������4');
	 document.form2.user_pwd.focus();
	 return false;
    } 	
if(document.form2.user_pwd.value!=document.form2.user_pwd1.value)
	{
	 alert('�������벻һ��');
	 document.form2.user_pwd1.focus();
	 return false;
    } 	
	
	
if(document.form2.role_name.value=='��ѡ��')
	{
	 alert('��ѡ���ɫ');
	 document.form2.role_name.focus();
	 return false;
	}
	
	
if(document.form2.de_name.value=='��ѡ��')
	{
	 alert('��ѡ����');
	 document.form2.de_name.focus();
	 return false;
	}
if(document.form2.birthday_y.value=='��ѡ��')
	{
	 alert('��ѡ�����ա���');
	 document.form2.de_name.focus();
	 return false;
	}
if(document.form2.birthday_m.value=='��ѡ��')
	{
	 alert('��ѡ�����ա���');
	 document.form2.de_name.focus();
	 return false;
	}
if(document.form2.birthday_d.value=='��ѡ��')
	{
	 alert('��ѡ�����ա���');
	 document.form2.de_name.focus();
	 return false;
	}
return true;
}