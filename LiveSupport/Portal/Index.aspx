<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" Title="�����Ƽ�" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- <table class="ContentTable">
<tr>
<td style="width:50px;" valign="top" align="center">
<table cellpadding="0" cellspacing="0">
<tr><td><img src="Imgs/sidebar.gif" /></td></tr>
<tr><td style="background-image:url('Imgs/left-centent.GIF');" align="center">
    <br />
<a href="Login.aspx"><img src="Imgs/signin.gif" /></a><br />
    <br /><a href="Licence.aspx"><font style="font-size:14px;">�������ʹ��!</font></a> 
    <br />
    <br />

    <img src="Imgs/sidebar-line.gif" />
    <div style="width:100%; text-align:left; margin-left:20px;"> <b>ע�����̣�</b></div>
    <img src="Imgs/regflow.gif" />
    </td></tr>
    <tr><td style="background-image:url('Imgs/left-down.GIF'); height:24px;"></td></tr>
</table>
</td>
<td></td>
<td valign="top">
<table  width="573" cellpadding="0" cellspacing="0">
<tr><td style="background-image:url('Imgs/centent-title.gif'); height:28px;"></td></tr>
<tr><td style=" background-image:url('Imgs/centent.GIF'); ">
<table style="width:100%;">
<tr><td class="style1" align="center" >
    <br />
    <img src="Imgs/pic-01.gif" /><br />
    <br />
    <a href="Download.aspx"><img src="Imgs/download.gif" /></a></td><td align="left" style="font-size:12px;line-height:22px">&nbsp;&nbsp;&nbsp;&nbsp;<b>��LiveSupport��&nbsp; </b>���߿ͷ�ϵͳ�ǽ���������Ϣ�������޹�˾��Ʒ��һ����ҵ������վ��ͨƽ̨ϵͳ����վ�ķÿͲ���Ҫ�����κ����������ͨ�������վ�ϵ����߿ͷ���־������ֱ�Ӻ���վ�ͷ���Ա���м�ʱ������<br />
&nbsp;&nbsp;&nbsp;&nbsp;<b>��LiveSupport��&nbsp; </b>�ǽ����������߿ͷ�ϵͳ����ϵͳ��Ϊ��ҵ��������Ǳ�ڿͻ�����߷ÿͳɽ��ʣ�������ҵ���룬������Ӫ�ɱ�����߹���Ч�ʣ������ͻ�����ȣ�����ҵ��������Ӫ�������߿ͷ���������ѯ���������ߡ�ϵͳ�����ڸ�����վ������ҵ��������Ӫ���ĺð��֡� </td><td style="width:15px;"></td></tr>
</table>
<img src="Imgs/centent-line.gif" />
<table style="width:100%; text-align:left;font-size:12px; line-height:22px" >
<tr ><td style="width:15px;"></td><td valign="top"><img src="Imgs/advantage-07.jpg" /></td>
    <td valign="top" class="style2"><b>����Ӫ������</b><br />�ı䴫ͳ�绰���ʼ���QQ�ȿͻ�Ӫ����ʽ��Ϊ��ҵ��������ʽӪ����ʽ��</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-08.jpg" /></td>
    <td valign="top"><b>�������ۻ���</b><br />
ͨ������Ϊ�˿ͷ����ͽ�����ӵ���������ǿ�˿͵��ҳ϶Ƚ�һ��������ۻ������������</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-09.jpg" /></td>
    <td valign="top" class="style2"><b>������Ӫ�ɱ�</b><br />ÿ�����߿ͷ���Ա��ͨ�����޵����Ӽ�ʱ�����߷��������������˴�ͳ�ͻ�������ͨ���绰�����������ĳɱ���</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-10.jpg" /></td>
    <td valign="top"><b>���̿ͻ���ϵ</b><br />ͨ���������������Ի��Ľ������ò����Թ˿͵ĵ�ַ���жϣ������Է������Ļ�ͷ�������ࡣ</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-01.gif" /></td>
    <td valign="top" class="style2"><b>�޷칵ͨ</b><br />���ð�װ�κ�����������ͻ�ֻ������һ�㣬���ܹ���ͷ���Ա���м�ʱ��������󽵵Ϳͻ��Ĺ�ͨ�ż�����߳ɽ����ʡ�</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-02.gif" /></td>
    <td valign="top"><b>���ݷ���</b><br />
