<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="act" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
 <style>
    .modalPopup 
    {
	    background-color:#BFD1EE;
	    border-style:solid;
	    border-color:Gray;
	    width:250px;
    }
    .modalBackground 
    {
	    background-color:Gray;
	    filter:alpha(opacity=70);
	    opacity:0.7;
    }    
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
      
        <br /> 
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:LinkButton ID="LinkButton1" runat="server" Text="Share Your Thoughts" /> 
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" 
style="display:block" Height="182px" Width="354px">
<div style="margin:5px;background-color:#FFF; width: 345px; height: 172px;">
<div style="background-image:url('images/BG123.JPG'); height:25px; width: 347px;"> <strong>
上传自定放图片</strong></div>
<table border="0" style="height: 131px; width: 342px" >
<tr style="height:50px;">  
<td >在线图片：&nbsp;
<asp:FileUpload ID="FileUpload2" runat="server" Width="187px" />
</td>
<td  >
<asp:Image ID="Image2" runat="server" Height="50px" Width="50px"  Visible="false"/>
</td>
</tr>
<tr style="height:50px;">
<td >离现图片：&nbsp;
<asp:FileUpload ID="FileUpload1" runat="server" Height="23px" 
style="margin-bottom: 0px" Width="186px" />
</td>
<td >
<asp:Image ID="Image3" runat="server" Height="50px" Width="50px"  Visible="false"/>
</tr>
<tr>
<td align="center">
<asp:Button ID="Button1" runat="server" Text="上传" Width="51px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button2" runat="server" Text="取消" Width="58px" />
</td>
<td align="center" >&nbsp;</td>
</tr>
</table>
</div>
</asp:Panel>

        <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Height="232px" 
            style="display:block" Width="354px">
            <div style="margin:5px;background-color:#FFF; width: 345px; height: 222px;">
                <div style="background-image: url('images/BG123.JPG'); height: 25px; width: 347px;">
                    <strong>上传自定放图片</strong></div>
                <table border="0" style="height: 131px; width: 342px">
                    <tr style="height:50px;">
                        <td>
                            背景图片：&nbsp;
                            <asp:FileUpload ID="FileUpload3" runat="server" Width="187px" />
                        </td>
                        <td>
                            <asp:Image ID="Image4" runat="server" Height="50px" Visible="false" 
                                Width="50px" />
                        </td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            确定图片：&nbsp;
                            <asp:FileUpload ID="FileUpload4" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="186px" />
                        </td>
                        <td>
                            <asp:Image ID="Image5" runat="server" Height="50px" Visible="false" 
                                Width="50px" />
                        </td>
                    </tr>
                     <tr style="height:50px;">
                        <td>
                            取消图片：&nbsp;
                            <asp:FileUpload ID="FileUpload5" runat="server" Height="23px" 
                                style="margin-bottom: 0px" Width="186px" />
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="50px" Visible="false" 
                                Width="50px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="Button3" runat="server" Text="上传" Width="51px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" Text="取消" Width="58px" />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </asp:Panel>

        </div>
        <act:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    TargetControlID="LinkButton1"
                    PopupControlID="Panel1"
                    PopupDragHandleControlID="Panel1"
                    BackgroundCssClass="modalBackground"
                    DropShadow="true"
                    OkControlID="Button1"
                    CancelControlID="Button2" />
    </div>
    </form>
</body>
</html>
