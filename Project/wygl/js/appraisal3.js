function denglu3()
{ 
if(document.form3.two_id2.value=='')
	{ 
	 alert("������������Ų���Ϊ��!");
	 document.form3.two_id2.focus();
	 return false;
	 }
if(document.form3.two_id2.value.length<1 |document.form3.two_id2.value.length>4)
	{
	 alert('������������ų���Ϊ1��4���ַ�');
	 document.form3.two_id2.focus();
	 return false;
	}
if(document.form3.two_id2.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('�������������ֻ������')
	 document.form3.two_id2.focus();
	 return false;
    }
	
	
if(document.form3.two_title2.value=='')
	{
	 alert('�������ⲻ��Ϊ��!');
	 document.form3.two_title2.focus();
	 return false;
	}
if(document.form3.two_title2.value.length<2 | document.form3.two_title2.value.length>40)
	{
	 alert('�������ⳤ�Ȳ���');
	 document.form3.two_title2.focus();
	 return false;
    } 	

return true;
}