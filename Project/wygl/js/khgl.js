function denglu()
{ 
	
if(document.form1.����.value=='')
	{
	 alert('���Ʋ���Ϊ��!');
	 document.form1.����.focus();
	 return false;
	}
if(document.form1.����.value.length<2 | document.form1.����.value.length>15)
	{
	 alert('���Ƴ���Ϊ2-15���ַ�');
	 document.form1.����.focus();
	 return false;
    } 	

if(document.form1.����.value=='')
	{
	 alert('��������Ϊ��!');
	 document.form1.����.focus();
	 return false;
	}
if(document.form1.����.value.length<2 | document.form1.����.value.length>4)
	{
	 alert('��������Ϊ2-4���ַ�');
	 document.form1.����.focus();
	 return false;
    } 	
	
	
if(document.form1.������.value=='')
	{
	 alert('�����벻��Ϊ��!');
	 document.form1.������.focus();
	 return false;
	}
if(document.form1.������.value.length<4 | document.form1.������.value.length>20)
	{
	 alert('�����볤�Ȳ�������4');
	 document.form1.������.focus();
	 return false;
    } 	
	
if(document.form1.��.value=='��ѡ��')
	{
	 alert('��ѡ����');
	 document.form1.��.focus();
	 return false;
	}
	
	
if(document.form1.��.value=='��ѡ��')
	{
	 alert('��ѡ����');
	 document.form1.��.focus();
	 return false;
	}
if(document.form1.��.value=='��ѡ��')
	{
	 alert('��ѡ����');
	 document.form1.��.focus();
	 return false;
	}
if(document.form1.֤������.value=='��ѡ��')
	{
	 alert('��ѡ��֤������');
	 document.form1.֤������.focus();
	 return false;
	}
if(document.form1.֤������.value=='')
	{ 
	 alert("֤�����벻��Ϊ��!");
	 document.form1.֤������.focus();
	 return false;
	 }
if(document.form1.֤������.value.length<18| document.form1.֤������.value.length>19)
	{
	 alert('֤�����볤��Ϊ18���ַ�');
	 document.form1.֤������.focus();
	 return false;
	}	

	
if(document.form1.����.value=='��ѡ��')
	{
	 alert('��ѡ�񼮹�');
	 document.form1.����.focus();
	 return false;
	}
	
if(document.form1.��ϵ�绰.value=='')
	{ 
	 alert("��ϵ�绰����Ϊ��!");
	 document.form1.��ϵ�绰.focus();
	 return false;
	 }
if(document.form1.��ϵ�绰.value.length<11 | document.form1.��ϵ�绰.value.length>12)
	{
	 alert('��ϵ�绰����11���ַ�');
	 document.form1.��ϵ�绰.focus();
	 return false;
	}	
if(document.form1.��ϵ�绰.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('��ϵ�绰ֻ������')
	 document.form1.��ϵ�绰.focus();
	 return false;
    }

if(document.form1.��ϵ��ַ.value=='')
	{ 
	 alert("��ϵ��ַ����Ϊ��!");
	 document.form1.��ϵ��ַ.focus();
	 return false;
	 }
if(document.form1.��ϵ��ַ.value.length<4 | document.form1.��ϵ��ַ.value.length>30)
	{
	 alert('��ϵ��ַ����4��30���ַ�');
	 document.form1.��ϵ��ַ.focus();
	 return false;
	}	
if(document.form1.��ϵ��.value=='')
	{ 
	 alert("��ϵ�˲���Ϊ��!");
	 document.form1.��ϵ��.focus();
	 return false;
	 }
if(document.form1.��ϵ��.value.length<2 | document.form1.��ϵ��.value.length>4)
	{
	 alert('��ϵ�˳���2��4���ַ�');
	 document.form1.��ϵ��.focus();
	 return false;
	}	
		
return true;
}