<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>Generic - Alpha by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cpath}/CSS/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<header id="header">
				<h1><a href="main.html">non-Spending</a> Challenge</h1>
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

			<!-- Main -->
				<section id="main" class="container">
					<header>
						<h2 id="title">글제목</h2>
						<p id="write">작성자</p>
						<div id="date">날짜</div>
					</header>
					<div class="box">
							<div class="row-6 row-12-mobilep">
								<p>광주는 코로나걸리면 돈 안주나요?</br></p>
							</div>
							<!--코멘트창-->
		
						</div>
						
					</div>
				</section>


				<div class="col-12">
					<ul class="actions special">
						<li><input type="submit" value="목록으로" id= "goList"/></li>
					</ul>
				</div>
				
		
		</div>
		<script>
			document.getElementById("goList").onclick=function(){
				location.href=("savePoint.html")
			}
		</script>
	</body>
</html>