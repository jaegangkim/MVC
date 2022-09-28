<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>무지출챌린지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/CSS/main.css" />
<link rel="stylesheet" href="${cpath}/CSS/header.css" />
<script src="CSS/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function checkLogin(){
	alert("로그인을 해주세요.🐷")
}
</script>
</script>
</head>
<body class="is-preload">

	<form method=get action='${cpath}/boardWriteForm.do'>
		<nav>
			<ul>
				<c:if test="${empty mvo}">
					<li><a href="${cpath}/mainForm.do">Home</a></li>
					<li><a href="${cpath}/savePointList.do">Save Point</a></li>
					<li><a href="" onclick="checkLogin()">Level</a></li>
					<li><a href="${cpath}/boardList.do">Board</a></li>
					<li><a href="" onclick="checkLogin()">My Challenge</a></li>
					<li><a href="" onclick="checkLogin()">My Page</a></li>

				</c:if>
				<c:if test="${!empty mvo}">
					<li><a href="${cpath}/mainForm.do">Home</a></li>
					<li><a href="${cpath}/savePointList.do">Save Point</a></li>
					<li><a href="${cpath}/levelList.do">Level</a></li>
					<li><a href="${cpath}/boardList.do">Board</a></li>
					<li><a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">My
							Challenge</a></li>
					<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My
							Page</a></li>
					<li><a href="${cpath}/logout.do" class="login_btn">Logout</a></li>
				</c:if>

			</ul>
		</nav>

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
									<th>좋아요</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>

								<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<c:set var="volen" value="${fn:length(list)}" />
								<c:forEach var="i" begin="1" end="${volen}" step="1">
									<tr>
										<td>${i}</td>
										<td><a href="boardView.do?num=${list[volen-i].comm_seq}" />${list[volen-i].comm_title} [${list[volen-i].comment_count}]</td>
										<td>${list[volen-i].mb_name}</td>
										<!-- 착해질게요 -->
										<td>${list[volen-i].likes}</td>
										<td>${list[volen-i].comm_cnt}</td>
									</tr>
								</c:forEach>
								<%-- <c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.comm_seq}</td> 
											<td><a href="boardView.do?num=${vo.comm_seq}" />${vo.comm_title}</td>
											<td>${vo.mb_name}</td>
											<!-- 착해질게요 -->
											<td>${vo.comm_cnt}</td>
										</tr>
									</c:forEach> --%>
							</tbody>

						</table>
					</div>
					<div id="aatagking" style="width: 24%; height: 18%;margin-left: 243px;align-items: center;margin-top: 9px;">
					<a id="page" href="">1</a> <a id="page" href="">2</a> <a id="page"
						href="">3</a> <a id="page" href="">4</a> <a id="page" href="">5</a>
					<a id="page" href="">6</a> <a id="page" href="">7</a> <a id="page"
						href="">8</a> <a id="page" href="">9</a> <a id="page" href="">10</a>
						</div>
					<div class="col-12">
						<c:if test="${!empty mvo}">
							<ul class="actions special_board">
								<li><input type="submit" value="글작성" id="goList" /></li>
							</ul>
						</c:if>
					</div>
	</form>
	</section>
	<footer id="footer">
		<ul class="copyright">
			<li>&copy; non-Spending Challenge.</li>
			<li>Design: <a>무지출챌린지</a></li>
		</ul>
	</footer>
</body>

</html>
