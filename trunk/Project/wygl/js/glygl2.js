function denglu2()
{ 
if(document.form2.admin_id.value=='')
	{ 
	 alert("��½ID����Ϊ��!");
	 document.form2.admin_id.focus();
	 return false;
	 }
if(document.form2.admin_id.value.length<4 |document.form2.admin_id.value.length>20)
	{
	 alert('��½ID����Ϊ4��20���ַ�');
	 document.form2.admin_id.focus();
	 return false;
	}		
	
	
if(document.form2.admin_name.value=='')
	{
	 alert('��������Ϊ��!');
	 document.form2.admin_name.focus();
	 return false;
	}
if(document.form2.admin_name.value.length<2 | document.form2.admin_name.value.length>4)
	{
	 alert('��������Ϊ2-4���ַ�');
	 document.form2.admin_name.focus();
	 return false;
    } 	
	
if(document.form2.admin_pwd.value=='')
	{
	 alert('���벻��Ϊ��!');
	 document.form2.admin_pwd.focus();
	 return false;
	}
if(document.form2.admin_pwd.value.length<4 | document.form2.admin_pwd.value.length>20)
	{
	 alert('���볤�Ȳ�������4');
	 document.form2.admin_pwd.focus();
	 return false;
    } 	
if(document.form2.admin_pwd.value!=document.form2.admin_pwd1.value)
	{
	 alert('�������벻һ��');
	 document.form2.admin_pwd.focus();
	 return false;
    } 	
	
if(document.form2.admin_limit.value=='��ѡ��')
	{
	 alert('��ѡ���ɫ');
	 document.form2.admin_limit.focus();
	 return false;
	}
return true;
}