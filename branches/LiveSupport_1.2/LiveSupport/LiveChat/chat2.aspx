<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat2.aspx.cs" Inherits="chat2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="Images/mainCN.css" type="text/css" rel="Stylesheet" />
    <link href="Images/skin.css" type="text/css" rel="stylesheet" />
  
</head>
<body>
    <form  id="f1" runat="server"> 
          <asp:Panel ID="pnlRequest1" Visible="true" runat="server">
            <div style=" height:100%; width:100%">
            <fieldset>
                
                <legend>
                
                <span id="Welcome">清输入下面的内容进行对话.</span>
                </legend>
            
            <fieldset>
            <legend>
            
              <span class="formField">您的名字</span>
            </legend>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </fieldset>
            
            <fieldset>
            <legend>
            
                <span class="formField">您的电子邮件</span>
            </legend>
             <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </fieldset>
            
            
            <fieldset>
            
            <asp:Button  ID="btnStarChat" Text="开始对话" runat="server" />
            
            
            </fieldset>
            </fieldset>
                
            
                          
        </asp:Panel>
        
     </form>
 
    
</body>
</html>