�ṩ�˷ÿ�����ʱ��͵���λ�õ�ͳ����Ϣ����ҵ���Ը�����Щ���ݵ��������������ţ�����������Եȣ�Ϊ�����г������ṩ�����������ݡ�</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-03.gif" /></td>
    <td valign="top" class="style2"><b>֪ʶ����</b><br />�ͷ��������ɵ�ͨ��֪ʶ�����ѧϰ������Էÿ͵�����ʱ��Ҳ����ͨ��֪ʶ�����������ϣ����ٽ��ÿ����⡣</td><td style="width:15px;"></td>
    <td valign="top"><img src="Imgs/advantage-04.gif" /></td>
    <td valign="top"><b>��׼Ӫ��</b><br />
�ͷ���Ա���Դ�ϵͳ�������֪���ͻ����ڷ���ʲô������Ȥ����ʲô�������ó����׼����</td><td style="width:15px;"></td></tr>
<tr><td></td><td valign="top"><img src="Imgs/advantage-05.gif" /></td>
    <td valign="top" class="style2"><b>��ݻظ�</b><br />�����õĶԻ����ݺ���վ��ַ���з����������ɵĶԲ�ͬ�ķÿͿ���Ӧ������רҵ����ʡЧ�ʡ�</td><td style="width:15px;"></td><td valign="top"><img src="Imgs/advantage-06.gif" /></td><td valign="top"><b>ʵʱ���</b><br />
������Ա�ܹ�ʵʱ�ĶԿͷ���Ա�Ĺ������м�أ����鿴�ÿͶԿͷ�����������ۡ�</td><td style="width:15px;"></td></tr>
</table>

</td>
<tr><td style="background-image:url('Imgs/advantage-down.GIF'); height:20px;"></td></tr>
</tr></table>
</td>
</tr>
</table>--%>

<table >
 <tr><td style="height:28px;" colspan="2">
 <img  width="100%" alt="" src="Imgs/centent-title-bg.gif" />
 </td></tr>

<tr>
<td align="left" style="height: 279px; width: 50%;">
<table align="left"  >
       
 
        <tr>
        <td>
         <table style="width:100%; height: 350px;">
<tr>
<td  align="center" >
    <br />
    <a  href="HDHouse.aspx"><img src="Imgs/pic-01.gif"  alt=""/></a><br />
    <br />
    </td>
    <td align="left" style="font-size:12px;line-height:22px">&nbsp;&nbsp;&nbsp;&nbsp;<b>��HDHouse��&nbsp; </b>�ڷ����н����ϵͳ�ǽ���������Ϣ�������޹�˾��Ʒ��һ����ҵ���ķ����н����ϵͳ��<br />
&nbsp;&nbsp;&nbsp;&nbsp;<b> </b></td>
<td style="width:15px;"></td></tr>
</table>
</td>
       
        </tr>
        
  </table>
  </td>
<td  align="right" style="height: 279px; width: 50%;"> 
    <table >
    
        <tr>
        <td>
        <table style="width:100%; height: 357px;">
<tr><td align="center" >
    <br />
    <a href="LiveChat.aspx"><img alt="" src="Imgs/pic-01.gif" />
    </a>
    <br />
    <br />
    </td>
    <td align="left" style="font-size:12px;line-height:22px">&nbsp;&nbsp;&nbsp;&nbsp;<b>��LiveSupport��&nbsp; </b>���߿ͷ�ϵͳ�ǽ���������Ϣ�������޹�˾��Ʒ��һ����ҵ������վ��ͨƽ̨ϵͳ����վ�ķÿͲ���Ҫ�����κ����������ͨ�������վ�ϵ����߿ͷ���־������ֱ�Ӻ���վ�ͷ���Ա���м�ʱ������<br />
        &nbsp;&nbsp;&nbsp; </td><td style="width:15px;"></td></tr>
</table>
        </td>
            
        </tr>
      

  </table>
  
  </td>

        </tr>
         <tr><td style=" height:28px;" colspan="2">
         <img  alt="" width="100%" src="Imgs/advantage-down.GIF" />
         </td></tr>

  </table>

</asp:Content>

