function denglu2()
{ 
if(document.form2.���.value=='')
	{ 
	 alert("��Ų���Ϊ��!");
	 document.form2.���.focus();
	 return false;
	 }
if(document.form2.���.value.length<1 | document.form2.���.value.length>4)
	{
	 alert('��ų���Ϊ1��4���ַ�');
	 document.form2.���.focus();
	 return false;
	}	
if(document.form2.���.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('���ֻ������')
	 document.form2.de_id1.focus();
	 return false;
    }	
	
	
	
if(document.form2.��������.value=='')
	{
	 alert('�������Ͳ���Ϊ��!');
	 document.form2.��������.focus();
	 return false;
	}
if(document.form2.��������.value.length<2 | document.form2.��������.value.length>20)
	{
	 alert('�������ͳ��Ȳ�����2');
	 document.form2.��ҵ԰����.focus();
	 return false;
    } 	
return true;
}