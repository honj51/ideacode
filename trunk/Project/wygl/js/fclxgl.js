function denglu()
{ 
if(document.form1.���.value=='')
	{ 
	 alert("��Ų���Ϊ��!");
	 document.form1.���.focus();
	 return false;
	 }
if(document.form1.���.value.length<1 | document.form1.���.value.length>4)
	{
	 alert('��ų���Ϊ1��4���ַ�');
	 document.form1.���.focus();
	 return false;
	}	
if(document.form1.���.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('���ֻ������')
	 document.form1.de_id1.focus();
	 return false;
    }	
	
	
if(document.form1.��������.value=='')
	{
	 alert('�������Ͳ���Ϊ��!');
	 document.form1.��������.focus();
	 return false;
	}
	
if(document.form1.��������.value.length<2 | document.form1.��������.value.length>20)
	{
	 alert('�������ͳ��Ȳ�����2');
	 document.form1.��������.focus();
	 return false;
    } 	
return true;
}