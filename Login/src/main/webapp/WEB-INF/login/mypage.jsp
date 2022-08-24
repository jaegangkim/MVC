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
	
	<link rel="stylesheet" href="css/mypage.css" />
	<script src="jquery-3.6.0.min.js"></script>
</head>

<body class="is-preload">
	
	<%-- <form action="${cpath}/edit.do">
        <input type="hidden" name="memId" value="${mvo.memId}">
        <input type="hidden" name="memPwd" value="${mvo.memPwd}">
    </form> --%>
	
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1><a href="index.html">non-Spending</a> Challenge</h1>
			<nav id="nav">
				<ul>
					<li><a href="${cpath}/index.do">Home</a></li>
					<li><a href="">Level</a></li>
					<li><a href="${cpath}/board.do">Board</a></li>
					<li><a href="">My Challenge</a></li>
					<li><a href="">My Page</a></li>
					<li><a href="login0822.html" class="button">Sign Up</a></li>
				</ul>
			</nav>
		</header>
		<!-- Main -->
		<div class="wrap">
			


			<!-- Form -->
			<div class="box">
				<div id="main" class="container">
					<header>
						<h2>회원정보 수정</h2>
						<hr/>
						
					</header>
				<h3>개인정보 수정</h3>
				<form method="post" action="">
					<div class="row gtr-uniform gtr-50 aaaa">
						<div class="col-6 col-12-mobilep">
							<input type="text" name="" id="name" value="" disabled placeholder="${memId}" /> <%-- ${mvo.memId} --%>
						</div>
						<div class="col-6 col-12-mobilep">
							<input type="text" name="memPwd" id="name" value="" placeholder="비밀번호변경" />
						</div>
						<div class="col-6 col-12-mobilep">
							<input type="text" name="memPwd_confirm" id="name" value="" placeholder="비밀번호변경 확인" />
						</div>
						<div class="col-6 col-12-mobilep">
							<div class="div_float">
								<input type="text" name="memName" id="name" value="" style="width: 250px;" placeholder="${memName}" />
							</div>
							
							<div class="div_float" style="margin-left: 10px;">
								<button class>중복확인</button>
							</div>
						</div>
						<div class="col-12 title_">
							
							<hr />

						</div>

						
						<h3>챌린지 금액</h3>

						<div class="col-6 col-12-mobilep now_money">
							<input type="text" name="Change_PW" id="name" value="" disabled placeholder="현재 금액 가져오기" />
						</div>

						<div class="col-6 col-12-mobilep">
						<input type="text" name="Change_PW" id="name" value="" placeholder="새로운 금액 입력" />
						</div>
					</div>
					<div class="col-12" style="margin-top: 20px;">
						<ul class="actions buttons_" style="float: right;">
							<li><input type="submit" value="수정" /></li>
							<li><input type="reset" value="취소" class="alt" /></li>
							<li><a href="${cpath}/memberDelete.do"><input type="button" value="탈퇴"/></a></li>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>


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