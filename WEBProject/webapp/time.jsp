<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		java.util.Date d = new java.util.Date();  
	%>
	
	<table border = "1">
		<tr>
			<td>지금 시간은 : <%=d.toString() %> </td>  <!-- 출력 -->
		</tr>
	</table>
	</body>
</html>