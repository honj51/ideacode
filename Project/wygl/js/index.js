function denglu()
{ 
if(document.form1.admin_user.value=='')
	{ 
	 alert("�û�������Ϊ��!");
	 document.form1.admin_user.focus();
	 return false;
	 }
if(document.form1.admin_user.value.length<4 |document.form1.admin_user.value.length>20)
	{
	 alert('�û������Ȳ���');
	 document.form1.admin_user.focus();
	 return false;
	}		
if(document.form1.admin_pwd.value=='')
	{
	 alert('���벻��Ϊ��!');
	 document.form1.admin_pwd.focus();
	 return false;
	}
if(document.form1.admin_pwd.value.length<4 | document.form1.admin_pwd.value.length>20)
	{
	 alert('���볤�Ȳ���');
	 document.form1.admin_pwd.focus();
	 return false;
    } 	
if(document.form1.reg.value=='')
    {
	 alert('��֤�벻��Ϊ��');
	 document.form1.reg.focus();
	 return false;
	}
if(document.form1.reg.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��֤��ֻ������')
	 document.form1.reg.focus();
	 return false;
    }
if(document.form1.reg.value.length<4 | document.form1.reg.value.length>4)
	{
	 alert('��֤�볤��Ϊ4');
	 document.form1.reg.focus();
	 return false;
	} 	
return true;
}