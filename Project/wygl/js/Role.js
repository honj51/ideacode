function denglu()
{ 

	
if(document.form1.role_name.value=='')
	{
	 alert('��ɫ���Ʋ���Ϊ��!');
	 document.form1.role_name.focus();
	 return false;
	}
if(document.form1.role_name.value.length<1 | document.form1.role_name.value.length>10)
	{
	 alert('��ɫ���Ʋ��ܴ���3');
	 document.form1.role_name.focus();
	 return false;
    } 	
return true;
}