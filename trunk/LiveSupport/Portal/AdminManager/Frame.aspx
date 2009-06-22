<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frame.aspx.cs" Inherits="AdminManager_Frame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)" />
    <title>江西互动科技有限公司管理系统后台</title>
</head>
<frameset rows="90,*" id="AllFrame" border="0">
	<frame src="Top.aspx" id="fraToolbar" scrolling="no" />
	<frameset cols="205,*" id="fstMain">
		<frame src="Left.aspx" id="fraLeft" marginwidth="0" marginheight="0" scrolling="no" />
		<frame src="Main.aspx" name="fraMain" scrolling="auto" marginwidth="0" marginheight="0" />
	</frameset>
</frameset>
</html>