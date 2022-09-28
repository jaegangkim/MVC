<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>Contact - Alpha by HTML5 UP</title>
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
					</br>

		<!-- Main -->
		<section id="main" class="container medium">
			<header>
				<h2>글 작성</h2>
				<p>게시글 작성 규정을 준수하지 않을 경우 임의로 게시 중단될 수 있음을 안내드립니다.</p>
			</header>

			<div class="box">
				<form method="post" action="${cpath}/boardWrite.do">
					<div class="row gtr-50 gtr-uniform">
						<input type = "hidden" name = "comm_seq" value = "${comm_seq}"/>
						<div class="col-12">
							<input type="text" name="title" id="subject" value="" 
								placeholder="글 제목을 입력하세요." />
						</div>
						<div class="col-12">
							<textarea name="content" id="message" placeholder="글 내용을 입력하세요."
								rows="6"></textarea>
						</div>
						<div class="col-12">
							<ul class="actions special">
								<li><input type="submit" value="게시하기" id="submit" /></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</section>
				<footer id="footer">
					<ul class="copyright">
						<li>&copy; non-Spending Challenge.</li><li>Design: <a>무지출챌린지</a></li>
					</ul>
				</footer>
</body>
</html>