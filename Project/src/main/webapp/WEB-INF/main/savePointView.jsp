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
				<link rel="stylesheet" href="${cpath}/CSS/header.css" />
		
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

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
				<section id="main" class="container">
					<header>
					<br>
					<br>
						<h2 id="title">${vo.save_title }</h2>
						<p id="write">관리자</p>
						<p id="date">${vo.save_date}</p>
						
					</header>
					<div class="box">
							<div class="row-6 row-12-mobilep">
								<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<tr>
									
									<p>${vo.save_content}<br></p>
									
								</tr>
								</br>
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
				location.href=("${cpath}/savePointList.do")
			}
		</script>
	</body>
</html>