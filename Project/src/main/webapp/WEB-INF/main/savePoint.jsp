<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>Generic - Alpha by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${cpath}/CSS/main.css" />
<link rel="stylesheet" href="CSS/header.css" />

<script src="jquery-3.6.0.min.js"></script>
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
      
      <!--이벤트-->
<section class="box">
	<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br><br><br>
	<img src="img/보조금.png"style="position: absolute;left:5.5%; width: 90%;height: 69%;top:17.8%;">	
	<img src="img/보조금_배경.png"style="position: absolute;left:15.5%; width: 76%;height: 49%;top:25.8%;">
	<img src="img/그림1.jpg"style="width:23%;position: absolute;left:18%;top:29.8%">
	<img src="img/그림2.jpg"style="width:23%;position: absolute;left:42%;top:29.8%">
	<img src="img/그림3.jpg"style="width:23%;position: absolute;left:66%;top:29.8%">
	<img src="img/라디오.png"style="width:2%;position: absolute;left: 51%;top:76.8%">
	<img src="img/보조금_사람.png"style="width:25%;position: absolute;left:7%;top:56%">
	<img src="img/보조금_제목.png"style="position: absolute;left:5.5%; width: 23%;height: 28%;top:16.5%;">
</section>
      
		<!--글목록-->
		<div class="row">
			<div class="col-12">

				<!-- Table -->
				<section class="box" style="padding-bottom: 2em;">
					<h3>정보게시판</h3>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
								<!-- 컨트롤러에서 setAttribute가 넘어온다 -->
								<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.save_seq}</td>
									<td><a href="savePointView.do?num=${vo.save_seq}"/>${vo.save_title}</td>
									<td>${vo.save_write}</td>
								</tr>
								</c:forEach>
							</tbody>


						</table>
					</div>
                     <div id="kinguri"style="width: 24%; height: 18%;margin-left: 345px;align-items: center;margin-top: 5px;">
					<a id="page" href="">1</a> <a id="page" href="">2</a> <a id="page"
						href="">3</a> <a id="page" href="">4</a> <a id="page" href="">5</a>
					<a id="page" href="">6</a> <a id="page" href="">7</a> <a id="page"
						href="">8</a> <a id="page" href="">9</a> <a id="page" href="">10</a>
						</div>
</body>

</html>