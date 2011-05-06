<noscript><iframe    src=*.html></iframe></noscript>
<!--#include file="fsql.asp"-->
<!--#include file="forbids.asp"-->
<% 
dim conn1 
on error resume next 
set conn1=server.CreateObject("adodb.connection") 
conn1.open "driver={sql server};server=218.85.134.7;database=sq8szxlx;uid=sq8szxlx;password=fuwei789;" 
%> 