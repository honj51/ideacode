function denglu()
{ 
if(document.form1.app_id.value=='')
	{ 
	 alert("һ����������Ų���Ϊ��!");
	 document.form1.app_id.focus();
	 return false;
	 }
if(document.form1.app_id.value.length<1 |document.form1.app_id.value.length>4)
	{
	 alert('һ����������ų���Ϊ1��4���ַ�');
	 document.form1.app_id.focus();
	 return false;
	}
if(document.form1.app_id.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('һ�����������ֻ������')
	 document.form1.app_id.focus();
	 return false;
    }
	
	
if(document.form1.one_title.value=='')
	{
	 alert('һ�����ⲻ��Ϊ��!');
	 document.form1.one_title.focus();
	 return false;
	}
if(document.form1.one_title.value.length<2 | document.form1.one_title.value.length>20)
	{
	 alert('һ�����ⳤ�Ȳ���');
	 document.form1.one_title.focus();
	 return false;
    } 	

	
	
if(document.form1.use_role.value=='��ѡ��')
	{
	 alert('��ѡ��ʹ�ý�ɫ!');
	 document.form1.use_role.focus();
	 return false;
	}
if(document.form1.ping_role.value=='��ѡ��')
	{
	 alert('��ѡ�����۶���!');
	 document.form1.ping_role.focus();
	 return false;
	}	
if(document.form1.ping_fenshu.value=='��ѡ��')
	{
	 alert('��ѡ�������۷���!');
	 document.form1.ping_fenshu.focus();
	 return false;
	}	
return true;
}