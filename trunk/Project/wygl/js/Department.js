function denglu()
{ 
if(document.form1.de_id1.value=='')
	{ 
	 alert("��������Ų���Ϊ��!");
	 document.form1.de_id1.focus();
	 return false;
	 }
if(document.form1.de_id1.value.length<1 | document.form1.de_id1.value.length>4)
	{
	 alert('�������򳤶�Ϊ1��4���ַ�');
	 document.form1.de_id1.focus();
	 return false;
	}	
if(document.form1.de_id1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��������ֻ������')
	 document.form1.de_id1.focus();
	 return false;
    }	
	
	
	
if(document.form1.de_name1.value=='')
	{
	 alert('�������Ʋ���Ϊ��!');
	 document.form1.de_name1.focus();
	 return false;
	}
if(document.form1.de_name1.value.length<2 | document.form1.de_name1.value.length>20)
	{
	 alert('�������Ƴ��Ȳ�����2');
	 document.form1.de_name1.focus();
	 return false;
    } 	

	
if(document.form1.de_tel1.value=='')
	{
	 alert('�绰����Ϊ��!');
	 document.form1.de_tel1.focus();
	 return false;
	}
if(document.form1.de_tel1.value.length<6 | document.form1.de_tel1.value.length>12)
	{
	 alert('�绰���볤�Ȳ���');
	 document.form1.de_tel1.focus();
	 return false;
    } 	
if(document.form1.de_tel1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('�绰ֻ������')
	 document.form1.de_tel1.focus();
	 return false;
    }	


if(document.form1.de_fac1.value=='')
	{
	 alert('���治��Ϊ��!');
	 document.form1.de_fac1.focus();
	 return false;
	}
if(document.form1.de_fac1.value.length<6 | document.form1.de_fac1.value.length>12)
	{
	 alert('������볤�Ȳ���');
	 document.form1.de_fac1.focus();
	 return false;
    } 	
if(document.form1.de_fac1.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('����ֻ������')
	 document.form1.de_fac1.focus();
	 return false;
    }	
return true;
}