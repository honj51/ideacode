<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetCode.aspx.cs" Inherits="Default2" Title="�ޱ���ҳ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
   <center style="">
   <img src="Images/bg3.jpg" style="width: 765px" />
   <table style="width:765px; height: 689px;" >
   <tr>
 <!--Left-->
 <td valign="top">
<div><img src="Images/left_12.gif" /></div>
<!--����-->
<div style="height: 180px; background-image:url('Images/zhongjian.bmp'); ">
<LINK href="Images/sdmenu.css" type=text/css rel=stylesheet>
<SCRIPT src="Images/sdmenu.js" type="text/javascript">
</SCRIPT>
<SCRIPT type="text/javascript">
		// <![CDATA[
		var myMenu;
		window.onload = function() {
			myMenu = new SDMenu("my_menu");
			//myMenu.remember = true
			myMenu.oneSmOnly = true;  
			myMenu.init();
			var firstSubmenu = myMenu.submenus[1];
			myMenu.expandMenu(firstSubmenu);  
			
		}
		function editCode() {
		    var is = document.getElementById('IcoStyle');
		    var as = document.getElementById('AutoStyle');
		    var cs = document.getElementById('ChatStyle');
		    var str1 = "<script src='http://localhost:3355/livechat/LSBanner.ashx?aid=<%=this.GetAccountId().ToString() %>";
		    str1 = str1 + "&IconStyle="+is.value+"&InviteStyle="+as.value+"&ChatStyle="+cs.value;
		    var str2 = "'></s" + "cript>";
		    var locations = document.getElementsByName('icoLocation');
		    var kf_fixeds = document.getElementsByName('kf_fixed');
		    for(var i=0;i<locations.length;i++)
		    {
		        if(locations[i].checked) {
		            str1 = str1 + "&IcoLocation="+locations[i].value;
		            break;
		        }
		    }
		    for (var i = 0; i < kf_fixeds.length; i++) {
		        if (kf_fixeds[i].checked) {
		            str1 =str1+"&KF_fixed=" + kf_fixeds[i].value;
		            break;
		        }
		    }
		    document.getElementById('codepic0').value = str1 + str2;
		}
		//��ʾ�ͷ�ͼƬ
		function showIcoImg(Ico) {
		    editCode();
		    var icos = document.getElementsByName('IcoImage');
		    var i = 0;
		    for (i; i <icos.length; i++) {
		        if (i == Ico.value) {
		            icos[i].style.display = 'block';
		        }
		        else {
		            icos[i].style.display = 'none';
		        }
		    }
		}
		function showAutoImg(at) {
		    editCode();
		    var icos = document.getElementsByName('AutoImage');
		    var i = 0;
		    for (i; i < icos.length; i++) {
		        if (i == at.value) {
		            icos[i].style.display = 'block';
		        }
		        else {
		            icos[i].style.display = 'none';
		        }
		    }
		}
		function showChatImage(ci) {

		    editCode();
		    var icos = document.getElementsByName('ChatImage');
		    var i = 0;
		    for (i; i < icos.length; i++) {
		        if (i == ci.value) {
		            icos[i].style.display = 'block';
		        }
		        else {
		            icos[i].style.display = 'none';
		        }
		    }
		}
	</SCRIPT>
<DIV class=sdmenu id=my_menu> 

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">��������</SPAN> 
<A href="AccountHome.aspx" >��˾��Ϣ</A>
<A href="UpdateAccount.aspx" >��˾�˺Ź���</A>

</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�ͷ�����</SPAN> 
<A href="DepartmentManager.aspx">��������</A> 
<A href="OperatorsManagment.aspx" >�ͷ�����</A> 
 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�������</SPAN> 
 
<A href="GetCode.aspx">��ȡ��������</A> 
<A href="#">����������</A> 
 
<A href="#">�Ի���ʾ����</A> 
<A href="#">������������</A>
 
</DIV>

<DIV class=collapsed><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">���ݷ��� (New)</SPAN> 
<A href="#">����ͳ�� </A>
<A href="#">��ѯ��ͳ��</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�����¼</SPAN> 
<A href="#">�����¼</A> <A href="#">�ÿ�����</A> 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">�ͻ�����</SPAN> 
<A href="#">��ӿͻ�</A> 
<A href="#">�ͻ��б�</A> 
 
 
</DIV>

<DIV><SPAN style="COLOR:White; background-image:url('Images/3.jpg');">��ѵ绰����</SPAN> 
<A onclick="return open_url('#')" href="#">��ѵ绰����</A> 
<A onclick="return open_url('#')" href="#">���ù�˾��ѵ绰</A> 
</DIV> 
&nbsp;</DIV>
</div>
</div>
<!--��������-->
<div><img src="Images/abc.bmp" /></div>
 
   </td>
