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
	
	
	
if(document.form2.��ҵ԰����.value=='')
	{
	 alert('��ҵ԰���Ʋ���Ϊ��!');
	 document.form2.��ҵ԰����.focus();
	 return false;
	}
if(document.form2.��ҵ԰����.value.length<2 | document.form2.��ҵ԰����.value.length>20)
	{
	 alert('��ҵ԰���Ƴ��Ȳ�����2');
	 document.form2.��ҵ԰����.focus();
	 return false;
    } 	

	
if(document.form2.��ҵ԰���.value=='')
	{
	 alert('��ҵ԰�������Ϊ��!');
	 document.form2.��ҵ԰���.focus();
	 return false;
	}
if(document.form2.��ҵ԰���.value.length<1 | document.form2.��ҵ԰���.value.length>20)
	{
	 alert('��ҵ԰������Ȳ���');
	 document.form2.de_tel1.focus();
	 return false;
    } 	
if(document.form2.��ҵ԰���.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��ҵ԰���ֻ������')
	 document.form2.de_tel1.focus();
	 return false;
    }	
return true;
}