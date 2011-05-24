<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

[
{
    text: '收费管理', 
    cls: 'folder',
    children:[
    
    <% 
        int i =1;
        if (i==1) {
     %>
        {text: '数据录入',leaf: true},
    <% 
        }
    else
        {
    %>
        {text: '缴费管理',leaf: true}
    <% 
        }
    %>

    ]
},
