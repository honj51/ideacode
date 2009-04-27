<%@ Page Language="C#" AutoEventWireup="true" CodeFile="check.aspx.cs" Inherits="check" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
   <script type="text/javascript" src="js/live.js"> </script>
    <style type="text/css">
        #TextArea1
        {
            width: 647px;
            height: 124px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" Height="165px" TextMode="MultiLine" 
        Width="657px"></asp:TextBox>
    </form>
   
    <p>
        <textarea id="TextArea1" name="S1"></textarea></p>
   
</body>
</html>
