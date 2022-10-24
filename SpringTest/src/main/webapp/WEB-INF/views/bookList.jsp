<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>보유 도서 현황</h1>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작가</td>
			<td>출판사</td>
			<td>ISBN</td>
			<td>보유도서수</td>
		</tr>
		<c:forEach var="vo" items="${list}" >
			<tr>
				<td>${vo.num}</td>
				<td>${vo.title}</td>
				<td>${vo.author}</td>
				<td>${vo.company}</td>
				<td>${vo.isbn}</td>
				<td>${vo.count}</td>
			</tr>
		</c:forEach>
	</table>
	<h1>도서 입력</h1>
	<form action="bookInsert.do">
	<p>제목 : <input type="text" name="title"></p>
	<p>작가 : <input type="text" name="author"></p>
	<p>출판사 : <input type="text" name="company"></p>
	<p>ISBN : <input type="text" name="isbn"></p>
	<p>도유도서 수 : <input type="number" name="count"></p>
	<button type="submit">등록</button>
	</form>
</body>
</html>