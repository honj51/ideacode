<%@ Page Language="C#" MasterPageFile="~/PortalMasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" Title="�����Ƽ�" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 171px;
        }
        </style>

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

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD  style=" width:2%"><IMG height=25 
                  src="Imgs/biaodian.jpg" 
 width=100%></TD>
                <TD 
                  background=Imgs/biaodian1.jpg></TD>
                <TD width=70% 
                background=Imgs/biaodian1.jpg>&nbsp;</TD></TR></TBODY></TABLE>

<table>
<tr>
<td style="background-image:url('Imgs/bg.bmp'); background-repeat:repeat-x; height: 155px; width: 782px">


                
                
        <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=8 
                      background=Imgs/index_t3_a1.png 
                      height=32></TD>
                      <TD align=left 
                      background=Imgs/index_t3_a2.png>
                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                          <TBODY>
                          <TR>
                            <TD height=32><IMG height=32 alt="" 
                              src="Imgs/index_t3_title.png" 
                              width=106></TD>
                            <TD></TD>
                            <TD></TD>
                            
                            </TR></TBODY></TABLE></TD>
                      <TD width=10 
                      background=Imgs/index_t3_a3.png></TD></TR>
                    <TR>
                      <TD 
                      background=Imgs/index_t3_b1.png 
                      height=246></TD>
                      <TD vAlign=center align=middle width=728 
                      background=Imgs/index_t3_b2.png>
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR vAlign=top align=left>
                            <TD width=221 
                          
                            height=70>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_3.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center>�ͻ�ֻ������һ�㣬���ܹ���ͷ���Ա���м�ʱ��������󽵵Ϳͻ��Ĺ�ͨ�ż�����߳ɽ����ʡ�</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD width=221 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_1.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center>ͨ���������������Ի��Ľ������ò����Թ˿͵ĵ�ַ���жϣ������Է������Ļ�ͷ�������ࡣ</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD width=207 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_2.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=205>
                                <DIV align=center style="width: 200px">�ṩ�˷ÿ�����ʱ��͵���λ�õ�ͳ����Ϣ.</DIV></TD></TR></TBODY></TABLE></TD></TR>
                          <TR vAlign=top align=left>
                            <TD 
                            
                            height=70>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_5.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center><SPAN 
                                class=style_0066CC><BR></SPAN>������Ա�ܹ�ʵʱ�ĶԿͷ���Ա�Ĺ������м�أ����鿴�ÿͶԿͷ�����������ۡ�</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_4.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center>���ð�װ�κ�����������ͻ�ֻ������һ�㣬���ܹ���ͷ���Ա���м�ʱ��������󽵵Ϳͻ��Ĺ�ͨ�ż�����߳ɽ����ʡ�</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD 
                            >
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"></A><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_6.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=205>
                                <DIV align=center>�ṩ�˷ÿ�����ʱ��͵���λ�õ�ͳ����Ϣ����ҵ���Ը�����Щ���ݵ��������������ţ�����������Եȣ�Ϊ�����г������ṩ�����������ݡ� 
                                </DIV></TD></TR></TBODY></TABLE></TD></TR>
                          <TR vAlign=top align=left>
                            <TD height=70><SPAN class=pic01></SPAN>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_8.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center><BR>ͨ������Ϊ�˿ͷ����ͽ�����ӵ���������ǿ�˿͵��ҳ϶Ƚ�һ��������ۻ������������</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_0.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=175>
                                <DIV align=center><BR>�����õĶԻ����ݺ���վ��ַ���з����������ɵĶԲ�ͬ�ķÿͿ���Ӧ������רҵ����ʡЧ�ʡ�</DIV></TD></TR></TBODY></TABLE></TD>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD class=pic01 width=47 height=47><A 
                                href="http://www.fdcsoft.com/#"><IMG height=47 
                                src="Imgs/icon45_7.png" 
                                width=47 border=0></A></TD>
                                <TD width=7></TD>
                                <TD vAlign=top align=left width=205>
                                <DIV align=center><BR>�ı䴫ͳ�绰���ʼ���QQ�ȿͻ�Ӫ����ʽ��Ϊ��ҵ��������ʽӪ����ʽ��<SPAN 
                                class=style_g2>

