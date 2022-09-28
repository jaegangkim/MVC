<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
<form method = get action = '${cpath}/boardWriteForm.do'>
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="${cpath}/mainForm.do">non-Spending</a> Challenge
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="${cpath}/mainForm.do">Home</a></li>
					<li><a href="savePointList.do">Save Point</a></li>
					<li><a href="index.html">Level</a></li>
					<li><a href="">Board</a></li>
					<li><a href="${cpath}/mychall.do">My Challenge</a></li>
					<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
					<li><a href="" class="button">Login</a></li>
				</ul>
			</nav>
		</header>

		<!--글목록-->
		<div class="row">
			<div class="col-12">

				<!-- Table -->
				<section class="box">
					<h3>자유게시판</h3>
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
									<td>${vo.comm_seq}</td>
									<td><a href="boardView.do?num=${vo.comm_seq}"/>${vo.comm_title}</td>
									<td>${vo.mb_id}</td>
									<td>${vo.comm_cnt}</td>
								</tr>
							</c:forEach>
							</tbody>

						</table>
					</div>
							<a id="page" href="">1</a>
                            <a id="page" href="">2</a>
                            <a id="page" href="">3</a>
                            <a id="page" href="">4</a>
                            <a id="page" href="">5</a>
                            <a id="page" href="">6</a>
                            <a id="page" href="">7</a>
                            <a id="page" href="">8</a>
                            <a id="page" href="">9</a>
                            <a id="page" href="">10</a>
                            <div class="col-12">
                                <ul class="actions special_board">
                                    <li><input type="submit" value="글작성" id= "goList"/></li>
                                </ul>
                            </div>
</form>
</body>

</html>
