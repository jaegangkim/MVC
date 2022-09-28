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
		<link rel="stylesheet" href="css/main.css" />
		<script src="jquery-3.6.0.min.js"></script>
    	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		<meta name="description" content="" />
		<meta name="author" content="" />
	</head> 

	<body class="is-preload">
		<div id="page-wrapper">
<!-- Header -->
<header id="header">
	
	<h1><a href="main.html">non-Spending</a> Challenge</h1>
	<nav id="nav">
		<ul>
			<li><a href="${cpath}/mainForm.do">Home</a></li>
			<li><a href="savePoint.html">Save Point</a></li>
			<li><a href="main.html">Level</a></li>
			<li><a href="${cpath}/totalboard.do">Board</a></li>
			<li><a href="main.html">My Challenge</a></li>
			
			
			<c:if test="${empty mvo}">
		    	<li><button class="btn-open-popup_login" id="login">Login</button></li> 
		    	<li><a href="${cpath}/mainForm.do?mb_id=${mvo.mb_id}">My Page</a></li>
		    </c:if>
		    <c:if test="${!empty mvo}">
		   		<li><a href="${cpath}/mypage.do?mb_id=${mvo.mb_id}">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="button">Logout</a></li>
		    </c:if>
			
		</ul>
	</nav>
</header>

	<section id="banner">
	
		<img src="img/돈2.png" style="position: absolute; width: 10%;top:40%; left: 35%;" />
<img src="img/타이틀3.png" style="width: 20%;"/>
</br>
</br>
					    <img src="img/돼지.png" class="icon" style="top: 32%;width: 16%;left: 55%;"/>
					<c:if test="${empty mvo}">
				    	<p>무지출챌린지를 시작해보세요</p>
				    	<input type="hidden" class="btn-open-popup" id="btn_inputMoney">
				    </c:if> 
					<c:if test="${!empty mvo}">
					    <p>${mvo.mb_name}님 환영합니다.</p>
					    <button class="btn-open-popup" id="btn_inputMoney">지출입력</button> 
				    </c:if> 
				    
				</section>
				<div class="modal">
					<div class="modal_body">
						<img src="img/지출반성문2.png" style="width: 100%;margin-left: 29%;margin-top: 18%;">
					<!--숫자입력-->
					<form action="${cpath}/challenge.do">
					<input type="text" name="pay_money" style="width: 130px;height: 10px; position: absolute; top:57%;left: 62.8%;" placeholder="지출금 입력" ve/>	
					<input type="hidden" name="mb_id" value="${mvo.mb_id}"/> 
					<!--쇼핑-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 34.6%;left: 63.8%;">
						<input type="radio" id="shopping" name="priority" checked="" value="1">
						<label for="shopping"></label>
					</div>
					<!--식-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 39.1%;left: 63.8%;">
						<input type="radio" id="food" name="priority" value="2">
						<label for="food"></label>
					</div>
					<!--여가-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 43.6%;left: 63.8%;">
						<input type="radio" id="life" name="priority" value="3">
						<label for="life"></label>
					</div>
					<!--교통-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 48.1%;left: 63.8%;">
						<input type="radio" id="trans" name="priority" value="4">
						<label for="trans"></label>
					</div>
					<!--기타-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 52.7%;left: 63.8%;">
						<input type="radio" id="etc" name="priority" value="5">
						<label for="etc"></label>
					</div>

					<div class="col-12">
						<ul class="actions special">
							<li><input type="submit" value="반성하기" id= "input_Money" style="position: absolute; top:69.5%; left: 63%;"/></li>
						</ul>
					
					</div>
						</form>
					</div>
			  
				  </div>

				  <div class="modal_login">
					<div class="modal_login_body">
					  <div class="container">
						<div class="">
							<div class="">
								<div class="">
									<div class="card-header"><h1 class="login_title">Login</h3></div>

			  
									<span class="Welcome">무지출챌린지에 오신것을 환영합니다
									</span>
									<div class="card_login-body">
										<form action="${cpath}/login.do">
											<div class="">
												<input class="form-control" name="mb_id" style="border-radius: 10px" id="inputId" type="text" placeholder="아이디를 입력하세요."  required/>
												
											</div>
											<div class="form-floating mb-3" style="margin-bottom: 50px;">
												<input class="form-control" name="mb_pw" style="border-radius: 10px" id="inputPassword" type="password" placeholder="비밀번호를 입력하세요."  required/>
											</div>
											<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
												<button type="submit" class="btn-primary_login">Login</button>
											</div>
										</form>
									</div>
								  </br>
									<div class="card-footer text-center py-3">
										<div class="small"><a href="${cpath}/signupForm.do">아직 계정이 없으신가요? </br>지금 가입하세요!</a></div>
									</div>
								</div>
							</div>
						</div>
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
								<td><a href="${cpath}/boardView.do?num=${list[i-1].comm_seq}">${list[i-1].comm_title}</a></td>
								<td>${list[i-1].mb_id}</td>
							  </tr>
							</c:forEach>
						</tbody>
						
					</table>
				</div>

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
			/*모달스크립트*/
			const body_login = document.querySelector('body');
			const modal_login = document.querySelector('.modal_login');
			const btnOpenPopup_login = document.querySelector('.btn-open-popup_login');
	  
			btnOpenPopup_login.addEventListener('click', () => {
			  modal_login.classList.toggle('show');
	  
			  if (modal_login.classList.contains('show')) {
				body_login.style.overflow = 'hidden';
			  }
			});
	  
			modal_login.addEventListener('click', (event) => {
			  if (event.target === modal_login) {
				modal_login.classList.toggle('show');
	  
				if (!modal_login.classList.contains('show')) {
				  body_login.style.overflow = 'auto';
				}
			  }
			});
		  </script>
		  
	
	</body>
</html>