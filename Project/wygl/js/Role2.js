function denglu1()
{ 
if(document.form2.role_id1.value=='')
	{ 
	 alert("��ɫ������Ϊ��!");
	 document.form2.role_id1.focus();
	 return false;
	 }
if(document.form2.role_id1.value.length<1 |document.form2.role_id1.value.length>4)
	{
	 alert('��λ���Ƴ���Ϊ1��4���ַ�');
	 document.form2.role_id1.focus();
	 return false;
	}
if(document.form2.role_id1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��λ���Ƴ���ֻ������')
	 document.form2.role_id1.focus();
	 return false;
    }
	
	
	
if(document.form2.role_name1.value=='')
	{
	 alert('��ɫ���Ʋ���Ϊ��!');
	 document.form2.role_name1.focus();
	 return false;
	}
if(document.form2.role_name1.value.length<1 | document.form2.role_name1.value.length>3)
	{
	 alert('��ɫ���Ʋ��ܴ���3');
	 document.form2.role_name1.focus();
	 return false;
    } 	
return true;
}