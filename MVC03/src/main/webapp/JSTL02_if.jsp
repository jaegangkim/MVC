<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="a" value="11" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${a%2==0}">
	짝수
</c:if>
<c:if test="${a%2!=0}">
	홀수
</c:if>
<c:choose>
	<c:when test="${a%2==0}">
		짝수
	</c:when>
	<c:when test="${a%2!=0}">
		홀수
	</c:when>
	<c:otherwise>둘 다x</c:otherwise>
</c:choose>
</body>
</html>