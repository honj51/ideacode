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
	
	
	
if(document.form1.��ҵ԰����.value=='')
	{
	 alert('��ҵ԰���Ʋ���Ϊ��!');
	 document.form1.��ҵ԰����.focus();
	 return false;
	}
if(document.form1.��ҵ԰����.value.length<2 | document.form1.��ҵ԰����.value.length>20)
	{
	 alert('��ҵ԰���Ƴ��Ȳ�����2');
	 document.form1.��ҵ԰����.focus();
	 return false;
    } 	

	
if(document.form1.��ҵ԰���.value=='')
	{
	 alert('��ҵ԰�������Ϊ��!');
	 document.form1.��ҵ԰���.focus();
	 return false;
	}
if(document.form1.��ҵ԰���.value.length<1 | document.form1.��ҵ԰���.value.length>20)
	{
	 alert('��ҵ԰������Ȳ���');
	 document.form1.de_tel1.focus();
	 return false;
    } 	
if(document.form1.��ҵ԰���.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��ҵ԰���ֻ������')
	 document.form1.de_tel1.focus();
	 return false;
    }	
return true;
}