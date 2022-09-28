<%@page import="com.gjai.entity.BoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
	  <h2>게시판 목록</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">
	    	 <c:if test="${empty mvo}"> <!-- mvo가 하나이기에 sessionScope.mvo에서 앞에 생략 -->
				<form class="form-inline" action="${cpath}/login.do" method="post"> <!-- 회원인증 실패 시 폼 -->
					<div class="form-group">
						<label for="memId">ID:</label> <input type="text"
							class="form-control" name="memId">
					</div>
					<div class="form-group">
						<label for="memPwd">Password:</label> <input type="password"
							class="form-control" name="memPwd">
					</div>
					<button type="submit" class="btn btn-default">로그인</button>
				</form>
			  </c:if>
			  <c:if test="${!empty mvo}">
			  	<form class="form-inline" action="${cpath}/logout.do"> <!-- 회원인증 실패 시 폼 -->
					<div class="form-group">
						<label for="memId">${mvo.memName }님 방문을 환영합니다.</label>
					</div>
					<button type="submit" class="btn btn-default">로그아웃</button>
				</form>
			  </c:if>
	    
	    </div>
	    <div class="panel-body">
			<table class="table table-hover table-bordered">
				<tr class="info">
					<td>번호</td>
					<td>제목</td>
					<td>조회수</td>
					<td>작성자</td>
					<td>작성일</td>	
				</tr>
				<%--     <% List<BoardVO> list = (List<BoardVO>)request.getAttribute("list"); %>
				<% for(BoardVO vo : list){ %>
					<tr>
						<td><%=vo.getIdx() %></td>
						<td><%=vo.getTitle() %></td>
						<td><%=vo.getCount() %></td>
						<td><%=vo.getWriter() %></td>
						<td><%=vo.getIndate() %></td>	
					</tr>
				<%} %>     jstl 안쓰기 --%>
				
				
				<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.idx}</td>
					<td><a href="${cpath}/boardView.do?idx=${vo.idx}">${vo.title}</a></td>
					<td>${vo.count}</td>
					<td>${vo.writer}</td>
					<td>${vo.indate}</td>	
				</tr>
				</c:forEach>
				<c:if test="${!empty mvo}">
					<tr>
						<td colspan="5">
							<button class="btn btn-sm btn-primary" onclick="location.href='${cpath}/boardWrite.do'">글쓰기</button>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	  </div>
	</div>
	
</body>
</html>