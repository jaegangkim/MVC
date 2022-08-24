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
		<link rel="stylesheet" href="css/main.css">
    	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		<meta name="description" content="" />
		<meta name="author" content="" />
	</head>
	<style>
		.modal {
		  position: absolute;
		  top: 0;
		  left: 0;
  
		  width: 100%;
		  height: 100%;
  
		  display: none;
  
		  background-color: rgba(0, 0, 0, 0.4);
		}
  
		.modal.show {
		  display: block;
		}
  
		.modal_body {
		  position: absolute;
		  top: 50%;
		  left: 50%;
  
		  width: 400px;
		  height: 600px;
  
		  padding: 40px;
  
		  text-align: center;
  
		  background-color: #ffffff;
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 #141A35;
  
		  transform: translateX(-50%) translateY(-50%);
		}
	  </style>
	<body class="landing is-preload">
		<div id="page-wrapper">
<!-- Header -->
<header id="header">
	<h1><a href="index.html">non-Spending</a> Challenge</h1>
	<nav id="nav">
		<ul>
			<li><a href="">Home</a></li>
			<li><a href="">Level</a></li>
			<li><a href="${cpath}/totalboard.do">Board</a></li>
			<li><a href="">My Challenge</a></li>

			
			<c:if test="${empty mvo}">
		    	<li><a href="${cpath}/loginForm.do" class="button">Login</a></li>
		    </c:if>
		    <c:if test="${!empty mvo}">
		   		<li><a href="${cpath}/myPage.do">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="button">Logout</a></li>
		    </c:if>
			
		</ul>
	</nav>
</header>
  <%-- <c:if test="${!empty mvo}">
    <form action="${cpath}/myPage.do">
        <input type="hidden" name="memId" value="${mvo.memId}">
        <input type="hidden" name="memPwd" value="${mvo.memPwd}">
    </form>
  </c:if> --%>
			<!-- Banner -->
				<section id="banner">
					<h2>Welcome </br>non-Spending Challenge</h2>
					<c:if test="${empty mvo}">
				    	<p>무지출챌린지를 시작해보세요</p>
				    </c:if>
				    <c:if test="${!empty mvo}">
					    <p>${mvo.memName}님 환영합니다.</p>
				    </c:if>
					
						<button class="btn-open-popup" id="btn_inputMoney">지출 입력하기</button>
				</section>
				<div class="modal">
					<div class="modal_body">
						<h2>지출 입력</h2>
						<div class="col-12">
							<input type="text" id="user_inputMoney" value="" placeholder="지출액을 입력하세요" />
						</br>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="shopping" name="priority" checked="">
								<label for="shopping">쇼핑</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="food" name="priority">
								<label for="food">식비</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="live" name="priority">
								<label for="live">주거</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="trans" name="priority">
								<label for="trans">교통</label>
							</div>
							<div class="col-4 col-12-narrower">
								<input type="radio" id="etc" name="priority">
								<label for="etc">기타</label>
							</div>
							<div class="col-12">
								<ul class="actions special">
									<li><input type="submit" value="입력하기" id= "input_Money"/></li>
								</ul>
							</div>
							<form>
								
							</form>
						</div>
				
					</div>
			  
				  </div>


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
								<td><a href="${cpath}/boardView.do?num=${list[i-1].num}">${list[i-1].title}</a></td>
								<td>${list[i-1].writer}</td>
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