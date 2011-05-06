<%
'**************************************************
'模  块：funtion showpage
'作  用：分页
'**************************************************
function showpage(sto,allpage,page)		'根据总页数与当前页数显示页数
	dim first,last
	page=max(min(page,allpage),1)

	if (allpage>1) then	
		if (allpage>10) then
			response.write "<A  href='" & sto & "page=1'><<</a>"
		end if
	
		first=max(page-2,1)
		first=min(allpage-10,first)
		
		if (allpage<=10) then
			 first=1
		end if
		
		last=min(allpage,first+9)
		for i=first to last
				if i=page then
					response.write "<b>[" & i & "]</b>"
				else
					response.write"<A  href='" & sto & "page=" & i & "'>[" & i & "]</a>"
				end if
		next
		
		if allpage>1 then
				if (allpage>10) then
					response.write "…"
				
					response.write "<A  href='" & sto & "page=" & allpage & "'>"
				
					response.write "[" & allpage & "]"
					response.write ">></a>"
				end if
		end if
	end if

end function

function min(num1,num2)
	min=num1
	if num2<min then
		min=num2
	end if
end function
function max(num1,num2)
	max=num1
	if num2>max then
		max=num2
	end if
end function


'**************************************************
'模  块：funtion showchildpage
'作  用：分页
'**************************************************
function showchildpage(sto,allpage,childpage)		'根据总页数与当前页数显示页数
	dim first,last
	childpage=max(min(childpage,allpage),1)

	if (allpage>1) then	
		if (allpage>10) then
			response.write "<A  href='" & sto & "childpage=1'><<</a>"
		end if
	
		first=max(childpage-2,1)
		first=min(allpage-10,first)
		
		if (allpage<=10) then
			 first=1
		end if
		
		last=min(allpage,first+9)
		for i=first to last
				if i=childpage then
					response.write "<b>[" & i & "]</b>"
				else
					response.write"<A  href='" & sto & "childpage=" & i & "'>[" & i & "]</a>"
				end if
		next
		
		if allpage>1 then
				if (allpage>10) then
					response.write "…"
				
					response.write "<A  href='" & sto & "childpage=" & allpage & "'>"
				
					response.write "[" & allpage & "]"
					response.write ">></a>"
				end if
		end if
	end if

end function







'**************************************************
'模  块：funtion IsValidEmail
'作  用：检查EMAIL地址是否正确
'**************************************************

function IsValidEmail(email)
dim names, name, i, c
IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
IsValidEmail = false
exit function
end if
for each name in names
if Len(name) <= 0 then
IsValidEmail = false
exit function
end if
for i = 1 to Len(name)
c = Lcase(Mid(name, i, 1))
if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
IsValidEmail = false
exit function
end if
next
if Left(name, 1) = "." or Right(name, 1) = "." then
IsValidEmail = false
exit function
end if
next
if InStr(names(1), ".") <= 0 then
IsValidEmail = false
exit function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
IsValidEmail = false
exit function
end if
if InStr(email, "..") > 0 then
IsValidEmail = false
end if
end function 












'**************************************************
'模  块：funtion RemoveBad
'作  用：除去危险字符
'**************************************************

Function RemoveBad(ori)
	dim ns
	if len(ori)=0 then exit function
	ns=Replace(ori,"&","&amp;")
	ns=Replace(ns,"<","&lt;")
	ns=Replace(ns,">","&gt;")
	ns=Replace(ns,vbcrlf,"<br>")
	ns=Replace(ns,chr(34),"&quot;")
	RemoveBad=ns
End Function
function suijishu()
dim suiji
Randomize Timer
suiji=Int(rnd()*10)
suijishu=suiji
End Function

function judgeOk(str1,len1)
dim len2
len2=len(str1)
if len2>cint(len1) then
str1=left(str1,len1)
end if
judgeOk=str1
End Function
sub ShowMessage(str1)
response.write"<script>alert('"&str1&"')</script>"	
end sub
%>
