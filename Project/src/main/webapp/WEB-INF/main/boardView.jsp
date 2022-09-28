<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>

<style>
#btn_like {
	background-color: #C5DFFF;
	border-radius: 20%;
	border: 1px;
}

.likebox {
	margin-left: 92%;
}
</style>
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
<script src="CSS/jquery-3.6.0.min.js"></script>
<script>
	function goList() {
		location.href = "${cpath}/boardList.do";
	}

	function goUpdate() {
		location.href = "${cpath}/boardUpdateForm.do?num=${vo.comm_seq}";
	}

	function goDelete() {
		location.href = "${cpath}/boardDelete.do?num=${vo.comm_seq}";
	}
	function clickLike() {
		let num = "${vo.comm_seq}"
		$.ajax({
			url : "${cpath}/likes.do",
			type : "post",
			data : {
				"num" : num
			},
			success : function() {
				let text = $("#countLike").html()
				$("#btn_like").html('🧡<h4 id="countLike">'+(text*1+1)+'</h4>') 
			},
			error : function() {
				alert("error")
			}
		})
	}
	function checkLogin(){
		alert("로그인을 해주세요.🐷")
	}
</script>
</head>
<body class="is-preload">
	<!-- Header -->
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
				<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
				<li><a href="${cpath}/logout.do" class="login_btn">Logout</a></li>
			</c:if>

		</ul>
	</nav>
	</br>
	</br>

	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2 id="title">${vo.comm_title}</h2>
			<p id="write">${vo.mb_name}</p>
			<p id="date">${vo.comm_date}</p>

		</header>
		<div class="box">
			<div class="row-6 row-12-mobilep">

				<p>${fn:replace(vo.comm_content, newLineChar , "<br/>")}</p>
			</div>
			<c:if test="${vo.filename != '너무길hgf면gdf안되나fgg'}">
				<c:set var="text2" value="${vo.filename}" />
				<c:set var="text" value="${fn:split(text2,'.')[1]}" />
				<c:if
					test="${text eq 'jpg' or text eq 'png' or text eq 'gif' or text eq 'JPG' or text eq 'PNG' or text eq 'GIF'}">
					<div style="text-align: center;">
						<img src="/imgs/${vo.filename}"
							style="max-width: 600px; height: auto; ,"><br />
					</div>
				</c:if>
				<c:if
					test="${text != 'jpg' and text != 'png' and text != 'gif' and text != 'GIF' and text != 'PNG' and text != 'JPG'}">
					<a href="/imgs/${vo.filename}" id="filename">${vo.filename}</a>
				</c:if>
			</c:if>
			<br />
			<!--좋아요-->
			<div class='likebox'>
				<c:if test="${!empty mvo}">
					<button class="like_btn" id="btn_like"
						onclick="javascript:clickLike()">

				</c:if>
				<c:if test="${empty mvo}">
					<button class="like_btn" id="btn_like">
				</c:if>
				🤍
				<h4 id="countLike">${vo.likes}</h4></button>
				

			</div>
			<!--코멘트창-->
			<form class="comm_comment" action="${cpath}/commWrite.do"
				method="get">
				<!-- boardview로 가기 위한 파라미터 -->
				<h3 style="margin-top: 8%; margin-bottom: -2%;">comment</h3>
				<div class="table-wrapper">
					<table>
						<tbody>
							<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
							<c:forEach var="vo" items="${comment}" varStatus="status">
								<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<tr>
									<td>${status.index + 1}</td>
									<td>${vo.comm_cmt_content}</td>
									<td>${vo.mb_name}</td>
								</tr>
							</c:forEach>
							</br>
							</br>
						</tbody>
					</table>
					<input type="hidden" name="num" value=${vo.comm_seq}>
					<div class="col-9 col-12-mobilep">
						<c:if test="${!empty mvo}">
							<input type="text" name="comment" id="query" value
								placeholder="댓글을 입력하세요" style="width: 88%;">
							<input type="submit" value="작성" style="background-color: #141A35">
						</c:if>
					</div>
			</form>
		</div>
		</div>
	</section>
	<div class="col-12">
		<ul class="actions special">
			<li><input type="button" value="목록으로" id="goList"
				onclick="goList()" /></li>

			<c:if test="${vo.mb_id eq mvo.mb_id}">
				<li><input type="button" value="수정하기" id="update"
					onclick="goUpdate()" /></li>
				<li><input type="button" value="삭제하기" id="delete"
					onclick="goDelete()" /></li>
			</c:if>
		</ul>
	</div>
	</br>
	</br>

	</div>


	<footer id="footer">
		<ul class="copyright">
			<li>&copy; non-Spending Challenge.</li>
			<li>Design: <a>무지출챌린지</a></li>
		</ul>
	</footer>
</body>
</html>