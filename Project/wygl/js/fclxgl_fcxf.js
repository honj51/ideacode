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
	 document.form1.���.focus();
	 return false;
    }	
	
	
if(document.form1.������Ŀ.value=='')
	{
	 alert('������Ŀ����Ϊ��!');
	 document.form1.������Ŀ.focus();
	 return false;
	}	
if(document.form1.������Ŀ.value.length<2 | document.form1.������Ŀ.value.length>20)
	{
	 alert('������Ŀ���Ȳ�����2');
	 document.form1.������Ŀ.focus();
	 return false;
    } 	
	
if(document.form1.��������.value=='��ѡ��')
	{
	 alert('��ѡ����������!');
	 document.form1.��������.focus();
	 return false;
	}
if(document.form1.���.value=='��ѡ��')
	{
	 alert('��ѡ�����ֵ!');
	 document.form1.���.focus();
	 return false;
	}
if(document.form1.���ɽ�.value=='��ѡ��')
	{
	 alert('��ѡ�����ɽ�ֵ!');
	 document.form1.���ɽ�.focus();
	 return false;
	}
	
if(document.form1.ֵ.value=='')
	{ 
	 alert("ֵ����Ϊ��!");
	 document.form1.ֵ.focus();
	 return false;
	 }
if(document.form1.ֵ.value.length<1 | document.form1.ֵ.value.length>10)
	{
	 alert('ֵ����Ϊ1��10���ַ�');
	 document.form1.ֵ.focus();
	 return false;
	}	

	
if(document.form1.˵��.value=='')
	{
	 alert('˵������Ϊ��!');
	 document.form1.˵��.focus();
	 return false;
	}	
if(document.form1.˵��.value.length<2 | document.form1.˵��.value.length>20)
	{
	 alert('˵�����Ȳ�����2');
	 document.form1.˵��.focus();
	 return false;
    } 	
	
return true;
}