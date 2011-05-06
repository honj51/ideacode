<%
set rszc=Server.CreateObject("ADODB.RecordSet")
strSqlzc = "select * from reg where id=1"
rszc.open strSqlzc,conn,1,3	
if rszc("zch")<>md5(rszc("xh")) and rszc("zcm")<> md5(rszc("zch")) then
		  response.write"<script>window.top.location.href='../index.html'</script>"
end if

	set rsnrbh=Server.CreateObject("adodb.recordset")
	sqlnrbh="select * from admin_admin where admin_id='"&session("admin_id")&"' and admin_pwd='"& session("admin_pwd")&"'"
	rsnrbh.open sqlnrbh,conn,1,3
	if rsnrbh.bof or rsnrbh.eof then
	response.Write("<script>alert('使用超时，请重新登录');location.href='../errow.html'</script>")
	end if
%>