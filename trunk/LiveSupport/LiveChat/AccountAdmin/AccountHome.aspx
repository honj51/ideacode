<%@ Page Title="客服中心-LiveSupport在线客服系统" Language="C#" MasterPageFile="~/AccountAdmin/MasterAccountAdmin.master" AutoEventWireup="true" CodeFile="AccountHome.aspx.cs" Inherits="AccountAdmin_Default3" validateRequest="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="left">
           &nbsp;&nbsp;&nbsp; 网站代码: 
           <asp:TextBox ID="TextBox1" runat="server" Width="470px"></asp:TextBox>
   </td>
   </tr>
   <tr><td style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 21px;" align="center">请将这行代码放到你的网站的页面中</td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
 <div></div>
 <table  style="margin-top:5px;" cellpadding="0" cellspacing="0">
   <tr><td><img  src="Images/n_540_1.jpg" style="height: 16px; width: 570px"/></td></tr>
   <tr><td><table style="background-image:url('Images/n_540_bg.jpg');width: 570px; height: 295px;"><tr><td valign="top" align="center"> 
  <div style="text-align:left;color: #cccccc; border-bottom: 1px solid; position: relative;">&nbsp;&nbsp;&nbsp;<img src="Images/zhuce.jpg" /><a href="UpdateAccount.aspx"><asp:Image
      ID="Image1" runat="server"  ImageUrl="Images/mima.jpg"/></a></div>
  <!--内容-->
  <table  cellspacing="5" cellPadding="0" border="0" style=" margin-left:10px; margin-top:10px;">
        <TBODY style="text-align:left;">
         <TR>
          <TD  >&nbsp;&nbsp;&nbsp; 帐号ID： </TD>
          <TD><asp:TextBox ID="txtId" runat="server" Width="160px" ReadOnly="True"></asp:TextBox>
            </TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> 名称： </TD>
          <TD><asp:TextBox ID="txtCompanyName" runat="server" Width="160px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="txtCompanyName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
         <TD ><FONT color=red>*</FONT> 网址：&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
          <TD ><asp:TextBox ID="txtUrl" runat="server" Width="250px">http://</asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtUrl" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ControlToValidate="txtUrl" ErrorMessage="网址有误!"  ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
            </TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> 电话： </TD>
          <TD > <asp:TextBox ID="txtCompanyPhone" runat="server" Width="160px"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                  ControlToValidate="txtCompanyPhone" ErrorMessage="电话有误!" 
                  ValidationExpression="^\d+(\.\d)?$"></asp:RegularExpressionValidator>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                  ControlToValidate="txtCompanyPhone" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> 联系人： </TD>
          <TD ><asp:TextBox ID="txtName" runat="server" Width="160px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                  ControlToValidate="txtName" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD ><FONT color=red>*</FONT> Email地址： </TD>
          <TD ><asp:TextBox ID="txtMail" runat="server" Width="160px"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                  ControlToValidate="txtMail" ErrorMessage="Eamil有误!" 
                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                  ControlToValidate="txtMail" ErrorMessage="不能为空!"></asp:RequiredFieldValidator>
            </TD></TR>
        <TR>
          <TD><FONT color=red>*</FONT> 所在省：</TD>
          <TD>

<asp:DropDownList ID="ddlSheng" runat="server" AutoPostBack="True" 
                  onselectedindexchanged="ddlSheng_SelectedIndexChanged" 
                  style="height: 22px" ></asp:DropDownList>

</TD></TR>
        <TR>
          <TD >&nbsp;&nbsp;&nbsp;所在城市： </TD>
          <TD > <asp:DropDownList ID="ddlShi" runat="server"></asp:DropDownList>
            </TD></TR>
        <TR >
          <TD class="style1" ><FONT color=red>*</FONT> 所在行业： </TD>
          <TD class="style1"><asp:DropDownList ID="ddlVocation" runat="server" Height="22px" Width="250px"  >
              <asp:ListItem>请选择行业类别</asp:ListItem>
              <asp:ListItem>计算机</asp:ListItem>
              <asp:ListItem>互联网-电子商务</asp:ListItem>
              <asp:ListItem>电子-微电子</asp:ListItem>
              <asp:ListItem>通讯(设备-运营-增值服务)</asp:ListItem>
              <asp:ListItem>广告-会展-公关</asp:ListItem>
              <asp:ListItem>房地产开发-建筑与工程</asp:ListItem>
              <asp:ListItem>物业管理-商业中心</asp:ListItem>
              <asp:ListItem>家居-室内设计-装潢</asp:ListItem>
              <asp:ListItem>服务业</asp:ListItem>
              <asp:ListItem>中介服务(人才-商标专利)</asp:ListItem>
              <asp:ListItem>专业服务(咨询-财会-法律等)</asp:ListItem>
              <asp:ListItem>金融业(投资-保险-证劵-银行-基金)</asp:ListItem>
              <asp:ListItem>贸易-进出口</asp:ListItem>
              <asp:ListItem>媒体-出版-文化传播</asp:ListItem>
              <asp:ListItem>印刷-包装-造纸</asp:ListItem>
              <asp:ListItem>快速消费品(食品-饮料-日化-烟酒等)</asp:ListItem>
              <asp:ListItem>耐用消费品(服饰-纺织-家具)</asp:ListItem>
              <asp:ListItem>家电业</asp:ListItem>
              <asp:ListItem>办公设备-用品</asp:ListItem>
              <asp:ListItem>旅游-酒店-餐饮服务</asp:ListItem>
              <asp:ListItem>批发-零售</asp:ListItem>
              <asp:ListItem>交通-运输-物流</asp:ListItem>
              <asp:ListItem>娱乐-运动-休闲</asp:ListItem>
              <asp:ListItem>制药-生物工程</asp:ListItem>
              <asp:ListItem>医疗-保健-美容-卫生服务</asp:ListItem>
              <asp:ListItem>医疗设备-器械</asp:ListItem>
              <asp:ListItem>环保</asp:ListItem>
              <asp:ListItem>石油-化工-冶炼-原材料</asp:ListItem>
              <asp:ListItem>能源(电力-石油)-水利</asp:ListItem>
              <asp:ListItem>仪器-仪表-工业自动化-电气</asp:ListItem>
              <asp:ListItem>汽车-摩托车(制造-维护-配件-销售-服务)</asp:ListItem>
              <asp:ListItem>机械制造-机电-重工</asp:ListItem>
              <asp:ListItem>原材料及加工(金属-木材-橡胶-朔料-玻璃-陶瓷-建材)</asp:ListItem>
              <asp:ListItem>农-林-牧-渔</asp:ListItem>
              <asp:ListItem>航空-航天研究与制造</asp:ListItem>
              <asp:ListItem>教育-培训-科研-院校</asp:ListItem>
              <asp:ListItem>政府-非营利机构</asp:ListItem>
              <asp:ListItem>其他</asp:ListItem>
              </asp:DropDownList>
            </TD></TR>
             <tr><td></td><td>
                <asp:Button ID="btnSave" runat="server" Text="保存" Width="92px" 
                    onclick="btnSave_Click" Height="23px" />
                </td></tr>
            </TBODY></TABLE>
 </td></tr></table></td></tr>
   <tr><td><img  src="Images/n_540_2.jpg" style="height: 9px; width: 570px"/></td></tr>
 </table>
<!--内容结束-->
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">

    
    <style type="text/css">
        .style1
        {
            height: 28px;
        }
    </style>

    
</asp:Content>

