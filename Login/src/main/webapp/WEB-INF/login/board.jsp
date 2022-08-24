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
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<header id="header">
				<h1><a href="index.html">non-Spending</a> Challenge</h1>
				<nav id="nav">
					<ul>
						<li><a href="main.html">Home</a></li>
						<li><a href="index.html">Level</a></li>
						<li><a href="boardList.html">Board</a></li>
						<li><a href="index.html">My Challenge</a></li>
						<li><a href="index.html">My Page</a></li>
						<li><a href="#" class="button">Login</a></li>
					</ul>
				</nav>
			</header>

			<!-- Main -->
				<section id="main" class="container">
					<header>
						<h2 id="title">${vo.title}</h2>
						<p id="write">${vo.writer}</p>
						<div id="date">${vo.indate}</div>
					</header>
					<div class="box">
							<div class="row-6 row-12-mobilep">
								<p>${vo.content}</p>
							</div>
						</div>
					</div>
				</section>

				<div class="col-12">
					<ul class="actions special">
						<li><a href="${cpath}/index.do"><input type="submit" value="목록으로" id= "goList"/></a></li>
					</ul>
				</div>
				
			<!-- Footer -->
				<footer id="footer">
					<ul class="copyright">
						<li>&copy; non-Spending Challenge.</li><li>무지출챌린지</li>
					</ul>
					
				</footer>

		</div>
	</body>
</html>

	</div>

	</div>
	</div>

	</div>
	</div>

	<!-- Footer -->
	<footer id="footer">
		<ul class="icons">
			<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
			<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
			<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
			<li><a href="#" class="icon brands fa-google-plus"><span class="label">Google+</span></a></li>
		</ul>
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>
	</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>

</html>

<style>
	.wrap{
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.div_float{
		float: left;
	}
	.buttons_{
		margin-top: 20px;
	}
	.title_{
		margin: 30px 0px 30px 0;
	}
	
</style>