<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zphtgl.aspx.cs" Inherits="ZuLin_zphtgl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>租赁合同管理</title>
     <link href="~/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" type="text/css" href="../ext/examples/ux/css/ux-all.css" />
     <link rel="stylesheet" type="text/css" href="../css/main.css" />
    <script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../ext/ext-all.js"></script>
    <script type="text/javascript" src="../ext/examples/ux/ux-all.js"></script>
    <script type="text/javascript" src="../ext/src/locale/ext-lang-zh_CN.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
     <script type="text/javascript" src="zphtgl.js"></script>
     <script type="text/javascript">
		Ext.onReady(function(){	
			new Ext.Viewport({
				autoEl : 'div',
				layout : 'border',
				autoWidth : true,
				autoHeight:true,
				frame : true,
				items : [
					new Ext.Hudongsoft.zphtglGrid({region:'center'})
				]
			});
		});
	
	</script>
</body>
</html>
