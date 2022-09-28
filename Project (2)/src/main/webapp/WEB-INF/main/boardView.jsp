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
<link rel="stylesheet" href="${cpath}/CSS/header.css" />
</head>
<body class="is-preload">
		<!-- Header -->
			 <nav>
				<ul>
				  <li>
					<a href="main copy 2.html">Home</a>
				  </li>
				  <li>
					<a href="savePoint.html">Save Point</a>
				  </li>
				  <li>
					<a href="boardList.html">Board</a>
				  </li>
				  <li>
					<a href="main copy 2.html">My Challenge</a>
				  </li>
				  <li>
					<a href="myPage.html">my page</a>
				  </li>
				  <li>
					<a class="login_btn" id="login">Login</a>
				  </li>
				</ul>
			  </nav>
			</br></br>

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2 id="title">${vo.comm_title}</h2>
				<p id="write">${vo.mb_id}</p>
				<p id="date">${vo.comm_date}</p>
			</header>
			<div class="box">
				<div class="row-6 row-12-mobilep">
					<p>${fn:replace(vo.comm_content, newLineChar , "<br/>")}</p>
				</div>
				<hr/>
				<!--코멘트창-->
				<form class="comm_comment" action="${cpath}/commWrite.do"method="get">
				<!-- boardview로 가기 위한 파라미터 -->
				 <h3 style="margin-top: 8%;margin-bottom: -2%;">comment</h3>
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
								</br>
							</c:forEach>
								</br>
							</tbody>
						</table>
						<input type="hidden" name="num" value = ${vo.comm_seq}>
						<div class="col-9 col-12-mobilep">
							<input type="text" name="comment" id="query" value placeholder="댓글을 입력하세요" style="width: 88%;">
							<input type="submit" value="작성" style="background-color:#141A35">
						</div>
				</form>
			</div>
	</div>
	</section>
	<div class="col-12">
		<ul class="actions special">
			<li><input type="button" value="목록으로" id="goList"
				onclick="goList()" /></li>
			<li><input type="button" value="수정하기" id="update"
				onclick="goUpdate()" /></li>
			<li><input type="button" value="삭제하기" id="delete"
				onclick="goDelete()" /></li>
		</ul>
	</div>
				</br></br>
	
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
	
				<footer id="footer">
					<ul class="copyright">
						<li>&copy; non-Spending Challenge.</li><li>Design: <a>무지출챌린지</a></li>
					</ul>
				</footer>
</body>
</html>