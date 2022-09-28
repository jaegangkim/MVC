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
		<link rel="stylesheet" href="CSS/main copy.css" />
		<link rel="stylesheet" href="CSS/header.css" />
		<link rel="stylesheet" href="CSS/모달.css" />
		<link rel="stylesheet" href="CSS/연습.css" />
    	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    	<script src="CSS/jquery-3.6.0.min.js"></script>
		<meta name="description" content="" />
		<meta name="author" content="" />
		<style></style>
	</head>
	<body class="landing is-preload">
		<div id="page-wrapper">
    <!-- Header -->
    <nav>
        <ul>
        <!-- 로그인 안했을때 -->
			<c:if test="${empty mvo}">
			<li><a href="">Home</a></li>
			<li><a href="${cpath}/savePointList.do">Save Point</a></li>
			<li><a href="" onclick="checkLogin()">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="" onclick="checkLogin()">My Challenge</a></li>
			<li><a href="" onclick="checkLogin()">My Page</a></li>
		    	<li><a class="login_btn" id="login">Login</a></li>
		    </c:if>
		    <!-- 로그인 했을때 -->
		    <c:if test="${!empty mvo}">
		    <li><a href="">Home</a></li>
			<li><a href="${cpath}/savePointList.do">Save Point</a></li>
			<li><a href="${cpath}/levelList.do">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">My Challenge</a></li>
		   		<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="login_btn">Logout</a></li>
		    </c:if>
			
		</ul>
      </nav>

	<!-- Banner -->
	<section id="banner">
		
<img src="img/타이틀3.png" style="width: 25%;top: 100px;"/>
	</br>
<c:if test="${empty mvo}">
	<input type="hidden" class="btn-open-popup" id="btn_inputMoney">
	<img src="img/돼지.png" class="icon" style="top: 47%;width: 20%; left: 56.5%;"/>
	<input id="modalToggle" class="hide" type="checkbox">
				<section class="modal">
	</c:if>
<c:if test="${!empty mvo}">
<p>${mvo.mb_name}님 환영합니다.</p>
<img src="img/돼지.png" class="icon" style="top: 47%;width: 20%; left: 56.5%;"/>
<input id="modalToggle" class="hide" type="checkbox">
				<section class="modal">
<label class="btn btn-open" for="modalToggle">지출 입력</label> 
</c:if> 

		
			
				  <div class="inside">
					<label class="btn-close" for="modalToggle">X</label>
				<!--지출입력-->
				<form action="${cpath}/challenge.do">
				<div>
					<img src="img/지출반성문2.png" style="width: 40%;margin-left: 3%;margin-top:1.5%;">
					<input type="hidden" name="aaa" value="bbb"/>
					<input type="hidden" name="mb_id" value="${mvo.mb_id}"/> 

					<!--쇼핑-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 32.8%;left: 43.3%;">
						<input type="radio" id="shopping" name="priority" value="1" checked="">
						<label for="shopping"></label>
					</div>
					<!--식-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 37.8%;left:  43.3%;">
						<input type="radio" id="food" name="priority" value="2">
						<label for="food"></label>
					</div>
					<!--여가-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 43.8%;left: 43.3%;">
						<input type="radio" id="life" name="priority" value="3">
						<label for="life"></label>
					</div>
					<!--교통-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 49.8%;left: 43.3%;">
						<input type="radio" id="trans" name="priority" value="4">
						<label for="trans"></label>
					</div>
					<!--기타-->
					<div class="col-4 col-12-narrower" style="position: absolute; top: 55.8%;left:  43.3%;">
						<input type="radio" id="etc" name="priority" value="5">
						<label for="etc"></label>
					</div> 
					<input class ="form-control"type="text" name="pay_money" style="width: 120px;height: 10px; position: absolute; top:63.5%;left: 45.2%;color: black;"placeholder='지출금 입력'/>
				  </div>
				  <div class="col-12">
					<ul class="actions special">
					<!-- 확인 -->
						<li><input type="submit" value="반성하기" onclick="over()" id= "input_Money" style="position: absolute; top:79.8%; left: 45.5%;"/></li>
					
					</ul>
				
				</div>
				</form>
				</div>
				</section>
				<script>
		function over(){
			if(${mvo.challenge_total < sum}){
				alert("으이구~~돈 좀 아껴써라~🤦‍🤦‍♂️🤦💸💸💸💸💸")
			}
		}</script>


				</section>
				
				

				  <div class="modal_login">
					
					<div class="modal_login_body">
									
					  <div class="container">
						<div class="">
							<div class="">
								<div class="">

									<div class="card-header"><h1 class="login_title">&nbsp;</h1></div>
									<img src="img/동전_됒.gif" style="position: absolute;left: 42.8%;width: 15%;top:8%;">
									</br>
									<span class="Welcom">무지출챌린지에 오신것을 </br>환영합니다
									</span>
									<div class="card_login-body">
								
										<form action="${cpath}/login.do">
											<div class="">
												<input class="form-control" name="mb_id" style="border-radius: 10px;height: 20px;top:80%;width: 103%;" id="inputId" type="text" placeholder="아이디를 입력하세요."  required/>
												
											</div>
											<div class="form-floating mb-3" style="margin-bottom: 50px;">
												<input class="form-control" name="mb_pw" style="border-radius: 10px;height: 20px;width: 103%;" id="inputPassword" type="password" placeholder="비밀번호를 입력하세요."  required/>
											</div>
											<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
												<button type="submit" class="btn-primary_login" style="left: 37.5%;">Login</a>
												
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
<!-- 인스타 -->
<br>
<br>
<h2 style="text-align: left;text-align: center;">무지출챌린지 공식 계정</h2>
<iframe src="https://snapwidget.com/embed/1008851" class="snapwidget-widget" allowtransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden;  width:900px; height:400px"></iframe>
<!--글목록-->

<!--글목록-->
<div class="row">
	<div class="col-12">

		<!-- Table -->
			<section class="box">
				<h2 style="text-align: left;text-align: center;">인기글</h2>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>순위</th>
								<th>제목</th>
								<th>작성자</th>
								<th>좋아요</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" begin="1" end="5" step="1">
							  <tr>
								<td>${i}</td>  
								<td><a href="${cpath}/boardView.do?num=${list[i-1].comm_seq}" style="text-decoration-line:none;">${list[i-1].comm_title} [${list[i-1].comment_count}]</a></td>
								<td>${list[i-1].mb_name}</td>
								<td>${list[i-1].likes }
							  </tr>
							</c:forEach>
						</tbody>
						
					</table>

		</div>
		</div></div>
		<footer id="footer">
			<ul class="copyright">
				<li>&copy; non-Spending Challenge.</li><li>Design: <a>무지출챌린지</a></li>
			</ul>
		</footer>
		<script>
		
			
			/*모달스크립트*/
			const body_login = document.querySelector('body');
			const modal_login = document.querySelector('.modal_login');
			const btnOpenPopup_login = document.querySelector('.login_btn');
	  
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
			
			function checkLogin(){
				alert("로그인을 해주세요.🐷")
			}
		  </script>
		  
	
	</body>
	
</html>