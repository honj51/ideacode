<%
session("admin_id")=NULL
session("admin_pwd")=NULL
session("admin_limit")=NULL
response.write"<script>location.href='index.html';location.target='_top';</script>"
%>