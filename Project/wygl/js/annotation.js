function denglu()
{ 
if(document.form1.title.value=='')
	{ 
	 alert("��ɫ������Ϊ��!");
	 document.form1.title.focus();
	 return false;
	 }
if(document.form1.title.value.length<2 |document.form1.title.value.length>20)
	{
	 alert('��λ���Ƴ���Ϊ2��20���ַ�');
	 document.form1.title.focus();
	 return false;
	}
var v = DoProcess();
	if(v != true){
	    alert("����������");
		return false;
	}	
return true;
}