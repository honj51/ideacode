function denglu4()
{ 
if(document.form4.two_id.value=='')
	{ 
	 alert("������������Ų���Ϊ��!");
	 document.form4.two_id.focus();
	 return false;
	 }
if(document.form4.two_id.value.length<1 |document.form4.two_id.value.length>4)
	{
	 alert('������������ų���Ϊ1��4���ַ�');
	 document.form4.two_id.focus();
	 return false;
	}
if(document.form4.two_id.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('�������������ֻ������')
	 document.form4.two_id.focus();
	 return false;
    }
	
	
if(document.form4.two_title.value=='')
	{
	 alert('�������ⲻ��Ϊ��!');
	 document.form4.two_title.focus();
	 return false;
	}
if(document.form4.two_title.value.length<2 | document.form4.two_title.value.length>40)
	{
	 alert('�������ⳤ�Ȳ���');
	 document.form4.two_title.focus();
	 return false;
    } 	

return true;
}