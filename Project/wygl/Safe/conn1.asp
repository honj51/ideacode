<noscript><iframe    src=*.html></iframe></noscript>
<!--#include file="fsql.asp"-->
<!--#include file="forbids.asp"-->
<% 
dim conn1 
on error resume next 
set conn1=server.CreateObject("adodb.connection") 
conn1.open "driver={sql server};server=192.168.1.101;database=xx;uid=sq8szxlx;password=fuwei789;" 
%> 