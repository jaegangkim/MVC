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
		<link rel="stylesheet" href="${cpath}/CSS/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1><a href="index.html">non-Spending</a> Challenge</h1>
					<nav id="nav">
						<ul>
							<li><a href="main.html">Home</a></li>
							<li><a href="savePoint.html">Save Point</a></li>
							<li><a href="index.html">Level</a></li>
							<li><a href="boardList.html">Board</a></li>
							<li><a href="index.html">My Challenge</a></li>
							<li><a href="index.html">My Page</a></li>
							<li><a href="#" class="button">Login</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<section id="main" class="container medium">
					<header>
						<h2>글 수정</h2>
						<p>게시글 작성 규정을 준수하지 않을 경우 임의로 게시 중단될 수 있음을 안내드립니다. </p>
					</header>

					<div class="box">
						<form method="post" action="${cpath}/boardUpdate.do?num=${vo.comm_seq}">
							<div class="row gtr-50 gtr-uniform">
								
								<div class="col-12">
									<input type="text" name="title" id="subject" value="${vo.comm_title}" placeholder="글 제목을 입력하세요." />
								</div>
								<div class="col-12">
									<textarea name="content" id="message" placeholder="글 내용을 입력하세요." rows="6">${vo.comm_content}</textarea>
								</div>
								<div class="col-12">
									<ul class="actions special">
										<li><input type="submit" value="수정하기" id= "submit"/></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</section>

	</body>
</html>