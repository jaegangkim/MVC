<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
 <head>
  <link href="https://fonts.googleapis.com/css?family=Habibi&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="css/main2.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
	<head>
		<title>무지출챌린지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="./main.css" />
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
			<li><a href="index.html">Home</a></li>
			<li><a href="index.html">Level</a></li>
			<li><a href="index.html">Board</a></li>
			<li><a href="index.html">My Challenge</a></li>
			<li><a href="index.html">My Page</a></li>
			<li><a href="#" class="button">Sign Up</a></li>
		</ul>
	</nav>
</header>


			<!-- Banner -->
				<section id="banner">
					<h2>Welcome </br>non-Spending Challenge</h2>
					<p>무지출챌린지를 시작해보세요</p>
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
							<tr>
								<td>1</td>
								<td><a href="">오늘 무지출챌린지 현황</a></td>
								<td>궁상이</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="">도지코인 기사님 온다</a></td>
								<td>머스크</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="">오늘 가입했어요</a></td>
								<td>지출이</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="">영상 봐줄사람</a></td>
								<td>한문철</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="">프로젝트 캐리 후기</a></td>
								<td>이윤호</td>
							</tr>
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








<!-- 
<body>
    <div class="v38_35">
        <div class="v38_3">
            <a class="v30_7" href="">Home</a>
            <a class="v30_8" href="">Level</a>
            <a class="v30_9" href="${cpath}/board.do">Board</a>
            <a class="v33_12" href="">My
Challenge</a>
<a class="v38_2" href="">My
    Page</a>
</div>
<div class="v38_15">
    <span class="v38_5">Hot Issue</span>
    <div class="v38_7"></div>
    <div class="v38_8"></div>
    <div class="v38_10"></div>
    <div class="v38_14"></div>
    <div class="v38_9"></div>
</div>
<div class="v38_16"><div class="v30_6"></div><span class="v38_12">non - 
    Spending
    Challenge</span>
     <c:if test="${empty mvo}">
    <a class="v38_31" href="${cpath}/loginForm.do">LOGIN</a><a class="v38_32" href="${cpath}/signupForm.do">JOIN</a></div><div class="v38_33"><div class="v38_20"></div>
    </c:if>
    <c:if test="${!empty mvo}">
    <form action="${cpath}/logout.do">
    <a name="memName">${mvo.memName}</a>
    <button type="submit">Logout</button>
    </form> 
    </c:if>
    <select class="v38_21">
    <option disabled selected>2022</option>
  </select>
  <select class="v38_25">
    <option >선택</option>
    <option  value="cloth">옷</option>
    <option  value="food">식비</option>
    <option  value="live">주거</option>
    <option  value="trans">교통</option>
    <option  value="ect">기타</option>
  </select>
    <input class="v38_26" id="user_inputMoney" placeholder="금액을 입력하세요" />
    
    <select class="v38_23">
    <option disabled selected>09</option>
    </select>
    <select class="v38_24">
      <option disabled selected>05</option>
      </select>

      <div class="wrap">
        <button class="button">입력</button>
      </div>


    <span class="v38_19">Quick Input</span></div><div class="v38_30"></div><span class="v30_5">non-Spending     
    Challenge</span></div></body></html> <br/><br/> -->