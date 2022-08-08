<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Board vo =new Board();
	vo.setNum(1);
	vo.setTitle("게시판");
	vo.setWriter("관리자");
	List<Board> list = new ArrayList<Board>();
	list.add(vo);
	list.add(vo);
	list.add(vo);
	request.setAttribute("list", list);
%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="vo" items="${list}">
${vo.num}, ${vo.title}, ${vo.writer}<br/>
</c:forEach>
- Context Path가져오기(/MVC03) -<br>
<%=request.getContextPath() %><br>
${pageContext.request.contextPath}<br>
${cpath}
</body>
</html>