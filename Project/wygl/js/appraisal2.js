function denglu2()
{ 
if(document.form2.app_id.value=='')
	{ 
	 alert("һ����������Ų���Ϊ��!");
	 document.form2.app_id.focus();
	 return false;
	 }
if(document.form2.app_id.value.length<1 |document.form2.app_id.value.length>4)
	{
	 alert('һ����������ų���Ϊ1��4���ַ�');
	 document.form2.app_id.focus();
	 return false;
	}
if(document.form2.app_id.value.match(/^[0-9]\d*$/)==null)
	{
	 alert('һ�����������ֻ������')
	 document.form2.app_id.focus();
	 return false;
    }
	
	
if(document.form2.one_title.value=='')
	{
	 alert('һ�����ⲻ��Ϊ��!');
	 document.form2.one_title.focus();
	 return false;
	}
if(document.form2.one_title.value.length<2 | document.form2.one_title.value.length>20)
	{
	 alert('һ�����ⳤ�Ȳ���');
	 document.form2.one_title.focus();
	 return false;
    } 	

	
	
if(document.form2.use_role.value=='��ѡ��')
	{
	 alert('��ѡ��ʹ�ý�ɫ!');
	 document.form2.use_role.focus();
	 return false;
	}
if(document.form2.ping_role.value=='��ѡ��')
	{
	 alert('��ѡ�����۶���!');
	 document.form2.ping_role.focus();
	 return false;
	}	
if(document.form2.ping_fenshu.value=='��ѡ��')
	{
	 alert('��ѡ�������۷���!');
	 document.form2.ping_fenshu.focus();
	 return false;
	}	
return true;
}