</SPAN></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      <TD 
                      background=Imgs/index_t3_b3.png></TD></TR>
                    <TR>
                      <TD 
                      background=Imgs/index_t3_c1.png 
                      height=11></TD>
                      <TD 
                      background=Imgs/index_t3_c2.png></TD>
                      <TD 
                      background=Imgs/index_t3_c3.png></TD></TR></TBODY></TABLE>
                      
                      
                      <TABLE cellSpacing=0 cellPadding=0 align=center border=0 width=782px>
        <TBODY>
        <TR>
          <TD align="left" colspan="2" class=white12b background=Imgs/mid_titbj.jpg  style="background-repeat:repeat-y"
          height=28>��&nbsp;
          <IMG height=5 src="Imgs/icon7.gif" 
            width=7>&nbsp;��Ʒ����</TD></TR>
            
            <tr>
            <td  style="width:50%">
               
               <TABLE cellSpacing=0 cellPadding=0 width=100% align=center 
              border=0><TBODY>
              <TR>
                <TD colSpan=2 height=1></TD></TR>
              <TR>
                <TD width=141 background=Imgs/tit_bj.jpg 
                height=23>
                <a href="LiveChat.aspx">
                &nbsp;<IMG height=14 
                  src="Imgs/01.jpg" width=22>&nbsp;��վ�ͷ�</a></TD>
                <TD align=right>&nbsp;</TD></TR>
              <TR>
                <TD colSpan=2 height=3></TD></TR></TBODY></TABLE>
            <TABLE class=type_k height=71 cellSpacing=0 cellPadding=0 width=100% 
            align=center border=0>
              <TBODY>
              <TR>
                <TD align=middle width=129>
                <a href="LiveChat.aspx">
                <IMG height=67 
                  src="Imgs/pic01.jpg" width=77></a></TD>
                <TD vAlign=top>
                  <TABLE cellSpacing=0 cellPadding=0 width="80%" height=100% align=center 
                  border=0>
                    <TBODY>
                  
                    <TR>
                      <TD width=11><IMG height=4 
                        src="Imgs/icon6.gif" width=4></TD>
                      <TD class=midlist><A 
                        href="" 
                        target=_blank>
                        
              </A>һ����ҵ������վ��ͨƽ̨ϵͳ</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
               
               </td>
            <td style="width=50%">
             <TABLE   cellSpacing=0 cellPadding=0 width=100% align=center 
              border=0><TBODY>
              <TR>
                <TD colSpan=2 height=1></TD></TR>
              <TR>
                <TD background=Imgs/tit_bj.jpg 
                height=23 class="style1">
                <a  href="HDHouse.aspx">
                &nbsp;<IMG height=14 
                  src="Imgs/02.jpg" width=22>&nbsp;�����н����ϵͳ
                  </a>
                  </TD>
                <TD align=right>&nbsp;</TD></TR>
              <TR>
                <TD colSpan=2 height=3></TD></TR></TBODY></TABLE>
                
            <TABLE class=type_k height=71 cellSpacing=0 cellPadding=0 width=100%
            align=center border=0>
              <TBODY>
              <TR>
                <TD align=middle width=129>
                <a href="HDHouse.aspx">
                <IMG height=67 
                  src="Imgs/pic03.jpg" width=77>
                  </a>
                  </TD>
                <TD vAlign=top>
                  <TABLE cellSpacing=0 cellPadding=0 width="80%" height=100% align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=11><IMG height=4 
                        src="Imgs/icon6.gif" width=4></TD>
                      <TD  >
                          һ����ҵ���ķ����н����ϵͳ��</td><td><a href="Download.aspx" > <img height=19 
                        src="Imgs/download.jpg" width=69 
                        border=0></A></TD></TR>
                  
                        
                        </TBODY></TABLE></TD></TR></TBODY></TABLE>
            
            </td>
            </tr>
            
        
        <TR>
          <TD colspan="2"><IMG height=6 src="Imgs/mid_bottom.jpg" 
            ></TD></TR></TBODY></TABLE>

</td>
</tr>
</table>




</asp:Content>

