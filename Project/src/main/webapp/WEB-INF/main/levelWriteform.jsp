<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>

	<head>
		<title>무지출챌린지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cpath}/CSS/level.css" />
		<link rel="stylesheet" href="${cpath}/CSS/header.css" />
	</head>
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
		    	<li><a class="login_btn" id="login">Login</a></li>
		    </c:if>
		    <c:if test="${!empty mvo}">
		    <li><a href="${cpath}/mainForm.do">Home</a></li>
			<li><a href="${cpath}/savePointList.do">Save Point</a></li>
			<li><a href="">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">My Challenge</a></li>
		   		<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="login_btn">Logout</a></li>
		    </c:if>
			
		</ul>
      </nav>
			</br>
			
	<body class="is-preload">
		
		<div id="page-wrapper">

<head>
<title>무지출챌린지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/CSS/level.css" />
<link rel="stylesheet" href="${cpath}/CSS/header.css" />
</head>
<!-- Header -->
<nav>
	<ul>
		<li><a href="${cpath}/mainForm.do">Home</a></li>
		<li><a href="${cpath}/savePoint.do">Save Point</a></li>
		<li><a href="${cpath}/levelList.do">Level</a></li>
		<li><a href="${cpath}/boardList.do">Board</a></li>
		<li><a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">MyChallenge</a></li>
		<li><a href="${cpath}/myPage.do">my page</a></li>
		<li><a href="${cpath}/logout.do" class="login_btn" id="login">Logout</a>
		</li>
	</ul>
</nav>
</br>

<body class="is-preload">

		<!-- Main -->
		<section id="main" class="container medium">
			<header>
				<h2>글 작성</h2>
				<p>게시글 작성 규정을 준수하지 않을 경우 임의로 게시 중단될 수 있음을 안내드립니다.</p>
			</header>

			<div class="box">
				<form method="get" action="${cpath}/levelWrite.do">
					<div class="row gtr-50 gtr-uniform">

						<div class="col-12">
							<input type="text" name="title" id="subject" value=""
								placeholder="글 제목을 입력하세요." />
						</div>
						<div class="col-12">
							<textarea name="content" id="message" placeholder="글 내용을 입력하세요."
								rows="6"></textarea>
							</br>
						</div>
						<div class="col-12">
							<ul class="actions special">
								<li><input type="submit" value="게시하기" id="submit" /></li>
								</br>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</section>
		<footer id="footer">
			<ul class="copyright">
				<li>&copy; non-Spending Challenge.</li>
				<li>Design: <a>무지출챌린지</a></li>
			</ul>
		</footer>
</body>
</html>