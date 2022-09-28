<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>Generic - Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/CSS/main.css" />
<script src="jquery-3.6.0.min.js"></script>
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.html">non-Spending</a> Challenge
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="main.html">Home</a></li>
					<li><a href="savePoint.html">Save Point</a></li>
					<li><a href="main.html">Level</a></li>
					<li><a href="boardList.html">Board</a></li>
					<li><a href="main.html">My Challenge</a></li>
					<li><a href="mypage.html">My Page</a></li>
					<li><button class="btn-open-popup_login" id="login">Login</button></li>
				</ul>
			</nav>
		</header>

		<!--글목록-->
		<div class="row">
			<div class="col-12">

				<!-- Table -->
				<section class="box">
					<h3>정보게시판</h3>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo" items="${list}">
								<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<tr>
									<td>${vo.save_seq}</td>
									<td><a href="savePointView.do?num=${vo.save_seq}"/>${vo.save_title}</td>
									<td>${vo.save_write}</td>
								</tr>
							</c:forEach>
							</tbody>


						</table>
					</div>

					<a id="page" href="">1</a> <a id="page" href="">2</a> <a id="page"
						href="">3</a> <a id="page" href="">4</a> <a id="page" href="">5</a>
					<a id="page" href="">6</a> <a id="page" href="">7</a> <a id="page"
						href="">8</a> <a id="page" href="">9</a> <a id="page" href="">10</a>
</body>

</html>