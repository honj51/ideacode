<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tree.aspx.cs" Inherits="Tree" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>

[
{
    text: '收费管理', 
    cls: 'folder',
    children:[
        <%     
            if (sjlr == 1){           
        %>
                {text: '数据录入',leaf: true},
        <%
            }   
        %>
        
        <%     
            if (jfgl == 1){           
        %>
                {text: '缴费管理',leaf: true}
        <%
            }   
        %>
                
    ]
},
{
    text: '资源管理', 
    cls: 'folder',
    children:[
        <%     
            if (gyygl == 1){           
        %>
                {text: '工业园管理',leaf: true},
        <%
            }   
        %>
        
        <%     
            if (fcgl == 1){           
        %>
                {text: '房产管理',leaf: true},
        <%
            }   
        %>
        
        <%     
            if (kugl == 1){           
        %>
                {text: '公司列表',leaf: true},
                {text: '自然人列表',leaf: true}
        <%
            }   
        %>
        
       
    ]
},
{
    text: '租赁管理', 
    cls: 'folder',
    children:[
        <%     
            if (ydgl == 1){           
        %>
                {text: '预定管理',leaf: true}, 
        <%
            }   
        %>
        
        <%     
            if (zlht == 1){           
        %>
                {text: '租赁合同管理',leaf: true}, 
        <%
            }   
        %>
        
        <%     
            if (htdqts == 1){           
        %>
                {text: '合同到期提示',leaf: true}, 
        <%
            }   
        %>
        
        <%     
            if (skfltj == 1){           
        %>
                {text: '收款分类统计',leaf: true},
        <%
            }   
        %>
        
        <%     
            if (skxxtj == 1){           
        %>
                {text: '收款详细统计',leaf: true},
        <%
            }   
        %>
                        
        {text: '临时开票',leaf: true}
    ]
},
{
    text: '系统管理', 
    cls: 'folder',
    children:[
        <%     
            if (jsqx == 1){           
        %>
                {text: '角色管理',leaf: true},
        <%
            }   
        %>
        
        <%     
            if (glygl == 1){           
        %>
                {text: '管理员管理',leaf: true},
        <%
            }   
        %>
        
        <%     
            if (xgbsmm == 1){           
        %>
                {text: '修改密码',leaf: true}
        <%
            }   
        %>
        
        
        
    ]
}
]
