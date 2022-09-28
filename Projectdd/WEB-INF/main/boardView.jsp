<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>
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
					<li><a href="${cpath}/mainForm.do">Home</a></li>
					<li><a href="savePoint.html">Save Point</a></li>
					<li><a href="">Level</a></li>
					<li><a href="${cpath}/boardList.do">Board</a></li>
					<li><a href="${cpath}/mychall.do">My Challenge</a></li>
					<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
					<li><a href="" class="button">Login</a></li>
				</ul>
			</nav>
		</header>
		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2 id="title">${vo.comm_title}</h2>
				<p id="write">${vo.mb_id}</p>
				<div id="date">${vo.comm_date}</div>
			</header>
			<div class="box">
				<div class="row-6 row-12-mobilep">
					<p>${fn:replace(vo.comm_content, newLineChar , "<br/>")}</p>
				</div>
				<!--코멘트창-->
				<form class="comm_comment" action="${cpath}/commWrite.do"method="get">
					<h3>comment</h3>
					<div class="table-wrapper">
						<table>
							<tbody>
									<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<c:forEach var="vo" items="${list}">
								<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<tr>
									<td>${vo.comm_cmt_seq}</td>
									<td>${vo.comm_cmt_content}</td>
									<td>${vo.mb_id}</td>
								</tr>
							</c:forEach>
								</br>
							</tbody>
						</table>
						<div class="col-12">
						<input type = "hidden" name = "num" value ="${vo.comm_seq}"/>
							<textarea name="comment" id="comment_content"
								placeholder="댓글을 남겨주세요." rows="6"></textarea>
							</br> <input type="submit" value="작성하기" id="submit_comment"
								style="width: 100%" />
						</div>
				</form>
			</div>
	</div>
	</section>
	<div class="col-12">
		<ul class="actions special">
			<li><input type="button" value="목록으로" id="goList"
				onclick="goList()" /></li>
			<li><input type="submit" value="수정하기" id="update"
				onclick="goUpdate()" /></li>
			<li><input type="button" value="삭제하기" id="delete"
				onclick="goDelete()" /></li>
		</ul>
	</div>
	</div>
	<script type="text/javascript">
		function goList() {
			location.href = "${cpath}/boardList.do";
		}

		function goUpdate() {
			location.href = "${cpath}/boardUpdateForm.do?num=${vo.comm_seq}";
		}
		function goDelete() {
			location.href = "${cpath}/boardDelete.do?num=${vo.comm_seq}";
		}
	</script>
</body>
</html>