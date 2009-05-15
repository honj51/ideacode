<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CutPage.aspx.cs" Inherits="CutPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript">
   function window.onunload()
	{	
		alert("closed");
	}
	
//     function   window.onbeforeunload()       
//     {       
//            if(event.clientX> document.body.clientWidth&&event.clientY <0||event.altKey)       
//            {       
//                    window.event.returnValue= "确定要退出本页吗？ "; 
//            }       
//    }  
    </script>
</head>
<body>
  <form id="form1" runat="server">
      <div>
          &nbsp;<asp:Label ID="Label1" runat="server" Text="收件人地址："></asp:Label>
          <asp:TextBox ID="TextBox1" runat="server" Width="216px"></asp:TextBox><br />
          <br />
          <asp:Label ID="Label2" runat="server" Text="主题："></asp:Label>
          <asp:TextBox ID="TextBox2" runat="server" Width="219px"></asp:TextBox><br />
          <br />
          <asp:Label ID="Label4" runat="server" Text="附件："></asp:Label>
          &nbsp;
          <asp:FileUpload ID="FileUpload1" runat="server" /><br />
          <br />
          <asp:Label ID="Label3" runat="server" Text="内容："></asp:Label><br />
          <asp:TextBox ID="TextBox3" runat="server" Height="176px" Width="348px"></asp:TextBox><br />
          <br />
          <br />
          <asp:Button ID="Button1" runat="server" Text="发送" OnClick="Button1_Click" />
          <asp:Button ID="Button2" runat="server" Text="取消" /></div>
      </form>
</body>
</html>
