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
	<link rel="stylesheet" href="CSS/header.css" />
	<link rel="stylesheet" href="CSS/mypage.css" />
	<script src="jquery-3.6.0.min.js"></script>
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
		    	<li><a class="login_btn" id="login">Login</a></li>
		    </c:if>
		    <c:if test="${!empty mvo}">
		    <li><a href="${cpath}/mainForm.do">Home</a></li>
			<li><a href="${cpath}/savePointList.do">Save Point</a></li>
			<li><a href="${cpath}/levelList.do">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">My Challenge</a></li>
		   		<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="login_btn">Logout</a></li>
		    </c:if>
			
		</ul>
      </nav>
		<!-- Main -->
		<div class="wrap">
			


			<!-- Form -->
			
				<div id="main" class="container">
					<header>
						<h2 style="	margin-left: 25%;">회원정보 수정</h2>						
					</header>
				<hr style=" width: 91%;"/>
				<h3>개인정보 수정</h3>
				<form method="post" action="${cpath}/myPageEdit.do">
					<div class="row gtr-uniform gtr-50 aaaa">
						<div class="col-6 col-12-mobilep">
							<input type="text" name="Change_PW" id="name" value="" disabled placeholder="${mvo.mb_id}" />
							<input type="hidden" name="mb_id" value="${mvo.mb_id}" id="name"/> 
						</div>
						
						<div class="col-6 col-12-mobilep">
							<input type="text" name="mb_pw" id="name" value="" placeholder="비밀번호 변경" />
						</div>
						<div class="col-6 col-12-mobilep">
							<input type="text" name="mb_pw_confirm" id="name" value="" placeholder="비밀번호 변경 확인" />
						</div>
						
						<div class="col-12 title_">
							
						
						<hr/>
						</div>
						<h3>챌린지 금액 변경</h3>
						<div class="col-6 col-12-mobilep now_money">
							<input type="text" name="Change_PW" id="name" value="" disabled placeholder="현재 금액 : ${mvo.challenge_total}" />
						</div>
						
						<div class="col-6 col-12-mobilep">
						<input type="text" name="challenge_total" id="name" value="${mvo.challenge_total}" placeholder="새로운 금액 입력" />
						</div>
					</div>
				</br>
					<div class="col-12" style="margin-top: 20px;">
						<ul class="actions buttons_" style="float: right;">
							<li><input type="submit" value="수정" class=""/></li>
							<li><input type="reset" value="취소" class="alt" /></li>
							</form>
							<li><a href="${cpath}/memberDelete.do?mb_id=${mb_id}"><input type="button" value="탈퇴" class=""/></a></li>
							
						</ul>
						
						
						
						
					</div>
				</div>
			</div>
		</div>

	</div>

	</div>
	</div>

	</div>
	</div>

	<!-- Footer -->
	<footer id="footer">
		
		<ul class="copyright">
			<li>non-Spending Challenge</li>
			<li> <a href="main.html">무지출챌린지</a></li>
		</ul>
	</footer>

	</div>

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