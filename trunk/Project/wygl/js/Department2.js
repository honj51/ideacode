function denglu2()
{ 
if(document.form2.de_id.value=='')
	{ 
	 alert("��������Ų���Ϊ��!");
	 document.form2.de_id.focus();
	 return false;
	 }
if(document.form2.de_id.value.length<1 | document.form2.de_id.value.length>4)
	{
	 alert('�������򳤶�Ϊ1��4���ַ�');
	 document.form2.de_id.focus();
	 return false;
	}	
if(document.form2.de_id.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��������ֻ������')
	 document.form2.de_id.focus();
	 return false;
    }	
	
	
	
if(document.form2.de_name.value=='')
	{
	 alert('�������Ʋ���Ϊ��!');
	 document.form2.de_name.focus();
	 return false;
	}
if(document.form2.de_name.value.length<2 | document.form2.de_name.value.length>20)
	{
	 alert('�������Ƴ��Ȳ�����2');
	 document.form2.de_name.focus();
	 return false;
    } 	

	
if(document.form2.de_tel.value=='')
	{
	 alert('�绰����Ϊ��!');
	 document.form2.de_tel.focus();
	 return false;
	}
if(document.form2.de_tel.value.length<6 | document.form2.de_tel.value.length>12)
	{
	 alert('�绰���볤�Ȳ���');
	 document.form2.de_tel.focus();
	 return false;
    } 	
if(document.form2.de_tel.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('�绰ֻ������')
	 document.form2.de_tel.focus();
	 return false;
    }	


if(document.form2.de_fac1.value=='')
	{
	 alert('���治��Ϊ��!');
	 document.form2.de_fac1.focus();
	 return false;
	}
if(document.form2.de_fac1.value.length<6 | document.form2.de_fac1.value.length>12)
	{
	 alert('������볤�Ȳ���');
	 document.form2.de_fac1.focus();
	 return false;
    } 	
if(document.form2.de_fac1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('����ֻ������')
	 document.form2.de_fac1.focus();
	 return false;
    }	
return true;
}