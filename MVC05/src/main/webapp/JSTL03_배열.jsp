<%@page import="kr.board.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Board vo =new Board();
	vo.setNum(1);
	vo.setTitle("게시판");
	vo.setWriter("관리자");
	request.setAttribute("vo", vo);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${vo.num},${vo.title},${vo.writer}
</body>
</html>