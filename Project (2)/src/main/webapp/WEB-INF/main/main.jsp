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
		<title>무지출챌린지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cpath}/CSS/main copy.css" />
		<link rel="stylesheet" href="${cpath}/CSS/header.css" />
		<link rel="stylesheet" href="${cpath}/CSS/모달.css" />
		<link rel="stylesheet" href="${cpath}/CSS/연습.css" />
    	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		<meta name="description" content="" />
		<meta name="author" content="" />
	</head>
	<body class="landing is-preload">
	
<!-- Header -->
<header id="header">
	<h1><a href="index.html">non-Spending</a> Challenge</h1>
	<nav id="nav">
		<ul>
			<li><a href="${cpath}/mainForm.do">Home</a></li>
			<li><a href="">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="">My Challenge</a></li>

			
			<c:if test="${empty mvo}">
		    	<li><a href="${cpath}/loginForm.do" class="button">Login</a></li>
		    </c:if>
		    <c:if test="${!empty mvo}">
		   		<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="button">Logout</a></li>
		    </c:if>
			
		</ul>
	</nav>
</header>
  
			<!-- Banner -->
				<section id="banner">
					<h2>Welcome </br>non-Spending Challenge</h2>
					<c:if test="${empty mvo}">
				    	<p>무지출챌린지를 시작해보세요</p>
				    </c:if>
				    <c:if test="${!empty mvo}">
					    <p>${mvo.mb_name}님 환영합니다.</p>
					    <button class="btn-open-popup" id="btn_inputMoney">지출 입력하기</button> 
				    </c:if>
				</section>
				<form action="${cpath}/challenge.do">
				<input type="hidden" name="mb_id" value="${mvo.mb_id}"/>
				<div class="modal">
					<div class="modal_body">
						<h2>지출 입력</h2>
						<div class="col-12">
							<input type="text" id="user_inputMoney" name="pay_money" placeholder="지출액을 입력하세요" />
						</br>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="shopping" name="choice" value="1">
								<label for="shopping" name="shopping">쇼핑</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="food" name="choice" value="2">
								<label for="food" name="food">식비</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="live" name="choice" value="3">
								<label for="live" name="live">여가</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="trans" name="choice" value="4">
								<label for="trans" name="trans">교통</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="etc" name="choice" value="5">
								<label for="etc" name="etc">기타</label>
							</div>
							<div class="col-12">
								<ul class="actions special">
									<li><input type="submit" value="입력하기" id= "input_Money"/></li>
								</ul>
							</div>
						</div>
				
					</div>
			  
				  </div>
				  </form>


<!--글목록-->
<div class="row">
	<div class="col-12">

		<!-- Table -->
			<section class="box">
				<h3>인기글</h3>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>순위</th>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>   
							<c:forEach var="i" begin="1" end="5" step="1">
							  <tr>
								<td>${i}</td>
								<td><a href="${cpath}/boardView.do?num=${list[i-1].comm_seq}">${list[i-1].comm_title}</a></td>
								<td>${list[i-1].mb_id}</td>
							  </tr>
							</c:forEach>
						</tbody>
						
					</table>
				</div>

		</div>
		
		<script>
			const body = document.querySelector('body');
			const modal = document.querySelector('.modal');
			const btnOpenPopup = document.querySelector('.btn-open-popup');
	  
			btnOpenPopup.addEventListener('click', () => {
			  modal.classList.toggle('show');
	  
			  if (modal.classList.contains('show')) {
				body.style.overflow = 'hidden';
			  }
			});
	  
			modal.addEventListener('click', (event) => {
			  if (event.target === modal) {
				modal.classList.toggle('show');
	  
				if (!modal.classList.contains('show')) {
				  body.style.overflow = 'auto';
				}
			  }
			});
			
		  </script>
	
	</body>
</html>