<!--right-->
<td style="width: 583px;" valign="top">
 <div><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;">
     �ֶ���װ����</div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
 
<div style="margin-top:5px;"><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></div>
 <div style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px; ">
    <!--ͷ��--->
      <div id="content-main-three-column" style="text-align:left;">
        <!--����-->
      <TABLE style=" width:510px; text-align:left;" cellSpacing=1 cellPadding=0 border=1>
  <TBODY>
  <TR>
    <TD colSpan=3>�ͷ�ͼ�����</TD></TR>
  <tr><td>�ͷ�ͼ����</td><td valign="top"><select id="IcoStyle" onchange="showIcoImg(this);">
    <option value="0">���һ</option>
    <option value="1">����</option>
    <option value="2">�����</option>
    <option value="3">�����</option>
  </select></td><td align="right"><div>
          <img name="IcoImage" src="Images/1-2.jpg" style="height: 70px; display:block; width: 160px;" />
          <img name="IcoImage" src="Images/2-2.gif" style="height: 70px; width: 160px; display:none;" />
          <img name="IcoImage" src="Images/3-2.gif" style="height: 70px; display:none; width: 160px;" />
          <img name="IcoImage" src="Images/4-2.gif" style="height: 70px; width:160px; display:none;" /></div></td></tr>
  <tr><td>����������</td><td valign="top">
  <select name="AutoStyle" onchange='showAutoImg(this)'>
    <option value="0">���һ</option>
    <option value="1">����</option>
    <option value="2">�����</option>
    <option value="3">�����</option>
  </select></td><td align="right">
          <img name="AutoImage" src="Images/1-3.gif" style="width: 340px; height: 127px; display:block;" />
          <img name="AutoImage" src="Images/2-3.gif" style="width: 340px; height: 127px; display:none;" />
          <img name="AutoImage" src="Images/3-3.gif" style="width: 340px; height: 127px; display:none;" />
          <img name="AutoImage" src="Images/4-3.gif" style="width: 340px; height: 127px; display:none;" />
          </td></tr>
   <tr><td>����ҳ����</td><td valign="top"> <select name="ChatStyle" onchange='showChatImage(this);'>
    <option value="0">���һ</option>
    <option value="1">����</option>
    <option value="2">�����</option>
    <option value="3">�����</option>
  </select></td><td align="right">
         <img name="ChatImage" src="Images/1-1.gif" style="height: 229px; width: 337px; display:block;"/>
         <img name="ChatImage" src="Images/2-1.gif" style="height: 229px; width: 337px; display:none; "/>
         <img name="ChatImage" src="Images/3-1.gif" style="height: 229px; width: 337px; display:none; "/>
         <img name="ChatImage" src="Images/4-1.gif" style="height: 229px; width: 337px; display:none; "/>
  </td></tr>
  </tr>
  <TR>
    <TD >�ͷ�ͼ�꣺</TD>
    <TD colspan=2>
      <INPUT onclick=editCode() type=radio value="1" name="kf_fixed"> �̶��ͷ�ͼ�� &nbsp; &nbsp; 
      <INPUT onclick=editCode() type=radio value="2" CHECKED name="kf_fixed"> Ư���ͷ�ͼ�� 
<!--
								<input type="radio" name="kf_fixed" value="2" onclick="editCode()" />	�б���ʽ	
								--> </TD></TR>
    <TD >ͼ��λ�ã�</TD>
    <TD colspan=2 >
    <INPUT onclick=editCode() type=radio CHECKED value="1" name="icolocation"> ���Ͻ�
    <INPUT onclick=editCode() type=radio  value="2"   name="icoLocation" >���м� 
    <INPUT onclick=editCode() type=radio  value="3"    name="icoLocation" >���½�
    <INPUT onclick=editCode() type=radio  value="4"   name="icoLocation" >���Ͻ�
    <INPUT onclick=editCode() type=radio  value="5" name="icoLocation" >���м� 
    <INPUT onclick=editCode() type=radio  value="6"   name="icoLocation" >���½�
    </TD></TR>
  <TR id=posmodel_tr>
    <TD >���룺</TD>
    <TD colspan=2 ><TEXTAREA class=textarea id='codepic0' name=codepic0 readOnly 
            style="width: 410px; height: 81px"> </TEXTAREA></TD></TR>
  <TR>
    <TD>&nbsp;</TD>
    <TD colspan=2><INPUT id=kf_city type=hidden name=kf_city> <INPUT class=green id=Submit onclick=editCode(); type=button value=��ȡ���� name=Submit>&nbsp; 
      &nbsp;&nbsp;
      <P></P></TD></TR></TBODY></TABLE>
      </div>
       <!--��������-->
       </div>
 <div><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></div>
</td></tr>
   </table>
   </center>
</asp:Content>

